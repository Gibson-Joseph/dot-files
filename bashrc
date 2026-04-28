# ~/.BASHRC
# -------------------------------------------------------
# Bash configuration file
# Loaded for interactive non-login shells
# -------------------------------------------------------


#########################################################
# INTERACTIVE SHELL CHECK
#########################################################
# Exit if the shell is non-interactive
case $- in
    *i*) ;;
      *) return;;
esac


#########################################################
# VIM CONFIG
#########################################################
# set -o vi

#########################################################
# HISTORY SETTINGS
#########################################################
# Avoid duplicate entries and commands starting with space
HISTCONTROL=ignoreboth

# Append to history instead of overwriting
shopt -s histappend

# History size
HISTSIZE=1000
HISTFILESIZE=2000

# Update terminal size automatically
shopt -s checkwinsize


#########################################################
# LESSPIPE (better file viewing with less)
#########################################################
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#########################################################
# CHROOT SUPPORT (Debian)
#########################################################
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#########################################################
# LS COLORS & USEFUL ALIASES
#########################################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    # alias ls='ls --color=auto'
    # alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Useful ls shortcuts
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

alias ls='eza --icons'
alias ll='eza -l --header --icons'
alias la='eza -la --header --icons'
alias tree='eza --tree --icons'
alias grep='grep --colour'
alias history='history -50'

#########################################################
# BAT (better cat)
#########################################################
alias cat='batcat'
alias bat='batcat'

#########################################################
# ALERT FOR LONG RUNNING COMMANDS
#########################################################
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#########################################################
# LOAD USER ALIASES FILE
#########################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#########################################################
# BASH COMPLETION
#########################################################
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#########################################################
# NVM (Node Version Manager)
#########################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


#########################################################
# CONDA INITIALIZATION
#########################################################
CONDA_HOME="$HOME/miniconda3"
if [ -f "$CONDA_HOME/bin/conda" ]; then
    __conda_setup="$("$CONDA_HOME/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
            . "$CONDA_HOME/etc/profile.d/conda.sh"
        else
            export PATH="$CONDA_HOME/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

# Fix locale for Nerd Fonts / tmux
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#########################################################
# GIT BRANCH PARSER (for prompt)
#########################################################
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | sed 's/^/ (/;s/$/)/'
}


#########################################################
# CONDA ENVIRONMENT DISPLAY
#########################################################
parse_conda_env() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "($CONDA_DEFAULT_ENV) "
    fi
}

#########################################################
# PYTHON VERSION PARSER
#########################################################
parse_python_version() {
    if command -v python >/dev/null 2>&1; then
        python -V 2>&1 | sed 's/Python //'
    fi
}

#########################################################
# COLOR VARIABLES
#########################################################
# Text colors
RED="\[\e[01;31m\]"
CYAN="\[\e[36m\]" 
BLUE="\[\e[01;34m\]"
GREEN="\[\e[01;32m\]"
RESET="\[\e[00m\]"
YELLOW="\[\e[33m\]"
MAGENTA="\[\e[0;35m\]"
WHITE="\[\e[0;37m\]"

#########################################################
# PROMPT CONFIGURATION
#########################################################
# Shows:
# - conda env
# - python version
# - user@host
# - directory
# - git branch

PS1="${YELLOW}\$(parse_conda_env)${RESET}\
${YELLOW}\$(parse_python_version)${RESET} \
${GREEN}\u@\h${RESET}:\
${BLUE}\w\
${RED}\$(parse_git_branch)${RESET}\$ "


#########################################################
# TERMINAL TITLE (for xterm-like terminals)
#########################################################
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#########################################################
# POWERLINE CONFIG
#########################################################

