import os

import boto3
from loguru import logger

host_name = os.environ["LOCALSTACK_HOSTNAME"]
# forcing localstack to show how to use with tests
localstack = True
endpoint_url = dict()
if localstack:
    endpoint_url = dict(endpoint_url=f"http://{host_name}:4566")


def run(event, context):
    logger.info(f"Event info: {event}")
    logger.info(os.environ.get("LOG_THRESHOLD"))
    logger.info("Useful")
    client = boto3.client("dynamodb", **endpoint_url)
    response = client.scan(TableName="users_table")
    try:
        logger.info(response.get("Items")[0].get("email"))
    except Exception:
        logger.info(response)
    return response
