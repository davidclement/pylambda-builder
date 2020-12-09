#!/bin/bash

# this is copied into the Docker image, and then is run from the container to
# ensure any architecture-specific libraries get built on azlinux

INSTALL_DIR=/build/install
REQUIREMENTS=/src/requirements.txt
SRC_CODE_DIR=/src/function_code

# copy the python code from the workstation into the container's install dir
cp -r $SRC_CODE_DIR/* $INSTALL_DIR

# install requirements
if test -f "$REQUIREMENTS"; then
    pip3 install -r $REQUIREMENTS --target $INSTALL_DIR
fi

# cd into the install dir and zip everything up into the bind mounted dir for access on workstation
cd $INSTALL_DIR && \
  zip -r /src/lambda-func.zip .
