echo "Starting setup"

echo "Installing Hombrew and packages"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade


# Packages
brew_apps=(
  ack
  git
  gitkraken
  heroku/brew/heroku
  imagemagick
  jmeter
  macvim
  mongodb
  mono
  nvm
  elixir
  phantomjs
  postgresql
  python3
  redis
  smlnj
  tmux
  tree
  wget
  zsh
)

brew install "${brew_apps[@]}"
brew link macvim

# Install RVM and Ruby gems
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

rvm install 2.4.1
rvm default 2.4.1

sudo gem install bundler
sudo gem install rails

# Install NVM and Node
nvm install 6
nvm alias default 6

# npm global packages
packages=(
  nodemon
  npm
  ionic
)

npm install -g "${packages[@]}"

# Missing setup for MongoDB
mkdir -p /data/db

# Install Brew cask and some apps
brew tap caskroom/cask

cask_apps=(
  ccleaner
  docker
  firefox
  gitkraken
  google-chrome
  iterm2
  kindle
  postico
  postman
  rider
  robo-3t
  rubymine
  slack
  skype
  spotify
  virtualbox
)

brew cask install "${cask_aps[@]}"
# MongoDB setup
sudo mkdir -p /data/db
sudo chmod 777 /data/db

# Setup zsh and vim
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc

source ~/.zshrc
source ~/.vimrc

vim +PluginInstall +qall
