#!/bin/bash

# USAGE:
# 1. Set up an alias by editing ~/.bashrc or ~/.bash_profile: 
# 	 e.g., makeRepo='absolute/path/to/this/script/makeRepo.sh'
# 2. Then just run 'makeRepo' to create and push new repositories (without opening your browser)!

# Get required information
echo "What's your GitHub username?"; read GITHUBUSERNAME
echo "Name your new repo:"; read REPONAME
echo "Describe your new repo:"; read REPODESCRIPTION
echo "Commit and push contents of current directory? y/n:"; read PUSHSTATUS

# Sanitize it
GITHUBUSERNAME=${GITHUBUSERNAME// /\ } # Escape spaces in username (lol wut?)
REPONAME=${REPONAME// /-} # Replace spaces in repo name with hyphens
REPONAME=${REPONAME,} # Lowercase first character in repo name, like GitHub does
REPODESCRIPTION=${REPODESCRIPTION// /\ } # Escape spaces in description

# Create the remote repo!
REPOURL=https://github.com/$GITHUBUSERNAME/$REPONAME # Predict URL
curl -u "$GITHUBUSERNAME" https://api.github.com/user/repos -d '{"name":"'"$REPONAME"'","description":"'"$REPODESCRIPTION"'"}'
git init
git remote add origin $REPOURL
echo ">>>>> Created and added remote repo at $REPOURL"

# Optional: add, commit, and push the current directory's contents
if [[ "$PUSHSTATUS" = "y" || "$PUSHSTATUS" = "Y" ]]
	then
	git add ./*
	git commit -a -m "Initial commit"
	echo ">>>>> Pushing repo now"
	git push -u origin master
fi