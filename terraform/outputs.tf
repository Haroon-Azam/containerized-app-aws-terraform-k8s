output "ecr_repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.app_repository.name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.app_repository.repository_url
}

output "ecr_repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.app_repository.arn
}