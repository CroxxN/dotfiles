#!/bin/bash

# alias for specific folders and disks

alias cvixen='cd /media/croxx/vixen'
alias vmount='sudo mount /dev/sda5 /media/croxx/vixen'
alias emount='sudo mount /dev/sda4 /media/croxx/vixen'
alias gita='git add *'

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
