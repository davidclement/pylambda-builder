#!/bin/bash

PROJECT=$1

ZIP_FILE=$PROJECT/lambda-func.zip

echo "showing files in '$ZIP_FILE'"

zip --show-files $ZIP_FILE
