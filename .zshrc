# --- Load additional configs if available ----------------------------

test -f ${HOME}/.zsh/zshrc.grml && source ${HOME}/.zsh/zshrc.grml

# --- Common aliases --------------------------------------------------

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias md="mkdir -p"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -lh"
alias lS="ls -lhSr"             # sort by size
alias lt="ls -lutr"             # sort by time
alias cp="cp -iv"               # verbose and secure copy
alias mc="LANG=de_DE mc"        # workaround for non utf8 mc
alias df="df -H"
alias h="history"
alias G=" | grep "
alias L=" | less "
alias README="less README"
alias rmkey="ssh-keygen -R"

alias tmux="tmux attach || tmux"

# --- Exports ---------------------------------------------------------

export PATH="${PATH}:${HOME}/bin:${HOME}/.cabal/bin"
export EDITOR="vim"

# Use a default width of 80 for manpages for more convenient reading
export MANWIDTH=${MANWIDTH:-80}

# wine ist als 64bit Umgebung nicht zu gebrauchen...
export WINEARCH=win32

# --- Colors ----------------------------------------------------------

local red="%{"$'\e[1;31m'"%}"
local RED="%{"$'\e[0;31m'"%}"
local cyan="%{"$'\e[1;36m'"%}"
local CYAN="%{"$'\e[0;36m'"%}"
local blue="%{"$'\e[1;34m'"%}"
local BLUE="%{"$'\e[0;34m'"%}"
local green="%{"$'\e[1;32m'"%}"
local GREEN="%{"$'\e[0;32m'"%}"
local magenta="%{"$'\e[1;35m'"%}"
local MAGENTA="%{"$'\e[0;35m'"%}"
local yellow="%{"$'\e[1;33m'"%}"
local YELLOW="%{"$'\e[0;33m'"%}"
local gray="%{"$'\e[1;30m'"%}"
local GRAY="%{"$'\e[0;37m'"%}"
local white="%{"$'\e[0;37m'"%}"
local WHITE="%{"$'\e[1;37m'"%}"
local NOCOLOR="%{"$'\e[0m'"%}"
local NEWLINE="%{"$'\e[80D'"%}"

local HBAR=${altchar[q]:--}


# --- Prompt & window title -------------------------------------------

if [ ${UID} -eq 0 ]; then
	export PS1="${red}%n@%M: ${YELLOW}%50<…<%~
${GREEN}%T${white} %# "
    PATH=${PATH}:/sbin:/usr/sbin
else
	export PS1="${green}%n@%M: ${YELLOW}%50<…<%~
${GREEN}%T${white} %# "
fi
export PS2="%_> "

# This function sets the window tile to user@host:/workingdir before 
# each prompt.
precmd () {
  [[ -t 1 ]] || return
  case $TERM in
      *xterm*|rxvt|urxvt|rxvt-unicode|cygwin)
	  print -Pn "\e]2;%n@%m:%~\a"
	  ;;
      screen*) print -Pn "\e\"%m:%~\e\134"
  esac
}


# --- Miscellaneous ---------------------------------------------------

# C-s does not stop the terminal anymore
stty stop  '^-'
stty start '^-'
[[ $EMACS = t ]] && unsetopt zle # For zsh to work well within Emacs

if [ ${UID} -eq 0 ]; then
    umask 077
else
    umask 022
fi

# fix delete key issue
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char


# --- Load local configs if available ---------------------------------

# load host specific configs
test -f ${HOME}/.zsh/zshrc.${HOST} && source ${HOME}/.zsh/zshrc.${HOST}

test -f ${HOME}/.aliases && source ${HOME}/.aliases

