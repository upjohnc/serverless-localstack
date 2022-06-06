import os

from loguru import logger


def run(event, context):
    logger.info(f"Event info: {event}")
    logger.info(os.environ.get("LOG_THRESHOLD"))
    logger.info("Useful")
    return {"what": "big deal"}
