#!/bin/sh
# Add Repository
brew tap homebrew/versions || true || true
brew tap phinze/homebrew-cask || true || true
brew tap homebrew/binary || true || true
# Brew Update
brew update || true || true
# Brew Cask
brew install brew-cask || true || true
# Packages
brew install --disable-etcdir zsh || true || true
brew install vim || true || true
brew install curl || true || true
brew install wget || true || true
brew install tmux || true || true
brew install git || true || true
brew install tig || true || true
brew install openssl || true || true
brew install zsh || true || true
brew install automake || true || true
brew install cmake || true || true
brew install python3 || true || true
brew install ruby-build || true || true
brew install rbenv || true || true
brew install cpanminus || true || true
brew install mysql || true || true
brew install sqlite || true || true
brew install mongodb || true || true
brew install memcached || true || true
brew install nginx ||  true || true
brew install ag || true || true
brew install docker || true || true
brew install boot2docker || true || true
brew install bash-completion || true || true
brew install ngrok || true || true
# Cask Packages
brew cask install iterm2 || true || true
brew cask install evernote || true || true
brew cask install dropbox || true || true
brew cask install skype || true || true
brew cask install sequel-pro || true || true
brew cask install firefox || true || true
brew cask install google-chrome || true || true
brew cask install virtualbox || true || true
brew cask install vagrant || true || true
brew cask install sublime-text || true || true
brew cask install google-japanese-ime || true || true
brew cask install google-drive || true || true
brew cask install spotify || treu || true
brew cask install keyremap4macbook || true || true
brew cask install appcleaner || true || true
brew cask install clipmenu || true || true
brew cask install bartender || true || true
brew cask install sqwiggle || true || true
brew cask install mou || true || true
brew cask install coteditor || true || true
brew cask install xtrafinder || true || true
brew cask install caffeine || true || true
brew cask install bettertouchtool || true || true
brew cask install filezilla || true || true
brew cask install seil || true || true
brew cask install github || true || true
brew cask install optimal-layout || true || true
brew cask install gyazo || true || true
brew cask install android-file-transfer || true || true
brew cask install ngrok || true || true
brew cask install onepassword || true || true
