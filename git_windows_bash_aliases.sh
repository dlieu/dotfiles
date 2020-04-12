# ===============================================================
# File:                 $HOME/.bash_aliases
# Purpose:              Git for Windows bash aliases
# Compiled by:          David Lieu
# ===============================================================


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
# ZZ008Z.....................GIT (version control)

####################################
### not organized..
####################################
#https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c



RED='\033[0;31m'
NC='\033[0m' # No Color



alias pse='ps -ef'
# access the error log of a remote server
psefgrep() {
    echo "ps -ef | grep $1"
    ps -ef | grep $1
}
alias pseg='psefgrep '


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


alias lt='ls -thor'
alias bashrc='source ~/.bashrc'

alias tf='tail -F '

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
#alias pl='pylint -E'
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
# ga - git add
alias ga='git add '

# gaa - git add all
alias gaa='git add .'
# com - git commit with  msg
alias com='git commit -m '


#git commit/push
gitcommitpush() {
    echo "git add .; git commit -m '$1'; git push"
    git status
    git add .
    git commit -m "$1"
    git push
}
alias push='gitcommitpush '


# pull ff only
alias pull='echo "git pull --ff-only"; git pull --ff-only'

# co - checkout with fuzzy branch finder
#       fzf with 15 lines below
alias co='git checkout $(git branch | fzf -d 15)'
