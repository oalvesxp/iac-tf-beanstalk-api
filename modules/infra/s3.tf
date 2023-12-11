## AWS S3 bucket configuration
resource "aws_s3_bucket" "this" {
  bucket = "${var.repo_name}-deploy7148"
}
