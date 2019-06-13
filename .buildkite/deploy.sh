#!/bin/bash -e

mvn package

echo "### SAM Deploy"

sam --version

sam package --template-file template.yaml --s3-bucket sam-buildkite-deployment-test --output-template-file packaged.yml

sam deploy --template-file ./packaged.yml --stack-name sam-buildkite-deployment-test --capabilities CAPABILITY_IAM --region ap-southeast-2

