generic dotfiles ...

    # zsh
    wget https://raw.github.com/ctorff/dotfiles/master/.zshrc -O ~/.zshrc
    # grml config, details see http://grml.org/zsh/
    mkdir -p ~/.zsh
    wget http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -O ~/.zsh/zshrc.grml

    # tmux and screen
    wget https://raw.github.com/ctorff/dotfiles/master/.tmux.conf -O ~/.tmux.conf
    wget https://raw.github.com/ctorff/dotfiles/master/.screenrc -O ~/.screenrc

    # vim
    wget https://raw.github.com/ctorff/dotfiles/master/.vimrc -O ~/.vimrc

might need this to workaround certificate problems

    alias wget="wget --no-check-certificate"

