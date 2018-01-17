# Prompt Theme
# ------------
function __ {
  echo "$@"
}

function __make_ansi {
  next=$1 && shift
  echo "\[\e[$(__$next $@)m\]"
}

function __reset {
  next=$1 && shift
  out="$(__$next $@)"
  echo "0${out:+;${out}}"
}

function __bold {
  next=$1 && shift
  out="$(__$next $@)"
  echo "${out:+${out};}1"
}

function __color_normal_fg {
  echo "3$1"
}

function __color_red   {
  echo "1"
}

function __color_green   {
  echo "2"
}

function __color_blue  {
  echo "4"
}


function __color_rgb {
  r=$1 && g=$2 && b=$3
  [[ r == g && g == b ]] && echo $(( $r / 11 + 232 )) && return # gray range above 232
  echo "8;5;$(( ($r * 36  + $b * 6 + $g) / 51 + 16 ))"
}

function __color {
  color=$1 && shift
  case "$1" in
    fg|bg) side="$1" && shift ;;
    *) side=fg;;
  esac
  case "$1" in
    normal|bright) mode="$1" && shift;;
    *) mode=normal;;
  esac
  [[ $color == "rgb" ]] && rgb="$1 $2 $3" && shift 3

  next=$1 && shift
  out="$(__$next $@)"
  echo "$(__color_${mode}_${side} $(__color_${color} $rgb))${out:+;${out}}"
}

function __red   {
  echo "$(__color red $@)"
}

function __green   {
  echo "$(__color green $@)"
}

function __blue  {
  echo "$(__color blue $@)"
}

function __color_parse {
  next=$1 && shift
  echo "$(__$next $@)"
}

function color {
  echo "$(__color_parse make_ansi $@)"
}

green="$(color reset green)"
bold_red="$(color red bold)"
bold_blue="$(color blue bold)"
normal="$(color reset)"
reset_color="$(__make_ansi '' 39)"

THEME_PROMPT_HOST='\H'
SCM_GIT='git'

RBENV_THEME_PROMPT_PREFIX=' |'
RBENV_THEME_PROMPT_SUFFIX='|'

function scm {
  if [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
  elif [[ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]]; then SCM=$SCM_GIT
  else SCM=$SCM_NONE
  fi
}

function scm_prompt_info {
  scm
  [[ $SCM == $SCM_GIT ]] && git_prompt_info && return
}

function git_prompt_vars {
  SCM_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
}

function rbenv_version_prompt {
  if which rbenv &> /dev/null; then
    rbenv=$(rbenv version-name) || return
    if [ $rbenv != "system" ]; then
      echo -e "$RBENV_THEME_PROMPT_PREFIX$rbenv$RBENV_THEME_PROMPT_SUFFIX"
    fi
  fi
}

function ruby_version_prompt {
  echo -e "$(rbenv_version_prompt)"
}

# backwards-compatibility
function git_prompt_info {
  git_prompt_vars
  echo -e "($SCM_BRANCH)"
}

# Added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
  xterm*)
  TITLEBAR="\[\033]0;\w\007\]"
  ;;
  *)
  TITLEBAR=""
  ;;
esac
PROMPT="${TITLEBAR}${green}\w${bold_blue}\$(scm_prompt_info)${reset_color}${bold_red}\$(ruby_version_prompt)${reset_color}${normal} "


# SCM themeing
SCM_THEME_PROMPT_PREFIX="("
SCM_THEME_PROMPT_SUFFIX=")"

RBENV_THEME_PROMPT_PREFIX='('
RBENV_THEME_PROMPT_SUFFIX=')'

export PS1=$PROMPT
