# Exit if we are not in WSL
if [[ "$(uname -r)" != *"microsoft"* ]]; then
    return
fi

# Use Windows browser by default
export BROWSER=wslview

# Setup alias which might be required for oh-my-zsh
alias gpg='/mnt/c/Program\ Files\ \(x86\)/GnuPG/bin/gpg.exe'

# WSL aliases
#alias ssh=ssh.exe
#alias ssh-add=ssh-add.exe
#alias ssh-keygen=ssh-keygen.exe

# Use forwarded ssh agent socket (see https://sxda.io/posts/sharing-ssh-agent-wsl/#my-preferred-solution)
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}ssh/ssh-agent.sock

alias wsl=wsl.exe
