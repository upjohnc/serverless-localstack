import os

import boto3
from loguru import logger


def run(event, context):
    logger.info(f"Event info: {event}")
    logger.info(os.environ.get("LOG_THRESHOLD"))
    logger.info("Useful")
    client = boto3.client("dynamodb")
    response = client.scan(TableName="users_table")
    logger.info(response)
    return response
