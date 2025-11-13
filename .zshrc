## If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Enable profiling of zsh startup time
local profile_startup=false

if [[ "$profile_startup" == "true" ]]; then
    zmodload zsh/zprof
fi

# Configure zoxide
ZOXIDE_CMD_OVERRIDE=cd

# Enable history
HIST_STAMPS=dd.mm.yyyy
# source $ZDOTDIR/oh-my-zsh/lib/history.zsh

# if directory conf.d does not exist or is empty, automatically symlink all files in conf.d.source to conf.d
if [ ! -d $ZDOTDIR/conf.d ] || [ -z "$(ls -A $ZDOTDIR/conf.d)" ]; then
    mkdir -p $ZDOTDIR/conf.d $ZDOTDIR/conf.d.disabled
    ln -sf $ZDOTDIR/conf.d.source/* ./conf.d/
fi

# antidote (which also loads from conf.d)
source $ZDOTDIR/.antidote/antidote.zsh
antidote load

# Output profiling results
if [[ "$profile_startup" == "true" ]]; then
    zprof
fi

# Unset local variables
unset profile_startup

# ==============================================================================
# Stuff appended by other tools

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bzeutzheim/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bzeutzheim/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bzeutzheim/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bzeutzheim/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"
