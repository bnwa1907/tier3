# Terraform Infrastructure Tir 3 web app with deploying aspent-mssql app 

## Overview

This project represent the usage of Terraform to create an AWS Virtual Private Cloud (VPC) with two public subnets, one private subnets, . Additionally, with deploying an web server in each puplic subnet with their backend database with load balancer.

## Prerequisites

Before you begin, ensure you have the following:

1. AWS CLI installed and configured with appropriate credentials.
2. Terraform CLI installed on your local machine.

## Project Structure

The project is structured as follows:

```
WIDEPOT-INTERN/
  ├── terraform/
     ├── provider.tf      
     ├── vpc.tf
     ├── ALB.tf
     ├── assosiate.tf
     ├── cert.tf
     ├── ec2.tf
     ├── eip.tf
     ├── internet.tf
     ├── privatekey.pem
     ├── SG.tf
     └── README.md
  
          

```
## Deployment Steps

1. Clone the project repository to your local machine:

   ```
   git clone <repository-url>
   cd <project directory>
   ```

2. Navigate to the `terraform` directory:

   ```
   cd terraform
   ```

3. Initialize Terraform:

   ```
   terraform init
   ```

4. Review and set any required variables in the `terraform.tfvars` file or provide them through command-line flags.

5. Plan the Terraform deployment:

   ```
   terraform plan
   ```

6. Apply the Terraform configuration:

   ```
   terraform apply
   ```

7. Copy Load Balancer DNS Name and Paste it in URL Navigation Bar

   ```
   you can see web application Now
   ``` 



## Cleanup
To remove all resources created by Terraform, use the following command:

```
terraform destroy
```


## Note 
There are some hashing commands in code about Some of my failed attempts, I saved to try and upgrade myself in the future
