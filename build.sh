#!/bin/bash
set -e

if [ -z $1 ]; then
  echo "Specify dockerfile"
  exit
fi
project=${1/\.dockerfile/}
docker rm $project &> /dev/null || true
rm -f ./output/$project &> /dev/null || true

docker build -f $project.dockerfile -t $project .
docker run --name $project $project:latest
docker cp $project:/build/deb ./output
