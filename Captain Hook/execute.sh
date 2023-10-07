#!/bin/bash
if [ -d .git ];then
if [ -n "$(git log --oneline)" ];then
git log --oneline >> out/commits.txt
else
echo "No commits found." >> out/commits.txt
fi
else
echo "Git repository is not initialized." >> out/commits.txt
fi