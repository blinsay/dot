if status is-interactive
  # Some good aliases
  alias ga='git add'
  alias gc='git commit -v'
  alias gd='git diff'
  alias gst='git status'
  alias gco='git checkout'
  alias glgg='git log --graph'
  alias glog='git log --oneline --decorate --graph'
  alias gloga='git log --oneline --decorate --graph --all'

  # Add a git alias to print the root of the current git repository. Silently
  # exits non-zero outside of a git repo.
  git config --global alias.root "!sh -c 'git rev-parse --show-toplevel 2>/dev/null'"
end

