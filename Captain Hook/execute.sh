#!/bin/bash
[ -d .git ] && git log --oneline > out/commits.txt || echo "Git repo not initialized" >&2
