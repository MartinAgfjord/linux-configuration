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
alias short='export PS1="\u@\h:€ "'
alias normal='export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "'

# List all listening ports and the corresponding processes
alias netport='netstat -tulpn'

# Search in working directory using locate
locate_in_directory(){
        locate $1 | /bin/grep $(pwd)
}
alias srch=locate_in_directory

print_working_directory_with_file(){
        echo $(pwd)/$1
}
alias pwf=print_working_directory_with_file

# Change default behaviour of watch
alias watch='watch -n0.5'

# Kill all processes which includes one or more names in the command who executed it
kill_by_name(){
for ARG in "$@"
do
    ps aux | grep $ARG | awk '{ print $2; }' | xargs kill -9
done
}
alias kbn='kill_by_name'

alias gvim='gvim --remote'

find_case_insensitive(){
    find . -iname "*$1*"
}
alias fnd=find_case_insensitive

search_in_files(){
    find . -iname "$1" | xargs egrep -i -s "$2"
}
alias sif='search_in_files'
alias sjava='sif "*.java"'
alias sxml='sif "*.xml"'
alias sprop='sif "*.properties"'
alias xclip='xclip -selection c'
alias tail='tail -f -n0'
function remove_line_breaks_and_ident_xml(){
    echo "$1" > /tmp/tmp_xml.xml ; tr -d "\n\r" < /tmp/tmp_xml.xml > /tmp/tmp_xml_no_line_breaks.xml ; xmllint --format /tmp/tmp_xml_no_line_breaks.xml
}
alias xmlformat='remove_line_breaks_and_ident_xml'
function search_for_two_words(){
    fnd "$1" | xargs grep -l -s -i "$2" | xargs egrep -l -s -i "$3"
}
alias s2java='search_for_two_words "*.java"'
function search_class_who_implements(){
    CLASS=`echo "$1" | awk -F '.' '{print $NF }'`
    s2java $1 "implements.*$CLASS"
}
alias simpl='search_class_who_implements'
