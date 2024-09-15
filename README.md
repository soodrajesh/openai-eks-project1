# OpenAI App on EKS

This project deploys a Flask application that interacts with the OpenAI API on Amazon EKS.

## Prerequisites

- AWS CLI configured with appropriate permissions
- kubectl installed and configured to interact with your EKS cluster
- Docker installed locally

## Setup

1. Update the `ECR_REGISTRY` in `scripts/deploy.sh` with your ECR registry.
2. Set your OpenAI API key as an environment variable:
