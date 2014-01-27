#!/bin/sh

set -e


dot_dir=`pwd`

# The url for the git repository to clone oh-my-zsh from. Usually the offical
# oh-my-zsh repo or your own personal fork. 
omz='git@github.com:blinsay/oh-my-zsh.git'

setup_zsh() {
  if [ -d ~/.oh-my-zsh ]
  then
    echo "\033[0;33mYou already have Oh My Zsh installed to ~/.oh-my-zsh.\033[0m"
    echo "For a totally clean install, 'rm -rf ~/.oh-my-zsh ~/.zshrc' and try again"
  else
    # Git clone, but skip the default OMZ install script.
    git clone $omz ~/.oh-my-zsh
    if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
    then
      mv ~/.zshrc ~/.zshrc.bak
    fi
   
    # Set the default shell
    if [ "$SHELL" != `which zsh` ]
    then
      chsh -s `which zsh`
    fi

    cp $dot_dir/dot.zshrc ~/.zshrc 
  fi
}

setup_vim() {
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  if [ ! -d ~/.vim/vim-pathogen ]
  then
    git clone git@github.com:tpope/vim-pathogen.git ~/.vim/vim-pathogen 
    ln -s ~/.vim/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
  fi
  cp $dot_dir/dot.vimrc ~/.vimrc

  cd ~/.vim/bundle
  install_packages=`cat $dot_dir/pathogen.install`
  for repo_url in $install_packages
  do
    git clone $repo_url 
  done
  cd $dot_dir
}


echo "\033[0;32mSetting up ZSH...\033[0m"
setup_zsh

echo ""
echo "\033[0;32mSetting up Vim...\033[0m"
setup_vim

echo ''
echo ''
echo ''
echo ''
echo '\033[0;35m /$$      /$$ /$$$$$$$$ /$$        /$$$$$$   /$$$$$$  /$$      /$$ /$$$$$$$$' 
echo '\033[0;35m| $$  /$ | $$| $$_____/| $$       /$$__  $$ /$$__  $$| $$$    /$$$| $$_____/'
echo '\033[0;35m| $$ /$$$| $$| $$      | $$      | $$  \__/| $$  \ $$| $$$$  /$$$$| $$      '
echo '\033[0;35m| $$/$$ $$ $$| $$$$$   | $$      | $$      | $$  | $$| $$ $$/$$ $$| $$$$$   '
echo '\033[0;35m| $$$$_  $$$$| $$__/   | $$      | $$      | $$  | $$| $$  $$$| $$| $$__/   '
echo '\033[0;35m| $$$/ \  $$$| $$      | $$      | $$    $$| $$  | $$| $$\  $ | $$| $$      '
echo '\033[0;35m| $$/   \  $$| $$$$$$$$| $$$$$$$$|  $$$$$$/|  $$$$$$/| $$ \/  | $$| $$$$$$$$'
echo '\033[0;35m|__/     \__/|________/|________/ \______/  \______/ |__/     |__/|________/'
echo '\033[0;35m                                                                            '
echo '\033[0;35m                                                                            '
echo '\033[0;35m                                                                            '
echo '\033[0;35m                           /$$$$$$$$/$$$$$$                                 '
echo '\033[0;35m                          |__  $$__/$$__  $$                                '
echo '\033[0;35m                             | $$ | $$  \ $$                                '
echo '\033[0;35m                             | $$ | $$  | $$                                '
echo '\033[0;35m                             | $$ | $$  | $$                                '
echo '\033[0;35m                             | $$ | $$  | $$                                '
echo '\033[0;35m                             | $$ |  $$$$$$/                                '
echo '\033[0;35m                             |__/  \______/                                 '
echo '\033[0;35m                                                                            '
echo '\033[0;35m                                                                            '
echo '\033[0;35m                                                                            '
echo '\033[0;35m                      /$$   /$$ /$$$$$$$$ /$$       /$$                     '
echo '\033[0;35m                     | $$  | $$| $$_____/| $$      | $$                     '
echo '\033[0;35m                     | $$  | $$| $$      | $$      | $$                     '
echo '\033[0;35m                     | $$$$$$$$| $$$$$   | $$      | $$                     '
echo '\033[0;35m                     | $$__  $$| $$__/   | $$      | $$                     '
echo '\033[0;35m                     | $$  | $$| $$      | $$      | $$                     '
echo '\033[0;35m                     | $$  | $$| $$$$$$$$| $$$$$$$$| $$$$$$$$               '
echo '\033[0;35m                     |__/  |__/|________/|________/|________/               '
echo ''
echo ''
echo ''
echo ''

/usr/bin/env zsh
