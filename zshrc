# --- grml-zsh-config -------------------------------------------------
# see http://grml.org/zsh/

if [ -f ${HOME}/.zsh/zshrc.grml ]; then

    source ${HOME}/.zsh/zshrc.grml

    MAILCHECK=0
    REPORTTIME=1

    # grml prompt config.  See prompt -h grml,
    # http://grml.org/zsh/grmlzshrc.html,
    # http://bewatermyfriend.org/p/2013/001/ and
    # http://bewatermyfriend.org/p/2013/002/ for help.
    zstyle ':prompt:grml:left:setup' items time rc change-root user at \
             host path vcs newline history percent
    zstyle ':prompt:grml:left:items:time' pre '%F{white}'
    if [ ${UID} -eq 0 ]; then
        zstyle ':prompt:grml:left:items:user' pre '%B%F{red}'
    else
        zstyle ':prompt:grml:left:items:user' pre '%B%F{green}'
    fi
    zstyle ':prompt:grml:left:items:at' pre '%B'
    zstyle ':prompt:grml:left:items:host' pre '%B'
    zstyle ':prompt:grml:left:items:path' pre '%b%F{yellow}'
    zstyle ':prompt:grml:left:items:history' token '!%! '
fi

# --- Common aliases --------------------------------------------------

alias md="mkdir -p"
alias grep="grep --color=auto"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lh"
alias lS="ls -lhSr"             # sort by size
alias lt="ls -lutr"             # sort by time
alias cp="cp -iv"               # verbose and secure copy
alias mc="LANG=de_DE mc"        # workaround for non utf8 mc
alias df="df -H"
alias h="history"
alias G=" | grep "
alias L=" | less "
alias bc="bc -l"
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

if [ ${UID} -eq 0 ]; then
    umask 077
else
    umask 022
fi

# --- Load local configs if available ---------------------------------

# load host specific configs
test -f ${HOME}/.zsh/zshrc.${HOST} && source ${HOME}/.zsh/zshrc.${HOST}

test -f ${HOME}/.aliases && source ${HOME}/.aliases

