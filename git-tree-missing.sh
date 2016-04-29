#!/bin/sh

#search_regex_gold_master='start'
#search_regex_follow_up='end'

comm -23 <(git log --grep 'start' --format=%H | xargs -n1  git diff-tree --no-commit-id --name-only -r | sort | uniq) <(git log --grep 'end' --format=%H | xargs -n1  git diff-tree --no-commit-id --name-only -r | sort | uniq)
