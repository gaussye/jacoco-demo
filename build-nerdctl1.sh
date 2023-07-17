#!/bin/sh
search_dir=dockerfiles
for entry in "$search_dir"/*
do
  echo "building $entry"
  
  nerdctl build -t "test" -f "$entry" --output type=image,name=registry/image,push=true . &
done

wait

nerdctl images
