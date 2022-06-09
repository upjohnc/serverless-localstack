# serverless framework on localstack

## Set up

- run `just install-python`
  - install the python version based on what version is in the pyenv `.python-version` file
- run `just serverless-plugins`
  - npm to install the serverless plugins
- run `just virtualenv-install`
  - create the python virtualenv with poetry
- run `just precommit`

in one terminal : start the localstack docker container

- `just localstack-up`

in another terminal

- `just sls-first-time-local`
  - deploy the resources to localstack
- `just sls-step-function-invoke`
  - run the step function

If you have localstack api key, add it as an env var before running `just localstack-up`
go to `https://app.localstack.cloud` to see the resources

