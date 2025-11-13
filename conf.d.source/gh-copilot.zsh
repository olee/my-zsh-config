# Exit if gh copilot command is not found
if [ ! -f "$(which gh)" ]; then
    echo "ERROR: github cli gh not installed"
    return
fi

eval "$(gh copilot alias -- zsh)"
