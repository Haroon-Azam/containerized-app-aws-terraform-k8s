variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "devops-portfolio-app"
}