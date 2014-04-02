if [ $OS == "Darwin" ]; then
  [[ -f `brew --prefix`/etc/autojump.bash ]] && . `brew --prefix`/etc/autojump.bash
fi

if [ $OS == "Linux" ]; then
  [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
fi
