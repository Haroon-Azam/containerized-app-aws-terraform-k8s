## Completed Stages

### Stage 0: Setup and Installation

Set up the local DevOps environment on Windows with:

- Docker Desktop
- AWS CLI
- Terraform
- kubectl
- kind
- Git/GitHub
- Local Kubernetes cluster using kind

### Stage 1: Docker

Built and ran a containerized Python Flask web application.

Completed:

- Created a Flask web app
- Added `/` and `/health` endpoints
- Created `requirements.txt`
- Created a `Dockerfile`
- Built Docker image: `devops-portfolio-app:v1`
- Ran container locally on port `5000`
- Verified app in browser
- Checked container logs using Docker CLI

### Stage 2: Terraform and AWS ECR

Provisioned an AWS ECR repository using Terraform and pushed the Docker image to ECR.

Completed:

- Created Terraform configuration for AWS provider
- Created an ECR repository using Terraform
- Used Terraform variables, outputs, and resource tags
- Enabled image scan-on-push for the ECR repository
- Fixed IAM permission issue for `ecr:CreateRepository`
- Authenticated Docker with AWS ECR
- Tagged local Docker image for ECR
- Pushed Docker image to AWS ECR with tag `v1`

ECR image:

```text
552631484386.dkr.ecr.us-east-1.amazonaws.com/devops-portfolio-app:v1