#!/bin/bash
[ -d .git ] && [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ] && git log --oneline > out/commits.txt