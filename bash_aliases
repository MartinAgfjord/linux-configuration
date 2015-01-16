#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# List aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Trim terminal working directory
alias short='export PS1="\u@\h:$ "'
alias normal='export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "'

# List all listening ports and the corresponding processes
alias netport='netstat -tulpn'

# Search in working directory using locate
search(){
        locate $1 | /bin/grep $(pwd)/
}
alias srch=search

# Print working directory and a file
pwf(){
        echo $(pwd)/$1
}
alias pwf=pwf

# Change default behaviour of watch
alias watch='watch -n0.5'

# Kill all processes which includes one or more names in the command who executed it
killbyname(){
# EDIT for now always force kills
for ARG in "$@"
do
    ps aux | grep $ARG | awk '{ print $2; }' | xargs kill -9
done
}
alias kbn=killbyname
