#!/bin/bash
if [ -d .git ]; then
  git log --oneline > out/commits.txt
else
  echo "Git repo not initialized" >&2
fi
