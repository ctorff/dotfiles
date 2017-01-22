HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v

zstyle :compinstall filename '/home/ct/.zshrc'

autoload -Uz compinit
compinit

# History search with arrow keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A"   up-line-or-beginning-search
bindkey "^[[B"   down-line-or-beginning-search


# fix home and end keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# fix delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# zsh unfortunately doesn't read /etc/inputrc
# https://bbs.archlinux.org/viewtopic.php?id=26110

autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
#source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

#[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
#[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
#[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# --- Prompt setup ----------------------------------------------------

autoload -U promptinit
promptinit
#prompt clint
PS1="
%(1j.jobs:%F{yellow}%j%f .)rc:%(0?.%F{green}%?%f.%B%F{red}%?%f%b) %(0#.%B%F{red}%n%f%b.%F{cyan}%n%f)@%m %F{blue}%~%f
%* # "
RPS1="[%h]"

[[ -x /usr/bin/fasd ]] && eval "$(fasd --init auto)"

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
alias mplayer=mpv

autoload -U zmv
alias mmv='noglob zmv -W'

alias sshnochk='ssh -o "StrictHostKeyChecking no"'

alias fcd="\$(history 1 | sed 's/^[ ]//g' | cut -d' ' -f 3- | egrep '^cd ' | sort | uniq | fzf)"

alias ydl_album='youtube-dl -x -o "%(autonumber)s - %(title)s.%(ext)s" --autonumber-size 2 --audio-format=opus'
alias ydl_audio='youtube-dl -x -f bestaudio --prefer-free-formats -i --output "%(title)s.%(ext)s"'
alias ydl_video='youtube-dl -f bestvideo+bestaudio --prefer-free-formats -i --output "%(title)s.%(ext)s"'
alias ydl_video720='youtube-dl -f "bestvideo[height=720]"+bestaudio --prefer-free-formats -i --output "%(title)s.%(ext)s"'

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

# change cursor color in vi mode
zle-keymap-select () {
    if [ $TERM = "rxvt-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            echo -ne "\033]12;Red\007"
        else
            echo -ne "\033]12;Grey\007"
        fi
    fi
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    if [ $TERM = "rxvt-256color" ]; then
        echo -ne "\033]12;Grey\007"
    fi
}
zle -N zle-line-init
bindkey -v

# --- Load local configs if available ---------------------------------

# load host specific configs
test -f ${HOME}/.zsh/zshrc.${HOST} && source ${HOME}/.zsh/zshrc.${HOST}

test -f ${HOME}/.aliases && source ${HOME}/.aliases

test -f ${HOME}/.zsh/functions && source ${HOME}/.zsh/functions

test -f ${HOME}/.zsh/fzfrc && source ${HOME}/.zsh/fzfrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] \
    && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


