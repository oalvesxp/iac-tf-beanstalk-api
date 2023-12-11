## Beanstalk Application Configuration
resource "aws_elastic_beanstalk_application" "this" {
  name        = var.repo_name
  description = var.repo_description

  #   appversion_lifecycle {
  #     service_role          = aws_iam_role.beanstalk.arn
  #     max_count             = 128
  #     delete_source_from_s3 = true
  #   }
}

