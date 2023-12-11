## ECR (Elastic Container Registry) variables 
variable "repo_name" {
  description = "Name of repository ECR"
  type        = string
}

## Beanstalk variables
variable "repo_description" {
  description = "Description of repository ECR"
  type        = string
}
