# Adapted from the Oh My ZSH mercurial plugin. Only the bits relevant to
# hg_prompt_info.
#
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/mercurial/mercurial.plugin.zsh

function hg_prompt_info {
  if [[ ! -d .hg ]]; then
    return 0
  fi

  local branch
  branch=$(hg branch)
  echo "$HG_PROMPT_PREFIX${branch}$(hg_dirty)$HG_PROMPT_SUFFIX"
}

function hg_dirty {
  if [[ ! -d .hg ]]; then
    return 0
  fi

  if hg status 2> /dev/null | command grep -Eq '^\s*[ACIDMRML!?]'; then
    echo $HG_PROMPT_DIRTY
  else
    echo $HG_PROMPT_CLEAN
  fi
}

