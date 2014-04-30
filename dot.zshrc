# oh-my-zsh options
# 
# ZSH:                      path to the oh-my-zsh directory
# ZSH_THEME:                name of the theme to use
# DISABLE_AUTO_UPDATE:      don't auto-update
# COMPLETION_WAITING_DOTS:  show red dots while waiting for completion
# plugins:                  list of the plugins to source
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew python lein mvn postgres osx virtualenv virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

# vanilla ZSH options
#
export EDITOR='vim'
export PATH=$PATH:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
export JAVA_HOME=$(/usr/libexec/java_home)

alias mcp='mvn clean package'
alias mct='mvn clean test'
alias md5sum='md5 -r'

# local options
# 
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

