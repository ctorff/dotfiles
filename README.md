generic dotfiles ...

    # might need this to workaround certificate problems
    alias wget="wget --no-check-certificate"

    # zsh
    wget https://raw.github.com/ctorff/dotfiles/master/.zshrc -O ~/.zshrc
    # OH MY ZSHELL!
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    # zsh theme (prompt)
    mkdir -p ~/.zsh
    wget https://raw.github.com/ctorff/dotfiles/master/ct.zsh-theme -O ~/.zsh/ct.zsh-theme

    # tmux and screen
    wget https://raw.github.com/ctorff/dotfiles/master/.tmux.conf -O ~/.tmux.conf
    wget https://raw.github.com/ctorff/dotfiles/master/.screenrc -O ~/.screenrc

    # vim
    wget https://raw.github.com/ctorff/dotfiles/master/.vimrc -O ~/.vimrc

    # htop
    mkdir -p ~/.config/htop
    wget https://raw.github.com/ctorff/dotfiles/master/htoprc -O ~/.config/htop/htoprc

    # Xdefaults
    wget https://raw.github.com/ctorff/dotfiles/master/.Xdefaults -O ~/.Xdefaults

