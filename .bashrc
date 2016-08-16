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



# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting 

# Add homebrew git
# export PATH="/usr/local/Cellar/git/2.9.3/bin:$PATH"

# GOPATH
export GOPATH="$HOME/gopath"
export g="$GOPATH"

# Add gopath bin
# export PATH="$GOPATH/bin:$PATH"
pathprepend "$GOPATH/bin"
