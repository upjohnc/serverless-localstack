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

in one terminal : start the localstack docker container

- `just localstack-up`

in another terminal

- `just sls-first-time-local`
  - deploy the resources to localstack
- `just sls-step-function-invoke`
  - run the step function

If you have localstack api key, add it as an env var before running `just localstack-up`
go to `https://app.localstack.cloud` to see the resources

