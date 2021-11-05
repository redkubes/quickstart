## Getting started with Otomi on EKS (Coming Soon)

### Prerequisites

- [Terraform](https://cloud.google.com/sdk/docs/install)

### Set up a managed kubernetes cluster on EKS

- Navigate into the `eks` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields

- Open a terminal and run the following,

```bash
# Initializes the directory
terraform init
# Sets up the EKS cluster
terraform apply
```

### Install Otomi

- Navigate to the `otomi-install` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields
- Open a terminal and run the following,

```bash
# Initializes the directory
terraform init
# Deploys and otomi installer job on the EKS cluster
terraform apply
```
