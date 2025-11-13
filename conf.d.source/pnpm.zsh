# pnpm
export PNPM_HOME="/home/bzeutzheim/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm completions
fpath=(
        "$ZSH/custom/completions"
        $fpath
)

