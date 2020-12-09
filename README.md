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

### Prepare Inputs to the Build Script
- Make and change into a new project directory named for your project, `<your-project-name>`
- create a `requirements.txt` file specifying the extra pakcages (that you don't already get for free from aws)
- create a subdirectory called `function_code`.  Put all your python code and non-architecture-specific libraries here.
- directory structure might look like this:
```
your-project-name/
├── README.md
├── function_code
│   └── example.py
└── requirements.txt
```

### Build Your AWS Lambda Function Zip File
- build: `./build_lambda.sh <your-project-name>`
- inspect: `./inspect.sh <your-project-name>`
