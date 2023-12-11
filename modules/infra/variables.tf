######################################################
## ECR (Elastic Container Registry) variables 
variable "repo_name" {
  description = "Name of repository ECR"
  type        = string
}

######################################################
## Beanstalk variables
variable "repo_description" {
  description = "Description of repository ECR"
  type        = string
}

variable "environment" {
  description = "Name of environment Beanstalk"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "max_size" {
  description = "Maximum simultaneous instances in EC2"
  type        = number
  default     = 1
}