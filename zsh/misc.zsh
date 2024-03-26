if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
	export LC_CTYPE=${LANG%%:*}
fi

# automatically cd to directories if they're given as a command
setopt auto_cd

# insert tee and cat automatically when multiple redirects are given
setopt multios

# navigation
#
# auto_pushd makes cd act like pushd, without having to remember to type
# pushd all the time. the other options remove dups and makes cd -2 go to the
# second most recent directory
#
# the ls aliases are just aliases
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
alias d='dirs -v | head -10'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias d='dirs -v | head -10'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# mkcdir
#
# it's the mkdir && cd alias that should have always been here
function mkcdir {
  mkdir -p "$1" && cd "$1"
}

# grep
#
# exclude VCS folders and turn on color
alias grep="grep --color=auto --exclude-dir=CVS,.bzr,.git,.hg,.svn"

# history
#
# set a history file, and all kinds of options to make a little nicer. dedup,
# ignore stuff with a space in front, do history expansion, etc.
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=5000
SAVEHIST=5000

setopt extended_history
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
alias history='fc -il 1'

# jobs
setopt long_list_jobs

# pager
export PAGER="less"
export LESS="-R"
export BAT_THEME="Solarized (light)"

# recognize comments
setopt interactivecomments

# url magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
