export PATH=~/bin:$PATH
export EDITOR='vim'

# assume that this file is installed (or a symlink!) at ~/.zshrc. if it's not
# then everything is going to go badly after this.
dot_dir="$(dirname $(readlink -f ~/.zshrc))"

# TODO(benl): this always uses ~/.zcompdump as the compdump file. omz sets this
# based on the current hostname and zsh version, which is maybe a good idea
# but also maybe overkill
autoload -U compaudit compinit
compinit

for src_file ("${dot_dir}"/zsh/*.zsh); do
  src_file_path="${dot_dir}"/zsh/${src_file:t}
  source $src_file_path
done
unset src_file_path

# source any extra .zshrc-style stuff that should be local to a specific
# machine, or contains work creds, etc.
#
# note: the (N) here allows no matches for this glob. it's the same as setting
# NULL_GLOB just for this search.
for src_file ("${dot_dir}"/zsh/local/*.zsh(N)); do
  src_file_path="${dot_dir}"/zsh/local/${src_file:t}
  source $src_file_path
done
unset src_file_path

# set JAVA_HOME to the latest JVM version on OSX
if /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# atuin setup. for some reason this can't be done in another file being
# sourced. shruggie.
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

