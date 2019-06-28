#!/bin/bash

#                 Purpose           Now                  Future
# Container       build.sh         /src                  /build
# Container       bind2src         /build/package        /src             
# Container       zip src          /build/package        /build/install
#
# 
# Local (IB)      build.sh         ./                    ./
# 
# Local (PB)      output           ./                    ./          -> /src on container
# Local (PB)      pysrc            ./build               ./function_code  -> /src/function_code on container
# Local (PB)      pypackages.txt   ./build               ./          -> /src on container

# Container:
# - /build/build.sh (build script in image)
# - /build/install/ (where build.sh will install packages and source to make zip file)
# - /src (should be created in bind mount when container is launched)

# Local Package Build 
# - ./pypackages.txt (the packages we need to install into the lambda zip file -- /src/pypackages.txt on container))
# - ./lambda-func.zip (the output of build.sh -- /src/lambda-func.zip on container)
# - ./function_code/ (the python code for the function -- /src/function_code on container)

# Local Image Build
# - ./build.sh -- the build script to be copied into image at /build/build.sh
# - ./Dockerfile

cp -r /src/function_code/* /build/install

for pypkg in `cat /src/pypackages.txt`
do
  pip3 install $pypkg --target /build/install
done

cd /build/install && \
  zip -r /src/lambda-func.zip .
