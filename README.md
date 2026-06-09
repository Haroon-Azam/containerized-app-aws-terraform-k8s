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


### Stage 3: Kubernetes Deployment

Deployed the Dockerized Flask application to a local Kubernetes cluster using kind.

Completed:

- Created a local Kubernetes cluster using kind
- Loaded the local Docker image into the kind cluster
- Created Kubernetes Deployment YAML
- Created Kubernetes Service YAML
- Ran 2 replicas of the Flask application
- Added readiness and liveness probes using the `/health` endpoint
- Exposed the application using a NodePort service
- Tested the application locally using `kubectl port-forward`

Kubernetes commands used:

```bash
kind load docker-image devops-portfolio-app:v1 --name devops-portfolio
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get deployments
kubectl get pods
kubectl get services
kubectl port-forward service/devops-portfolio-service 8080:80


### Stage 5: Monitoring, Logging, and Resource Management

Added basic Kubernetes observability and resource management practices.

Completed:

- Used `kubectl get pods` to verify pod status
- Used `kubectl logs` to inspect application logs
- Used `kubectl describe deployment` to inspect deployment configuration
- Used `kubectl get events` to review cluster activity
- Added CPU and memory requests/limits to the Kubernetes Deployment
- Verified rollout after updating Kubernetes manifests
- Re-tested the application using `kubectl port-forward`

Useful commands:

```bash
kubectl get pods
kubectl get deployment devops-portfolio-app
kubectl get service devops-portfolio-service
kubectl logs deployment/devops-portfolio-app
kubectl describe deployment devops-portfolio-app
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl rollout status deployment/devops-portfolio-app
kubectl port-forward service/devops-portfolio-service 8080:80

### AWS Cost Cleanup

After testing the AWS ECR workflow, the ECR repository was deleted to avoid ongoing AWS storage charges.

Cleanup commands used:

```bash
aws ecr delete-repository --repository-name devops-portfolio-app --region us-east-1 --force
terraform state rm aws_ecr_repository.app_repository
terraform destroy