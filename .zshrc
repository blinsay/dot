export PATH=~/bin:$PATH
export EDITOR='vim'

# TODO(benl): this always uses ~/.zcompdump as the compdump file. omz sets this
# based on the current hostname and zsh version, which is maybe a good idea
# but also maybe overkill
autoload -U compaudit compinit
compinit

for src_file (~/dot/zsh/*.zsh); do
  src_file_path=~/dot/zsh/${src_file:t}
  source $src_file_path
done
unset src_file_path

# source any extra .zshrc-style stuff that should be local to a specific
# machine, or contains work creds, etc.
for src_file (~/dot/zsh/local/*.zsh(N)); do
  src_file_path=~/dot/zsh/local/${src_file:t}
  source $src_file_path
done
unset src_file_path

# set JAVA_HOME to the latest JVM version on OSX
if /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
