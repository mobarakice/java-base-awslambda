#!/bin/sh

# Set the classpath for your Lambda function
# shellcheck disable=SC2034
# shellcheck disable=SC2125
CLASSPATH=/var/runtime/*:/var/task/*

# Set the Lambda function handler
HANDLER=com.example.PrimeNumberLambda::handleRequest

# Specify the request payload file
EVENT_FILE=/var/task/event.json

# Set the response file where Lambda will write the function result
RESPONSE_FILE=/var/task/response.json

# Run the AWS Lambda runtime
exec /var/runtime/aws-lambda-rie /var/runtime/bootstrap $HANDLER < $EVENT_FILE > $RESPONSE_FILE
