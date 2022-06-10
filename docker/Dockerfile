FROM python:3.9-slim

ENV NODE_OPTIONS=--max_old_space_size=2048

RUN apt-get -y update && \
      apt-get -y upgrade && \
      apt-get -y install npm

COPY . .

# todo : add python pip install from poetry
RUN pip install poetry
RUN   npm install -g serverless && npm install -d
