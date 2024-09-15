#!/bin/bash

# Set variables
ECR_REGISTRY="471112694187.dkr.ecr.us-west-2.amazonaws.com"
ECR_REPOSITORY="openai-app"
IMAGE_TAG="latest"

# Build and push Docker image
docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG ./app
aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin $ECR_REGISTRY --profile raj-private
docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG

# Apply Kubernetes manifests
kubectl apply -f k8s/secrets/openai-secrets.yaml
envsubst < k8s/deployments/openai-app-deployment.yaml | kubectl apply -f -
kubectl apply -f k8s/services/openai-app-service.yaml
