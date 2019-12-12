# ===============================================================
# File:                 $HOME/.bash_aliases
# Purpose:              Setup file for program "(GNU) screen"
# Compiled by:          David Lieu
# ===============================================================
# 
# Change Log:         
#           April 12, 2019 - table of contents. a lot more sections. etc..
#           January 19, 2018 - Initial version
#

####################################
### Table of Contents
####################################
# ZZ001Z.....................Common Commands
# ZZ002Z.....................Directories
# ZZ003Z.....................SSH stuff
# ZZ004Z.....................BZR (version control)
# ZZ005Z.....................Program Aliases
# ZZ006Z.....................ANSIBLE PLAYBOOKS
# ZZ007Z.....................taskwarrior

####################################
### not organized..
####################################
#https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c



RED='\033[0;31m'
NC='\033[0m' # No Color



alias venv='source ~/main/virtualenv/myvenv/bin/activate'



alias crl='crontab -l'
# access the error log of a remote server
crontabgrep() {
    echo "crontab -l | grep $1"
    crontab -l | grep "$1"
}
alias crg='crontabgrep '



alias pse='ps -ef'
# access the error log of a remote server
psefgrep() {
    echo "ps -ef | grep $1"
    ps -ef | grep $1
}
alias pseg='psefgrep '



printqueryoneline() {
    TMP2=$(psql office --quiet --tuples-only -c "\timing off" -c "$1")
    printf "$1\t\t→$TMP2\n"
}
alias printq='printqueryoneline '

export VISUAL=vim
export EDITOR="$VISUAL"

####################################
### Common Commands
###ZZ001Z############################

### dl help ###
alias dh='cat ~/.bash_aliases'
alias halp='cat ~/.bash_aliases'


#open default program 
alias o=gnome-open  #gnome-open is ubuntu specific
alias open=o

alias lt='ls -thor'
alias bashrc='source ~/.bashrc'

alias tf='tail -F '


alias sr='screen -R ssh'

####################################
### Directories
####ZZ002Z###########################

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

alias delme='cd ~/tmp/deleteme'

#Common Project directories


####################################
### SSH stuff
####ZZ003Z##########################



####################################
### BZR (version control)
####ZZ004Z##########################

alias u='bzr up'
alias qd='bzr qdiff'
alias ql='bzr qlog'
alias bd='bzr diff'

alias bs="bzr stat"
# status but excluding un-added files
#alias bs="bzr stat -V"
alias com='bzr ci -m'



alias bzrstatmodifiedonly="bzr stat -SV | awk '{print \$NF}'"
alias pla='echo pylint -E $(bzrstatmodifiedonly | paste -sd " ") && pylint -E $(bzrstatmodifiedonly | paste -sd " ")'



alias bl='bzr log '
alias bl1='bzr log -l1'
alias bl2='bzr log -l2'
alias bl3='bzr log -l3'
alias bl5='bzr log -l5'


####################################
### Program Aliases
####ZZ005Z##########################

alias p='python'
alias pl='pylint -E'
alias v='vim'
alias g='grep'


####################################
### ANSIBLE PLAYBOOKS
####ZZ006Z##########################



####################################
### taskwarrior
####ZZ007Z##########################



#task add xxxx priority:H due:xx
#dl@pcdl:~$ taska '12345 code review' 1hr
taskpriorityadd() {
    echo "task add $1 priority:H due:$2 wait:$2"
    task add $1 priority:H due:$2 wait:$2
}

taskpriorityaddnowait() {
    echo "task add $1 priority:H due:$2"
    task add $1 priority:H due:$2
}

taskgrep() {
    echo "task all | grep $1"
    task all | grep $1
}

taskgrep() {
    echo "task all | grep $1"
    task all | grep $1
}


alias t='task '
alias tg='taskgrep '
alias te='task edit '
alias td='task done '
alias ta='taskpriorityadd '
alias to='task overdue priority:H'
#(t)ask priority (a)dd, no (w)ait
alias taw='taskpriorityaddnowait '
