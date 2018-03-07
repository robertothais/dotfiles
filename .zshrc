source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions

antigen bundle gpg-agent

antigen apply

autoload -U promptinit

promptinit

prompt pure

source $HOME/.aliases
source $HOME/.functions

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

eval "$(rbenv init -)"

if [ $TERM_PROGRAM = 'iTerm.app' ]; then
  cd $CODE
fi
