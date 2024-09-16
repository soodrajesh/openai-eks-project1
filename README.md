
# OpenAI Text Generation API on Kubernetes

  

This project demonstrates how to deploy a Flask-based API that uses OpenAI's GPT-4o mini model for text generation, running on a Kubernetes cluster in AWS EKS.

  

## Project Overview

  

This application provides a simple API endpoint that generates text responses based on user prompts using OpenAI's GPT-4o mini model. It's containerized using Docker and deployed on a Kubernetes cluster, making it scalable and easy to manage.

  

## Features

  

- Flask-based API server

- Integration with OpenAI's GPT-4o mini model

- Docker containerization

- Kubernetes deployment on AWS EKS

- GitHub Actions for CI/CD

  

## Prerequisites

  

- AWS account with EKS cluster set up

- Docker installed locally

- kubectl configured to interact with your EKS cluster

- OpenAI API key

  

## Project Structure

  

openai-eks-project1/

├── app/

│ └── src/

│ ├── app.py

│ └── requirements.txt

├── k8s/

│ ├── deployments/

│ │ └── openai-app-deployment.yaml

│ └── services/

│ └── openai-app-service.yaml

├── .github/

│ └── workflows/

│ └── deploy.yml

├── Dockerfile

└── README.md

  
  

## Setup and Deployment

  

1. Clone the repository:

```bash
git clone https://github.com/yourusername/openai-eks-project1.git
```
```bash
cd openai-eks-project1
```
  
2. Build and push the Docker image:

  
```bash
docker build -t your-docker-repo/openai-app:latest .
```
```bash
docker push your-docker-repo/openai-app:latest
```
  
3. Create a Kubernetes secret for your OpenAI API key:

 ```bash
kubectl create secret generic openai-secret --from-literal=api-key=your_openai_api_key
```
  
4. Apply the Kubernetes configurations:
```bash
kubectl apply -f k8s/deployments/openai-app-deployment.yaml
```
```bash
kubectl apply -f k8s/services/openai-app-service.yaml
```
5. Get the LoadBalancer URL:
```bash
kubectl get services openai-app-service
```
  
## Usage

  

To generate text, send a POST request to the `/generate` endpoint:


```bash

curl  -X  POST  http://your-loadbalancer-url/generate  \

-H  "Content-Type: application/json"  \

-d  '{"prompt": "What are the benefits of cloud computing?"}'

```

{"generated_text":"Cloud computing offers a wide range of benefits for individuals and organizations. Here are some of the key advantages:\n\n1. **Cost Efficiency**: \n - **Reduced Capital Expenses**: Cloud computing eliminates the need for businesses to invest heavily in physical hardware and infrastructure. Instead, they can use a pay-as-you-go model.\n - **Lower Operational Costs**: Maintenance and management of hardware and software are handled by the cloud service provider, reducing operational costs.\n\n2. **Scalability**:"}


## CI/CD

This project uses GitHub Actions for continuous integration and deployment. The workflow is defined in .github/workflows/deploy.yml. It automatically builds and pushes the Docker image, and updates the Kubernetes deployment on push to the main branch.

Monitoring and Maintenance

Monitor the application logs:

```bash 
kubectl logs -f deployment/openai-app
```
Check pod status:

``` bash
kubectl get pods
```

Update the deployment (e.g., after changing the Docker image):
``` bash
kubectl set image deployment/openai-app openai-app=your-docker-repo/openai-app:new-tag
```