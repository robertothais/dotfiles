export CODE="$HOME/code"

export VISUAL=code

export EDITOR=$VISUAL

export PAGER='less -F'

export GOPATH=$HOME/code/go

export JAVA_HOME=$(/usr/libexec/java_home)

export GPG_TTY=$(tty)

PATH=$PATH:$(go env GOPATH)/bin
PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
PATH=node_modules/.bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$CODE/bin:$PATH

export PATH
