# enable pretty colors
autoload -U colors && colors

# set ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && \
  alias ls='ls --color=tty' || \
  alias ls='ls -G'

# prompt
setopt prompt_subst

PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%} %{$fg[green]%}%2~%{$reset_color%}$(git_prompt_info)$(hg_prompt_info) %(!.#.$) '

GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
GIT_PROMPT_SUFFIX=")%{$reset_color%}"
GIT_PROMPT_DIRTY="*"
GIT_PROMPT_CLEAN=""

HG_PROMPT_PREFIX=" %{$fg[yellow]%}hg:("
HG_PROMPT_SUFFIX=")%{$reset_color%}"
HG_PROMPT_DIRTY="*"
HG_PROMPT_CLEAN=""
