pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}


pathprepend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}


[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
pathappend "$HOME/.rvm/bin"
pathprepend "/usr/local/Cellar/git/2.9.3/bin"

# GOPATH
export GOPATH="$HOME/gopath"
export g="$GOPATH"

# Add gopath bin
pathprepend "$GOPATH/bin"

# Enable color in Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias l="ls -latrh"
alias a="printf '\n\n\n\n\n\n\n\n\n\n'"
alias gp="git push origin master"
