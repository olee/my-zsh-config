# run with /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/olee/my-zsh-config/main/setup.sh)"

if [ ! -d ~/.config/zsh/.git ]; then
    if [ -d ~/.config/zsh ]; then
        echo "There already is a zsh config in ~/.config/zsh. Rename to ~/.config/zsh.old? [y/n]"
        read -n 1 -p " " answer
        if [ "$answer" != "y" ]; then
            exit 1
        fi
        mv ~/.config/zsh ~/.config/zsh.old
    fi
    echo "Cloning my-zsh-config..."
    git clone https://github.com/olee/my-zsh-config ~/.config/zsh
else
    echo "Resetting zsh config to latest version..."
    cd ~/.config/zsh
    git fetch
    git reset --hard origin/main
fi

cd ~/.config/zsh

git submodule init

git submodule update

~/.config/zsh/reset-symlinks.sh
