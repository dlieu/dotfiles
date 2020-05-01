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
# ZZ000Z.....................Basics/Configs
# ZZ001Z.....................Common Commands
# ZZ002Z.....................Directories
# ZZ003Z.....................SSH stuff
# ZZ004Z.....................BZR (version control)
# ZZ005Z.....................Program Aliases
# ZZ006Z.....................ANSIBLE PLAYBOOKS
# ZZ007Z.....................taskwarrior
# ZZ008Z.....................GIT (version control)
# ZZ009Z.....................Customer VPNs
# ZZ010Z.....................Work Specific
# ZZ011Z.....................Bash Prompt

####################################
### not organized..
####################################
#https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c

#git refresh - all common projects
gitrefresh() {
    TMP=sandbox;               echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP=dotfiles;              echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP=notes;                 echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP=leetcode;              echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only

}
alias gr='gitrefresh'


#git status all - all common projects
gitstatusall() {
    TMP=sandbox;               echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git status
    TMP=dotfiles;              echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git status
    TMP=notes;                 echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git status
    TMP=leetcode;              echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git status

}
alias grs='gitstatusall'

# pyenv setup.
function loadpyenv {
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

####################################
### Basics/Configs
###ZZ000Z############################
#Colors vars for bash.. for echo?
RED1='\033[0;31m'
NC1='\033[0m' # No Color
# Colors for... prompts?
RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

export VISUAL=vim
export EDITOR="$VISUAL"

# change it to vim mode.
# https://apple.stackexchange.com/questions/88515/how-do-i-edit-current-shell-command-in-vi
set -o vi
# set -o emacs

####################################
### Common Commands
###ZZ001Z############################

### dl help ###
alias dh='cat ~/.bash_aliases'
alias halp='cat ~/.bash_aliases'


#open default program
alias o=gnome-open  #gnome-open is ubuntu specific
alias open=o

#explore folder
# https://stackoverflow.com/questions/38086185/how-to-check-if-a-program-is-run-in-bash-on-ubuntu-on-windows-and-not-just-plain
explore() {
    if  [ ! -z "$WSL_DISTRO_NAME" ]; then
        echo "explorer.exe $1"
        explorer.exe $1
    else
        echo "nautilus $1"
        nautilus $1
    fi
}
alias e='explore '

alias lt='ls -thor'
alias bashrc='source ~/.bashrc'

alias tf='tail -F '


alias sr='screen -R ssh'

#crontab
alias crl='crontab -l'
crontabgrep() {
    echo "crontab -l | grep $1"
    crontab -l | grep "$1"
}
alias crg='crontabgrep '

#activate virtual env (python)
alias venv='source ~/main/virtualenv/myvenv/bin/activate'

#ps shortcuts
alias pse='ps -ef'
psefgrep() {
    echo "ps -ef | grep $1"
    ps -ef | grep $1
}
alias pseg='psefgrep '

#Print query one line.
printqueryoneline() {
    TMP2=$(psql office --quiet --tuples-only -c "\timing off" -c "$1")
    printf "$1\t\t→$TMP2\n"
}
alias printq='printqueryoneline '
####################################
### Directories
####ZZ002Z###########################

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

alias delme='cd ~/tmp/deleteme'

#Common Project directories
alias sandbox='cd ~/sandbox'
alias dotfiles='cd ~/dotfiles'
alias notes='cd ~/notes'

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

# alias p='python'
alias p='python3'
alias pl='pylint -E'
alias v='nvim'
alias vim='nvim'
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


alias t='task '
alias tg='taskgrep '
alias te='task edit '
alias td='task done '
alias ta='taskpriorityadd '
alias to='task overdue priority:H'
#(t)ask priority (a)dd, no (w)ait
alias taw='taskpriorityaddnowait '


####################################
### GIT (version control)
####ZZ008Z##########################

# short forms
# ===========
# gs - git status
alias gs='git status'
# gb - git branch
alias gb='git branch'
# gp - git push
alias gp='git push'
# push - git push
alias push='git push'
# ga - git add
alias ga='git add '
# co - git checkout
alias co='git checkout '

# gaa - git add all
alias gaa='git add .'
# com - git commit with  msg
alias com='git commit -m '

#git add/commit/push
gitaddcommitpush() {
    git status
    git add .
    git commit -m "$1"
    git push
    echo "RAN: git add .; git commit -m '$1'; git push"
}
# gcp - git add commit push
alias gcp='gitaddcommitpush '


# pull ff only
alias pull='echo "git pull --ff-only"; git pull --ff-only'

# co - checkout with fuzzy branch finder
#       fzf with 15 lines below
#       cut beginning .. currently selected line has a '*'
alias fco='git checkout $(git branch | fzf -d 15 | cut -c 2- )'

# log for diffs
gitprettylog() {
    echo "git log --name-status -1 -U $1"
    git log --name-status -1 -U  $1
}
alias glog='gitprettylog '


####################################
### Customer VPNs
####ZZ009Z##########################


####################################
### Work Specific
####ZZ010Z##########################


####################################
### Bash Prompt
####ZZ011Z##########################

#xxx git branch name on prompt
#https://askubuntu.com/a/946716
### Show git branch name
##force_color_prompt=yes
##color_prompt=yes
##parse_git_branch() {
## git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
##}
##if [ "$color_prompt" = yes ]; then
## PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_b##ranch)\[\033[00m\]\$ '
##else
## PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
##fi
##unset color_prompt force_color_prompt

#https://gist.github.com/mkottman/1936195
# A two-line colored Bash prompt (PS1) with Git branch and a line decoration
# which adjusts automatically to the width of the terminal.
# Recognizes and shows Git, SVN and Fossil branch/revision.
# Screenshot: http://img194.imageshack.us/img194/2154/twolineprompt.png
# Michal Kottman, 2012

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

#LINE_DASHES_FILLER=`printf -- '- %.0s' {1..200}`
EMPTY_SPACE_FILLER=`printf -- '  %.0s' {1..200}`
PS_LINE=$EMPTY_SPACE_FILLER


function get_cached_bzr_tags {
  TMP="$(grep $(pwd) /home/dl/tmp/bzrtags.txt)"
  if [ -z "$TMP" ]
  then
  TMP="$(pwd) $(get_latest_bzr_tag)"
  echo $TMP >> /home/dl/tmp/bzrtags.txt
    echo $TMP | awk '{print $2}'
  else
    echo $TMP | awk '{print $2}'
  fi
}
function get_latest_bzr_tag {
  bzr tags --sort=time | tail -n1 | cut -d ' ' -f1
}
function get_latest_git_tag {
  # eg. git describe --tag -> v8.0.6-60-g88effa665
  # returns v8.0.6
  git describe --tags 2> /dev/null | cut -d '-' -f1
}

function parse_git_branch {
  PS_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  if [ -d .svn ]; then
    PS_BRANCH="(svn r$(svn info|awk '/Revision/{print $2}'))"
    return
  elif [ -d ".bzr/branch" ]; then
    PS_BRANCH="($(get_cached_bzr_tags) r$(bzr revno)) "
    return
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_UPSTREAM=$(git rev-parse --abbrev-ref ${ref#refs/heads/}@{u} 2>/dev/null)
  PS_TAG=$(get_latest_git_tag)
  PS_BRANCH="(${ref#refs/heads/} $PS_TAG) [$PS_UPSTREAM]"
}
function refresh_bzr_tags {
  sed -i "\:$(pwd):d" /home/dl/tmp/bzrtags.txt
  get_cached_bzr_tags
}

PROMPT_COMMAND=parse_git_branch
PS_INFO="$GREEN\u@\h$RESET:$BLUE\w"
PS_GIT="$YELLOW\$PS_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"
#export PS1="\[\033[0G\]${PS_INFO} ${PS_GIT}${RESET}\$ "
#export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "
export PS1="${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "
##
