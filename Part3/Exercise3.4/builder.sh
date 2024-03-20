#!/bin/bash
echo Cloning $1 ...

name=$(basename $1)

git clone https://github.com/$1

echo Deleting .git folder ...
rm -rf ./$name/.git

echo Creating Dockerfile ...
touch Dockerfile
echo "FROM node:16" >> Dockerfile
echo "COPY ./${name} ." >> Dockerfile
echo "RUN npm install" >> Dockerfile
echo "CMD node index.js" >> Dockerfile

nameout=$(basename $2)
echo Building an image renamed $2 ...
docker build . -t $2

echo LOGIN ...
echo $DOCKER_PWD | docker login --username $DOCKER_USER --password-stdin

echo Pushing on Docker Hub ...
docker push $2 