
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Register completions
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
