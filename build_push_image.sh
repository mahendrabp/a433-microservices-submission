#!/bin/bash

# variable
IMAGE_NAME="item-app"
IMAGE_TAG="v1"


# build docker image
sudo docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

# show all images 
sudo docker images

# sleep to inspect the list of image
sleep 2s

# tag docker image
sudo docker tag "$IMAGE_NAME:$IMAGE_TAG" "$DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

# you can skip the login if you're already logged in
echo "$DOCKERHUB_PASSWD" | sudo docker login -u "$DOCKERHUB_USERNAME" --password-stdin


# push the image
sudo docker push "$DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"




