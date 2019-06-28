#!/bin/bash

# copy the python code from the workstation into the container's install dir
cp -r /src/function_code/* /build/install

# for each package listed in pypackages.txt, install it into the install dir
for pypkg in `cat /src/pypackages.txt`
do
  pip3 install $pypkg --target /build/install
done

# cd into the install dir and zip everything up into the bind mounted dir for access on workstation
cd /build/install && \
  zip -r /src/lambda-func.zip .
