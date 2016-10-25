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


export NVM_DIR="/Users/yangshuai/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


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
alias gs="printf '\n\n\n\n\n\n\n\n\n\n' && git status"
alias gl="git log --graph --full-history --all --color --date=short --pretty=format:\"%Cred%x09%h %Creset%ad%Cblue%d %Creset %Cred%C(bold)@%an: %Creset%Creset%Cblue%s%Creset\""
alias i="pushd ."
alias o="popd"
# Add color go the output of "go test -v"
gt() {
    go test -v . | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}



# pyenv configuration
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    pathprepend "${PYENV_ROOT}/bin"
    eval "$(pyenv init -)"
fi


# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
pathprepend "$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
