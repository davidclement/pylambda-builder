# Python3.7 AWS Lambda Function Builder

A Dockerfile for building python libraries on Amazon Linux for shipping with an AWS lambda function written in Python3.7


## Problem

Packages like Pillow install in an architecture-specific manner.  So when you do the recommended `pip3 install --target ./ pillow` on your Mac, and then zip up the files along w/ your python AWS lambda function, it doesn't work.  [Some discussion of the problem here](https://stackoverflow.com/questions/45473501/getting-pil-pillow-4-2-1-to-upload-properly-to-aws-lambda-py3-6)

## This Solution

Build a Docker image that runs a script, `build.sh`, to

- install your desired python libraries in an Amazon Linux container and
- zip up the libraries along with your code

***

## Directions

### Build the Docker Image

`docker build -t <YOUR_IMAGE_TAG_HERE> .`

### Prepare Inputs to the Build Script
- Make and change into a new directory anywhere on your system
- create a file `pypackages.txt` that contains the architecture specific (or any other) python libraries you need to include in your lambda function. 
    - just the name of each package, one per line and nothing else.  Example:
    ```
    >cat pypackages.txt 
    pillow
    ```
    - NOTE: don't include libraries that Amazon already provides -- that will just make your function package unnecessarily large
- create a subdirectory called `src`.  Put all your python code and non-architecture-specific libraries here.
- directory structure might look like this:
```
example-lambda-function/
├── README.md
├── function_code
│   └── example.py
└── pypackages.txt
```

### Build Your AWS Lambda Function Zip File
- From the directory containing `pypackages.txt`, run the container: `docker run --rm -v $(pwd):/src <YOUR_IMAGE_TAG_HERE>`
- Inspect the output zip file `lambda-func.zip` w/ `zip --show-files lambda-func.zip`
