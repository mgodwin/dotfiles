alias reload='unalias -a && source ~/.bashrc'
function g {
  if [ -z "$1" ];then
    echo "Must specify something to search for"
    return 1;
  fi
  grep -rin --color "$@" .
}
