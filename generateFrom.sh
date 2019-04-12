#!/bin/bash

if [[ ! -e ./spinners.json ]]; then
  wget -q https://raw.githubusercontent.com/sindresorhus/cli-spinners/master/spinners.json
fi

spinners=$(cat spinners.json|jq 'keys' |tr ',' ' ' |grep -v '\[' |grep -v '\]' |xargs)

for s in $spinners; do
  cat spinners.json|jq .${s}.frames | tr -d '\n' |tr -d ' ' |tr -d '\['  |tr -d '\]' |tr -d ',' |tr -d '"'
done
