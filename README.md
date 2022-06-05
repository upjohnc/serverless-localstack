# serverless framework on localstack


## Set up

- run `just install-python`
- run `just serverless-plugins`
- run `just virtualenv-install`
- run `just precommit`

in one terminal
`just localstack-up`

in another terminal

`just sls-first-time-local`
`just sls-invoke-local`

## dynamo

- run `just sls-first-time-local`
- run `just dynamo-put` # add record
- run `just sls-invoke-local`

