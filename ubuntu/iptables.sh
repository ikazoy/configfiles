#!/bin/sh

# テーブル初期化
/sbin/iptables -F
# 定義チェインを削除
/sbin/iptables -X

# デフォルトルールの設定（受信:破棄, 送信:許可, 通過:破棄）
/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -P FORWARD DROP

# 自ホストからのアクセスを許可
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT

# プライベートIPアドレスからのアクセスを破棄
/sbin/iptables -A INPUT -s 10.0.0.0/8 -j DROP
/sbin/iptables -A INPUT -s 172.16.0.0/12 -j DROP
/sbin/iptables -A INPUT -s 192.168.0.0/16 -j DROP

# ping を許可
/sbin/iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# 内部から行ったアクセスに対する外部からの返答アクセスを許可
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# 拒否IPからのアクセスを破棄
# 拒否IPは /etc/iptables/drop_ip に1行ごとに記述する
if [ -s /etc/iptables/drop_ip ]; then
	for ip in `cat /etc/iptables/drop_ip`
	do
	/sbin/iptables -I INPUT -s $ip -j DROP
	done
fi

# 各サービスで使用するポートを許可
# HTTP
/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT
# HTTPS
/sbin/iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# ssh
/sbin/iptables -A INPUT -p tcp --dport 12345 -j ACCEPT

# 上記のルールにマッチしなかったアクセスはログを記録して破棄
/sbin/iptables -A INPUT -m limit --limit 1/s -j LOG --log-prefix '[IPTABLES INPUT] : '
/sbin/iptables -A INPUT -j DROP
/sbin/iptables -A FORWARD -m limit --limit 1/s -j LOG --log-prefix '[IPTABLES FORWARD] : '
/sbin/iptables -A FORWARD -j DROP

# 保存
/sbin/iptables-save > /etc/iptables/iptables.rule
