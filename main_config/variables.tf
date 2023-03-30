variable "region" {
  default = "us-east-1"
}

variable "bucket" {
  description = "Name of the S3 bucket used for the Terraform backend"
}

variable "dynamodb" {
  description = "Name of the DynamoDB table used for state locking"
}

variable "namespace" {
  default     = "default"
  description = "A namespace to use for resource names"
}
