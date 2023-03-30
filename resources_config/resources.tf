# This is a Terraform configuration file for a state storage bucket and a state
# lock table. The bucket is configured to block public access and the table
# is configured to use on-demand billing mode. Both the bucket and the table
# have tags applied to them.

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-0008987"

  tags = {
    Environment = "my-namespace"
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "my-terraform-state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "my-namespace"
    Terraform   = "true"
  }
}
