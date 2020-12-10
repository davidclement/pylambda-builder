#!/bin/bash

PROJECT=$1

echo "running pre_build.sh for $PROJECT"

SRC_DIR=/Users/dclement/dave/hackweek-k8s-cost/

rm -rf $PROJECT/function_code/*
mkdir $PROJECT/function_code/data
cp $SRC_DIR/data/prices.txt $PROJECT/function_code/data/
cp $SRC_DIR/aws_asg.py $PROJECT/function_code/
cp $SRC_DIR/lambda_function.py $PROJECT/function_code/
cp $SRC_DIR/db.py $PROJECT/function_code/
