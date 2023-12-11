## Beanstalk application configuration
resource "aws_elastic_beanstalk_application" "this" {
  name        = var.repo_name
  description = var.repo_description

  #   appversion_lifecycle {
  #     service_role          = aws_iam_role.beanstalk.arn
  #     max_count             = 128
  #     delete_source_from_s3 = true
  #   }
}

## Beanstalk environment configuration
resource "aws_elastic_beanstalk_environment" "this" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.this.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.1.1 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile
  }
}