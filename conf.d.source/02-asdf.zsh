# https://asdf-vm.com/guide/getting-started.html

# Set default data dir
[ -z "$ASDF_DATA_DIR" ] && ASDF_DATA_DIR="$HOME/.asdf"

# Exit if asdf binary is not found
if [ ! -f "$(which asdf)" ]; then
    echo "ERROR: asdf not installed. Install with 'brew install asdf'"
    return
fi

# Add shims to path
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Asdf plugin helpers
test -f $HOME/.asdf/plugins/golang/set-env.zsh && source "$_"

asdfi() {
    if [ $# -ne 1 ]; then
        echo "Usage: asdfi <plugin-name>"
        return 1
    fi

    local plugin_name=$1

    echo "Adding plugin: $plugin_name"
    asdf plugin add "$plugin_name"

    echo "Installing latest version of $plugin_name"
    asdf install "$plugin_name" latest

    echo "Setting global version of $plugin_name to latest"
    asdf set -u "$plugin_name" latest
}
