# Terraform Project

This Terraform project creates an S3 bucket and a DynamoDB table to manage Terraform state. The project consists of two separate configurations: `resources_config` for creating the resources, and `main_config` for managing the backend.

## Resources Configuration

The `resources_config` directory contains a Terraform configuration file, `resources.tf`, that creates the following resources:

- An S3 bucket to store Terraform state files
- A DynamoDB table to store state locks

### Usage

1. Navigate to the `resources_config` directory:

   ```sh
   cd resources_config
   ```


2. Initialize the Terraform configuration:

    ```sh
    terraform init
    ```


3. Apply the Terraform configuration:

    ```sh
    terraform apply
    ```


## Main Configuration

The `main_config` directory contains a Terraform configuration file, `main.tf`, that configures the backend for state management using the S3 bucket and DynamoDB table created in the `resources_config`.

### Usage

1. Navigate to the `main_config` directory:

    ```sh
    cd main_config
    ```

2. Initialize the Terraform configuration:

    ```sh
    terraform init
    ```

3. During initialization, Terraform will ask if you want to copy the existing state to the new backend. Confirm the operation.
    
    Apply the Terraform configuration:

    ```sh
    terraform apply
    ```


## Using the S3 Backend in Other Modules

To use the same S3 backend for state management in your other Terraform modules, include the `terraform` block with the S3 backend configuration in each module's `main.tf` file. Make sure to update the `key` parameter for each module to ensure they have unique state files.

Example:

```hcl
terraform {
required_version = ">= 1.0.0"

backend "s3" {
 bucket         = "my-terraform-state-bucket-00987"
 key            = "unique-key-per-module/terraform.tfstate"
 region         = "us-east-1"
 dynamodb_table = "my-terraform-state-lock-table"
 encrypt        = true
}
}
```

After adding the backend configuration to each module's main.tf file, run terraform init within each module's directory to configure the backend for state management.