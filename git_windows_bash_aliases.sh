# ===============================================================
# File:                 $HOME/.bash_aliases
# Purpose:              Git for Windows bash aliases
# Compiled by:          David Lieu
# ===============================================================


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
    TMP="main/workspace/dl_sandbox";               echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP="main/workspace/dotfiles";                 echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP="main/workspace/dl_notes";                 echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only
    TMP="main/workspace/leetcode";                 echo -e "${RED1}Run: ${TMP}${NC1}"; cd ~/$TMP && git pull --ff-only

}
alias gr='gitrefresh'



####################################
### Basics/Configs
###ZZ000Z############################
#Colors vars for bash
RED='\033[0;31m'
NC='\033[0m' # No Color

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

#ps shortcuts
alias pse='ps -ef'
psefgrep() {
    echo "ps -ef | grep $1"
    ps -ef | grep $1
}
alias pseg='psefgrep '


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

####################################
### Program Aliases
####ZZ005Z##########################

alias p='python'
alias v='vim'
alias g='grep'


####################################
### ANSIBLE PLAYBOOKS
####ZZ006Z##########################



####################################
### taskwarrior
####ZZ007Z##########################


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
