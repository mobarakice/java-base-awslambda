#Use official gradle image to build project
FROM gradle:8.4-jdk17 AS builder
#Init working directory and copy all project files into it
WORKDIR /app
COPY . /app


#Do executable the gradlew and build project
#RUN chmod +x gradlew
#RUN ./gradlew build
RUN gradle build

## Use the official AWS Lambda Java 17 base image
FROM public.ecr.aws/lambda/java:17-arm64

COPY --from=builder /app/build/classes/java/main ${LAMBDA_TASK_ROOT}
COPY --from=builder /app/build/dependency/* ${LAMBDA_TASK_ROOT}/lib/
#
## Set the handler for the Lambda function
CMD ["com.example.PrimeNumberLambda::handleRequest"]
