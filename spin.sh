#!/bin/bash

for c in $(./generateFrom.sh); do spin="$spin $c"; done

for s in $spin; do
  if [[ "$s" == "next" ]]; then
    echo -n " Next spinner"
    echo
  else
    s=$(echo $s |tr -d '""')
    printf "\r${s}"
    sleep .1
  fi
done

# Second way of doing "it"
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

echo -n "${spin[0]}"
while true
do
  for i in "${spin[@]}"
  do
        echo -ne "\b$i"
        sleep 0.1
  done
done
