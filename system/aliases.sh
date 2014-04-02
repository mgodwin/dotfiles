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

alias reload='unalias -a && source ~/.bashrc'

alias pg-up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-down='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias mysql-up='mysql.server start'
alias mysql-down='mysql.server stop'

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"



function g {
  if [ -z "$1" ];then
    echo "Must specify something to search for"
    return 1;
  fi
  grep -rin --color "$@" .
}
