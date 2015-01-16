#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
                alias grep='grep --color=auto'
                    alias fgrep='fgrep --color=auto'
                        alias egrep='egrep --color=auto'
                        fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias short='export PS1="\u@\h:$ "'
alias normal='export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "'
alias netport='netstat -tulpn'
search(){
        locate $1 | /bin/grep $(pwd)/
}
alias search=search
pwf(){
        echo $(pwd)/$1
}
alias pwf=pwf
alias watch='watch -n0.5'
killbyname(){
# EDIT for now always force kills
        if [[ "$1" == "-9" ]]; then
                    ps aux | grep $2 | awk '{ print $2; }' | xargs kill $1
                        else
                                    ps aux | grep $1 | awk '{ print $2; }' | xargs kill -9
                                        fi
}
alias killbyname=killbyname

