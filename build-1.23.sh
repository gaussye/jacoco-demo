#!/bin/sh
search_dir=dockerfiles
for entry in "$search_dir"/*
do
  echo "building $entry"
  
  docker build --network=host -t "test" -f "$entry" . &
done

wait

docker images
