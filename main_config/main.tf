terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "my-terraform-state-bucket-0008987"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-state-lock-table"
    encrypt        = true
  }
}

