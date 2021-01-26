shopt -s checkwinsize

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --human-readable --group-directories-first --color=auto"
    alias grep='grep --colour=always'
    alias egrep='egrep --colour=always'
    alias fgrep='fgrep --colour=always'
fi

#PS1='\n\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\n \$\[\033[00m\] '

PS1='\n\[\033[1;31m\]┌───(\[\033[01;32m\]\D{%H:%M:%S}\[\033[1;31m\])\n│ (\[\033[1;34m\]\u\[\033[01;31m\] @ \[\033[01;34m\]\h\[\033[1;31m\])─(\[\033[01;34m\]\w\[\033[1;31m\])\n└\[\033[01;32m\]\$\[\033[01;34m\]\[\e[m\] '

alias nano="nano -w"
alias mc="mc -S /home/gisty/.mc/ini"
#alias ls="ls --group-directories-first --color=auto"
#alias grep='grep --colour=auto'
#alias egrep='egrep --colour=auto'
#alias fgrep='fgrep --colour=auto'
alias ylmpv='mpv --ytdl-raw-options=yes-playlist='
alias ipython='ipython --no-confirm-exit'

export PATH="/home/gisty/.local/bin:$PATH"
export TERM="xterm"

#indicate if script/screen used
lsof -tac script "$(tty)" > /dev/null && PS1="[script] $PS1"
test -n "$STY" && PS1="[screen] $PS1"

shopt -s checkwinsize
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND}${PROMPT_COMMAND:+;}history -a"

if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi
