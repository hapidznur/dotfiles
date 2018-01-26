
export ZSH=/home/hapidznur/.oh-my-zsh
ZSH_THEME="odin"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH
# zshlocal somekind alias and .local execute
if [ -e ~/.zshlocal ]; then
  . ~/.zshlocal
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
