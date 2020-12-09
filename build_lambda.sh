#!/bin/bash

# this is what you run to build your lambda zip file

PROJECT=$1
IMAGE_TAG=pylambda-$PROJECT

echo "building image, project is $PROJECT, image tag is $IMAGE_TAG"
docker build -t $IMAGE_TAG . && \

echo "running container to package code.."
docker run --rm -v $(pwd)/$PROJECT:/src $IMAGE_TAG