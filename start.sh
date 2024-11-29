#!/usr/bin/env bash

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

if [ ! -d ./$year ]; then
    mkdir $year
    echo "Year folder created."
fi
if [[ month -eq 12 ]] && [[ day -lt 25 ]]; then
  if [ ! -d ./$year/day_$day ]; then  
    cp -r skel ./$year/day_$day
  fi
  cd $year/day_$day
  $EDITOR input.txt
else
  echo "Advent calendar hasn't started yet."
fi

