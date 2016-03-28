Quick setup:

    # might need this to workaround certificate problems
    alias wget="wget --no-check-certificate"

    # zsh
    wget https://raw.github.com/ctorff/dotfiles/master/zshrc -O ~/.zshrc

    # tmux and screen
    wget https://raw.github.com/ctorff/dotfiles/master/tmux.conf -O ~/.tmux.conf
    wget https://raw.github.com/ctorff/dotfiles/master/screenrc -O ~/.screenrc

    # vim
    wget https://raw.github.com/ctorff/dotfiles/master/vimrc -O ~/.vimrc
    mkdir -p ~/.vim
    wget https://raw.github.com/ctorff/dotfiles/master/vim/vundle -O ~/.vim/vundle

    # htop
    mkdir -p ~/.config/htop
    wget https://raw.github.com/ctorff/dotfiles/master/htoprc -O ~/.config/htop/htoprc

