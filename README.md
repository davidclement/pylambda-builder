# Python AWS Lambda Function Builder

- This image builds a python lambda package for AWS with libraries not included by default.
- The motivation is to install architecture-specific py packages on az linux for compatibility, specifically "pillow", the port of PIL, the image processing package.
- There is no reason to use this image if you don't need any extra python libraries.  

## This image expects:

1. The container to be run w/: `docker run --rm -v $(pwd):/src dclement/pylambda-builder`
2. `./pypackages.txt` with non-lambda-standard python packages to install 
3. `./function_code/` subdir with the python code to be packaged for the lambda
