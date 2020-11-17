source /usr/local/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions

antigen bundle gpg-agent

antigen use oh-my-zsh

antigen apply

autoload -U promptinit

promptinit

source $HOME/.aliases
source $HOME/.functions

eval "$(rbenv init -)"

if [ $TERM_PROGRAM = 'iTerm.app' ]; then
  cd $CODE
fi

prompt pure
