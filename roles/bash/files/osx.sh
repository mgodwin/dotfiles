# Setup bashcompletion provided by homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Setup autojump to quickly jump to directories
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# GRC colorizes nifty unix tools all over the place
if $(grc &>/dev/null);then
  source `brew --prefix`/etc/grc.bashrc
fi

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# PATH setup
# -------
# Will search here first
PATH="./bin"
PATH="$PATH:$HOME/.dotfiles/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:$HOME/.rbenv/shims"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
# Will search here last

export PATH=$PATH

