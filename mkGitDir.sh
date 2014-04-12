#!/bin/bash
# Set up an alias by editing .bash_profile: e.g., mkGitDir='path/to/this/script/mkGitDir.sh'
# Then just run mkGitDir from anywhere!
echo "Name ur new repo:" ; read REPO_NAME
curl -u "david-davidson" https://api.github.com/user/repos -d '{"name":"'$REPO_NAME'"}'