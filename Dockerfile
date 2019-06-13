FROM zenika/alpine-maven:3-jdk8

# Installing python
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN python --version

# Installing AWS CLI and SAM CLI
RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add --no-cache --virtual build-deps build-base gcc && \
    pip install awscli && \
    pip install aws-sam-cli && \
    apk del build-deps

RUN mkdir /app
WORKDIR /app
EXPOSE 3001