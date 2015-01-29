# Will search here first
PATH="./bin" 
PATH="$PATH:$DOTFILES/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:$HOME/.rbenv/shims"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
# Will search here last
export PATH=$PATH

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"