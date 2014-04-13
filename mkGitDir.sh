#!/bin/bash

# 1. Set up an alias by editing .bash_profile: e.g., mkGitDir='path/to/this/script/mkGitDir.sh'
# 2. Then just run mkGitDir from anywhere, and name your repo after: e.g., mkGitDir test
curl -u "david-davidson" https://api.github.com/user/repos -d '{"name":"'$1'"}'