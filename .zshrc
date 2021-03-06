# Yuki's .zshrc

function msg {
    echo -e "\033[1;34m>> \033[0m$@"
}

if ! which curl > /dev/null 2>&1; then
    msg "It looks like curl is not installed, please install curl."
    return
fi

if ! which git > /dev/null 2>&1; then
    msg "It looks like git is not installed, please install git."
    return
fi

if [ ! -f $HOME/.prepared-env ]; then
    msg "Hello $(whoami) o/"
    touch ~/.prepared-env
fi

export ZIM=${HOME}/.zim
export ZDOTDIR=$HOME

if [ ! -d $ZIM ]; then
    msg "Installing zim ..."
    git clone --recursive https://github.com/Eriner/zim.git $ZIM
fi

source $ZIM/init.zsh

[ -f "$HOME/.zvendor" ] && source $HOME/.zvendor

# load google cloud sdk
if [ -d "$HOME/.google-cloud-sdk" ]; then
   source "$HOME/.google-cloud-sdk/path.zsh.inc"
   source "$HOME/.google-cloud-sdk/completion.zsh.inc"
fi

alias config='/usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if which nvim > /dev/null 2>&1; then 
   alias vim='nvim'
   export EDITOR='nvim'
fi

virtualenvwrapper_location=$(which virtualenvwrapper.sh 2>/dev/null)
retval=$?

if [ "$retval" -eq "0" ]; then
    export WORKHON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/git
    export VIRTUALENVWRAPPER_PYTHON=$(which python3 2>/dev/null)
    source "$virtualenvwrapper_location"
fi

export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$GEM_HOME/bin:$HOME/.local/bin:$PATH"
