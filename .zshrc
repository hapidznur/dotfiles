export ZSH=/home/kurokuro/.oh-my-zsh
ZSH_THEME="simple"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git dnf $plugins)
export TERM=xterm-256color
source $ZSH/oh-my-zsh.sh
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH
# zshlocal somekind alias and .local execute
if [ -e ~/.zshlocal ]; then
  . ~/.zshlocal
fi
# disable ctrl + s
stty -ixon

# FZF search utilities
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:/opt/mssql-tools/bin"

