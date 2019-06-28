# This image builds a python lambda package for AWS with libraries not included by default.
# The motivation is to install architecture-specific py packages on az linux for 
#    compatibility, specifically "pillow", the port of PIL, the image processing package.
# There is no reason to use this image if you don't need any extra python libraries.  
# this image expects:

# 1. The container to be run w/: `docker run --rm -v $(pwd):/src dclement/pylambda-builder`
# 2. ./ to contain "pypackages.txt" with non-lambda-standard python packages to install 
# 3. ./ to contain a "./function_code" subdir with the files to be packaged for the lambda
FROM amazonlinux:latest

RUN yum install -y python37 && \
    pip3 install --upgrade pip && \
    yum install -y zip  

RUN mkdir -p /build/install && \
    mkdir -p /src/function_code
WORKDIR /build

COPY build.sh build.sh
RUN chmod 777 build.sh 

CMD /build/build.sh
