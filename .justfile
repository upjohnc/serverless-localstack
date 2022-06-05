default:
    @just --list

# Set up

serverless-plugins:
    npm install -d

virtualenv-install:
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
    SLS_DEBUG=* sls invoke local --function Basic --stage local

sls-first-time-local: create-deploy-bucket sls-deploy-local

