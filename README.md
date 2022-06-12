# serverless framework on localstack

Table of Contents
1. [set up local environment](#set-up)
1. [Running Serverless](#running-serverless)

## Set Up

To make this repo run, you will need npm to install serverless cli and packages and also python to get
the third party packages on deployment.

Note: the repo has a `.justfile` which  you can think of as a `makefile`.
To run the "recipes" in the `.justfile` you will need `just` - you can `brew install just` if you are on a mac.

### NPM

You can `brew install npm` if you are on a mac and then install the packages. \
Either : `just serverless-plugins` or `npm install -d`

### Python

Python is needed for building the zip file with the third party packages.  Your local python version
does not effect the running of the lambda.  That is defined as the `runtime` in the `serverless.yml`.

If you would like, you can follow the instructions to set up the local environment as the repo is set up.
Or alternatively, you can also change the files to match what you already have set up locally.

If you choose to change the files:
- change the `serverless.yml` line `runtime: python3.9` to your python version
- change the python version in `pyproject.toml` `python = "~3.9"`
- install poetry: `pip install poetry`

For setting up your environment to match the configuration of the files:

To have python 3.9 as the version for your virtual env, you can set up
pyenv and allow the `.python-version` file set your local python version.
Install pyenv, `brew install pyenv`.

Then to ensure that pyenv has installed the desired python version:
- run `just install-python`
  - install the python version based on what version is in the pyenv `.python-version` file

Set up your local python virtual env with poetry
- run `pip install poetry`
- run `just virtualenv-install`
  - create the python virtualenv with poetry

## Running Serverless

The repo is designed to deploy the lambda to localstack.  The basics are that it is a docker container running locally
to replicate a cloud provider (like aws).  [localstack service url](https://localstack.cloud)

Steps

- in one terminal : start the localstack docker container
  - `just localstack-up`
- in another terminal: deploy your serverless set up
  - `just sls-first-time-local`
  - this will first create the s3 bucket on localstack where the lambda will be pushed to
  - then it will do all of the "serverless stuff" : `pip install` third party packages that will get zipped with the lambda, create the zip of the lambda and third party packages, etc
- `just sls-invoke-local`
  - this will trigger the lambda in localstack

If you have localstack api key, add it as an env var before running `just localstack-up`
go to `https://app.localstack.cloud` to see the resources

Clean up:
- `ctrl-c` in the terminal running localstack
- `just localstack-down` to "clean up" after the docker compose run
