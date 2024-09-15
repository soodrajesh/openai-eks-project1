#!/bin/bash

# Create the main project directory
mkdir -p openai-eks-project

# Create subdirectories
mkdir -p openai-eks-project/{app,k8s,scripts,config}

# Create app subdirectories
mkdir -p openai-eks-project/app/{src,tests}

# Create k8s subdirectories
mkdir -p openai-eks-project/k8s/{deployments,services,secrets}

# Create config subdirectories
mkdir -p openai-eks-project/config/{dev,staging,prod}

# Create empty files
touch openai-eks-project/app/src/app.py
touch openai-eks-project/app/src/requirements.txt
touch openai-eks-project/app/Dockerfile
touch openai-eks-project/k8s/deployments/openai-app-deployment.yaml
touch openai-eks-project/k8s/services/openai-app-service.yaml
touch openai-eks-project/k8s/secrets/openai-secrets.yaml
touch openai-eks-project/scripts/deploy.sh
touch openai-eks-project/config/{dev,staging,prod}/config.yaml
touch openai-eks-project/.gitignore
touch openai-eks-project/README.md

echo "Project directory structure created successfully."
