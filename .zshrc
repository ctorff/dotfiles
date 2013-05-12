# --- OH MY ZSH! ------------------------------------------------------

# oh-my-zsh based configuration.
# https://github.com/robbyrussell/oh-my-zsh

ZSH=$HOME/.oh-my-zsh

# Theme name (without the .zsh-theme suffix)
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="../../.zsh/ct"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins can be found in ~/.oh-my-zsh/plugins/* (Custom plugins may be
# added to ~/.oh-my-zsh/custom/plugins/)
plugins=(git archlinux battery colorize django python rsync systemd \
    taskwarrior themes tmux tmuxinator vundle)

source $ZSH/oh-my-zsh.sh

# --- Common aliases --------------------------------------------------

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

# --- Miscellaneous ---------------------------------------------------

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

if [ ${UID} -eq 0 ]; then
    umask 077
else
    umask 022
fi

# --- Load local configs if available ---------------------------------

# load host specific configs
test -f ${HOME}/.zsh/zshrc.${HOST} && source ${HOME}/.zsh/zshrc.${HOST}

test -f ${HOME}/.aliases && source ${HOME}/.aliases

