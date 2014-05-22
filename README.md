Quick setup:

    # might need this to workaround certificate problems
    alias wget="wget --no-check-certificate"

    # zsh
    wget https://raw.github.com/ctorff/dotfiles/master/zshrc -O ~/.zshrc
    # grml config, details see http://grml.org/zsh/
    mkdir -p ~/.zsh
    wget http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -O ~/.zsh/zshrc.grml

    # tmux and screen
    wget https://raw.github.com/ctorff/dotfiles/master/tmux.conf -O ~/.tmux.conf
    wget https://raw.github.com/ctorff/dotfiles/master/screenrc -O ~/.screenrc

    # vim
    wget https://raw.github.com/ctorff/dotfiles/master/vimrc -O ~/.vimrc
    wget https://raw.github.com/ctorff/dotfiles/master/vim/vundle -O ~/.vim/vundle
    wget https://raw.github.com/ctorff/dotfiles/master/vim/folding -O ~/.vim/folding

    # htop
    mkdir -p ~/.config/htop
    wget https://raw.github.com/ctorff/dotfiles/master/htoprc -O ~/.config/htop/htoprc

