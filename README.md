![agdias](https://circleci.com/gh/agdias/devops-ml-api.svg?style=svg)(https://circleci.com/gh/agdias/devops-ml-api/tree/master)


## Project Overview

In this project, I had the opportunity to apply the skills  acquired in the Microservices at Scale using AWS & Kubernetes topic from Udacity's Cloud Devops Engineer Nanodegree   course to operationalize a Machine Learning Microservice API.

## Steps to run on Docker

1. run the run_docker.sh script
   This will build the image for the service
2. Upload the image built on step 1 to Docker Hub Repository 
3. Make a  prediction
   You have to run the make_prediction_docker.sh
   Example:
   make_prediction_docker.sh
   
```
      Port: 8000
      {
        "prediction": [
          20.35373177134412
        ] 
      }
```

## Steps to run on Kubernetes
1. Run the run_kubernetes.sh script
   This will create a pod and a service to expose the application to the outside of container

2. Make a prediction
   Run the make_prediction_kubernetes.sh
```
     Port: 32364
      {
        "prediction": [
          20.35373177134412
        ]
      }
```
   




