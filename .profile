###############################################################################
################################### environment ###############################
###############################################################################

# vars
if hash nvim 2>/dev/null; then
  export EDITOR="nvim"
  alias vim='nvim'
else
  export EDITOR="vim"
fi

export HISTCONTRAL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE="clear:keybase*"
export LSCOLORS=gxfxcxdxbxggedabagacad
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .sass-cache --ignore npm_modules -g ""'
export FZF_DEFAULT_OPTS=""
export LYNX_CFG="$HOME/.lynxrc"
export WWW_HOME="gopher://gopher.black"
export XDG_CONFIG_HOME="$HOME/.config"

# path vars
export SYNCTHING_PATH="$HOME/.syncthing"
export SSH_ENV="$HOME/.ssh/environment"
export NODE_PATH="/usr/local/lib/jsctags:/usr/local/lib/node:${HOME}/.yarn/bin:/usr/bin/npm"
export ANDROID_HOME="$HOME/sdk"

# lastpass
export LPASS_HOME="$HOME/.lpass"
export LPASS_DISABLE_PINENTRY=1

# personal app storage paths
export TODO="$SYNCTHING_PATH/todo/personal.txt"
export NOTE_DIR="$SYNCTHING_PATH/notes"
export CONTACTS_DIR="$SYNCTHING_PATH/contacts"
export TRACK_DIR="$SYNCTHING_PATH/track"

# system
export TZ="Atlantic/Reykjavik"

# colors
export TERM=screen-256color
export DIRECTORY_COLOR="$(tput setaf 222)"
export GIT_COLOR="$(tput setaf 240)"
export STAGED_COLOR="$(tput setaf 11)"
export MODIFIED_COLOR="$(tput setaf 64)"
export UNTRACKED_COLOR="$(tput setaf 4)"
export PROMPT_COLOR="$(tput setaf 226)"
export USER_COLOR="$(tput setaf 87)"
export BEAT_COLOR="$(tput setaf 195)"
export ROOT_COLOR="$(tput setaf 160)"
export AT_COLOR="$(tput setaf 240)"
export HOST_COLOR="$(tput setaf 213)"
export TIME_COLOR="$(tput setaf 60)"
export RESET_COLOR="$(tput sgr0)"

# Base16 Tomorrow Night
_gen_fzf_default_opts() {

  color00='#1d1f21'
  color01='#282a2e'
  color02='#373b41'
  color03='#969896'
  color04='#b4b7b4'
  color05='#c5c8c6'
  color06='#e0e0e0'
  color07='#ffffff'
  color08='#cc6666'
  color09='#de935f'
  color0A='#f0c674'
  color0B='#b5bd68'
  color0C='#8abeb7'
  color0D='#81a2be'
  color0E='#b294bb'
  color0F='#a3685a'

  export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}
_gen_fzf_default_opts

# less settings
export PAGER=less

# path
PATH=/bin
PATH=${PATH}:/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/usr/games
PATH=${PATH}:/usr/pkg/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/X11/bin
PATH=${PATH}:/opt/local/bin
PATH=${PATH}:/opt/local/sbin
PATH=${PATH}:${HOME}/bin
PATH=${PATH};${HOME}/.yarn/bin
PATH=${PATH}:${HOME}/.config/yarn/global/node_modules/.bin
PATH=${PATH}:${HOME}/.node/bin
PATH=${PATH}:${HOME}/.local/bin

# PROMPT COMMANDS
PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

# umask liberal
umask 0022

# use vim on the command line
set -o vi

# Load functions
if [ -d "${HOME}/.functions" ]; then
  for f in "${HOME}/.functions/"*; do
    source "$f"
  done
fi

# basic shell aliases
alias ls='ls --color'
alias lsd='ls -Gl | grep "^d"'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# aliases to default commands with certain switches
alias grep='grep --color=auto'
alias mkdir='mkdir -p'

# utils
alias imgsz='sips -g pixelWidth -g pixelHeight'
alias lynx='lynx -display_charset=utf8 --lss=/dev/null'
alias utc='date -u +%H:%M:%S'

# vim
alias vimr='vim -u DEFAULTS -U NONE -i NONE'

# git
alias gs="git status"

# tmux
alias tmux='tmux -u2'
alias t='tmux attach || tmux new'

alias beat='echo "x = (`date +%s` + 3600) % 86400; scale=3; x / 86.4" | bc'

PS1="\[$DIRECTORY_COLOR\]\w\[$RESET_COLOR\]\n\[$HOST_COLOR\]$(hostname -f)\[$PROMPT_COLOR\]-> \[$RESET_COLOR\]"
