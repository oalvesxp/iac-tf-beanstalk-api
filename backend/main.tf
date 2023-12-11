terraform {
  ################################################################
  ## After running terraform apply (with local backend)
  ## you will uncomment this code then rerun terraform init
  ## to switch from local backend to remote aws backend
  ################################################################
  # backend "s3" {
  #   bucket          = "tf-831511089306-us-east-1"
  #   key             = "tf-infra/terraform.tfstate"
  #   region          = "us-east-1"
  #   dynamodb_table  = "terraform-state-locking"
  #   encrypt         = true
  # }
}

## Setup the s3 bucket of tfstate file
resource "aws_s3_bucket" "this" {
  bucket        = "tf-831511089306-us-east-1"
  force_destroy = true
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "tfstate-831511089306"
  }
}

resource "aws_dynamodb_table" "this" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}