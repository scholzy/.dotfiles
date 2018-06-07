# Based on xero's zsh prompt

#ICO_DIRTY="↯"
ICO_DIRTY="*"
ICO_AHEAD="↑"
ICO_BEHIND="↓"
ICO_DIVERGED="⥮"
COLOR_ROOT="%F{red}"
COLOR_USER="%F{blue}"
COLOR_NORMAL="%F{white}"
PROMPT_STYLE="classic"

# Allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

# Colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

# Git prompt
GIT_PROMPT() {
  test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$test" ]
  then
    case "$PROMPT_STYLE" in
      ascii)
        echo "$reset_color%F{cyan}▒░"
      ;;
      arrows)
        echo "$reset_color%F{cyan}"
      ;;
    esac
    return
  fi
  ref=$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)
  dirty="" && [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && dirty=$ICO_DIRTY
  stat=$(git status | sed -n 2p)
  case "$stat" in
    *ahead*)
      stat=$ICO_AHEAD
    ;;
    *behind*)
      stat=$ICO_BEHIND
    ;;
    *diverged*)
      stat=$ICO_DIVERGED
    ;;
    *)
      stat=""
    ;;
  esac
  echo "${USER_LEVEL}─[${COLOR_NORMAL}"${ref}${dirty}${stat}"${USER_LEVEL}]"
}

# Indicate when using SSH
REMOTE_PROMPT() {
    if [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
	echo "${USER_LEVEL}[%F{yellow}$(hostname -s)${USER_LEVEL}] "
    fi
}

PROMPT='${USER_LEVEL}[%F{white}%(6~|.../%5~|%~)${USER_LEVEL}]$(GIT_PROMPT)-$(REMOTE_PROMPT)%f '
