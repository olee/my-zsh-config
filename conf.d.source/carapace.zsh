# https://carapace.sh/

# Installation:
# echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" > /etc/apt/sources.list.d/fury.list
# apt-get update && apt-get install carapace-bin

# Exit if carapace command is not found
if [ ! -f "$(which carapace)" ]; then
    echo "ERROR: carapace not installed"
    return
fi

# Carpace shell completion
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)
