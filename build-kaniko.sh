#!/bin/sh
search_dir=dockerfiles
for entry in "$search_dir"/*
do
  echo "building $entry"
  /kaniko/executor --dockerfile `pwd`/$entry --context `pwd` --no-push --ignore-path=/var/mail --ignore-path=/var/spool/mail &
done

wait
