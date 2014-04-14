#!/bin/bash

# 1. Set up an alias by editing .bash_profile: e.g., mkGitDir='path/to/this/script/mkGitDir.sh'
# 2. Then just run mkGitDir from anywhere, and name your repo after: e.g., mkGitDir test

# get required information
echo "What's your GitHub username?"
read GITHUBUSERNAME
echo "Name your new repo:"
read REPONAME
echo "Describe your new repo:" 
read REPODESCRIPTION
echo "Commit and push contents of current directory? y/n:"
read PUSHSTATUS
# escape spaces
GITHUBUSERNAME=${GITHUBUSERNAME// /\ }
REPONAME=${REPONAME// /\ }
REPODESCRIPTION=${REPODESCRIPTION// /\ }
if [[ "$PUSHSTATUS" = "y" || "$PUSHSTATUS" = "Y" ]]
	then
	git commit -a -m "Initial commit"
	git push
fi
# create github repo
curl -u "$GITHUBUSERNAME" https://api.github.com/user/repos -d '{"name":"'"$REPONAME"'","description":"'"$REPODESCRIPTION"'"}'
