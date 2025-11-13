# Configure fzf
alias cdf='cd $(dirname $(fzf))'
export FZF_DEFAULT_COMMAND="find . -path '*/.*' -prune -o -name node_modules -prune -o -print"
export FZF_DEFAULT_OPTS='--preview="batcat --color=always --style=auto {}" --preview-window "right,70%,wrap" --height 60%'
