# Build a lambda function zip file 

This directory shows an example of how to use the docker image pylambda-builder
- cd to this dir
- the list of packages to install into the zipfile goes in `./pypackages.txt` -- just the name of each package, one to a line
- the python code for the function goes in `./function_code`
- run the container: `docker run --rm -v $(pwd):/src dclement/pylambda-builder`
- check the contents of the zipfile: `zip --show-files ./lambda-func.zip`
