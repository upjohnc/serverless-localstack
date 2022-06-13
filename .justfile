default:
    @just --list

# Set up

install-python:
    pyenv install $(cat .python-version)

serverless-plugins:
    npm install -d

virtualenv-install:
    poetry env use $(which python)
    poetry install

precommit:
    pre-commit install

# Running

localstack-up:
    docker compose -f ./docker/docker-compose-localstack.yml up

localstack-down:
    docker compose -f ./docker/docker-compose-localstack.yml down

create-deploy-bucket:
    awslocal s3 mb s3://deploy-bucket

sls-deploy-local:
    SLS_DEBUG=* poetry run sls deploy --stage local --verbose

sls-invoke-local:
    SLS_DEBUG=* sls invoke --function Basic --stage local --data '{"my_name": "whamo"}'

sls-first-time-local: create-deploy-bucket sls-deploy-local

dynamo-put:
    awslocal dynamodb put-item --table-name users_table --item '{"email": {"S": "you@mail.com"}}'

dynamo-scan:
    awslocal dynamodb scan --table-name users_table
