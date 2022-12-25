#!/bin/bash

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
	echo "Git is Available"
else
	echo "Git is not installed"
	exit 1
fi

mkdir .config 2> /dev/null

cp -r $HOME/.config/ranger ./.config
cp -r $HOME/.scripts .

# copy dot files 
cp $HOME/{.bashrc,.vimrc,.xinitrc} .

# Check git status
gs="$(git status | grep -i "modified")"
# echo "${gs}"

# If there is a new change
if [[ $gs == *"modified"* ]]; then
	echo "push"
fi

# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push origin master
