#!/bin/bash

setterm -cursor off
IFS=$'\n'
for s in $(./generateFrom.sh); do
  if [[ "$s" == "next" ]]; then
    echo -n " Next spinner"
    printf "\n\n"
  else
    s=$(echo $s |tr -d '""')
    printf "\r${s}"
    sleep .2
  fi
done

exit

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
