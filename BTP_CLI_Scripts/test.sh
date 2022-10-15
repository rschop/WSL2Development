#!/usr/bin/env bash

result=$(btp get accounts/global-account --show-hierarchy)

echo "$result" > result.txt

directory=$(awk 'END{print $2}' <<< "$result")

echo "$directory"

btp delete accounts/directory "$directory" --confirm