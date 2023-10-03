#!/bin/bash

# alias for specific folders and disks

alias cvixen='z /media/croxx/vixen'
alias vmount='sudo mount /dev/sda7 /media/croxx/vixen'
alias emount='sudo mount /dev/sda4 /media/croxx/Extra'
alias cextra='z /media/croxx/Extra'
alias gita='git add *'
alias ..='z ..'

# function for easier git commit 

function gitc(){
	git commit -m "$1";
}

function gitp(){
	git push "$1" "$2";
}

function gitch(){
	git add *;
	git commit -m "$1";
}

function gcheck(){
	git checkout "$1";
}

function gitsd(){
	git config --global --add safe.directory "$1";
}
