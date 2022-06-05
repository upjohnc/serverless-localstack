import logging
import os

# from loguru import logger
# import pysycopg2


logger = logging.getLogger()
logger.setLevel(logging.INFO)


def run(event, context):
    logger.info(f"Event info: {event}")
    logger.info(os.environ.get("LOG_THRESHOLD"))
    logger.info("Useful")
    return {"what": "big deal"}
