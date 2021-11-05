## Getting started with Otomi on AKS

### Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://cloud.google.com/sdk/docs/install)

### Set up AKS in Azure

- Navigate into the `aks` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields
- Open a terminal and run the following,

```bash
# Initializes the directory
terraform init
# Sets up the AKS cluster
terraform apply
```

### Install Otomi

- Navigate to the `otomi-install` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields
- Open a terminal and run the following,

```bash
# Initializes the directory
terraform init
# Deploys and otomi installer job on the AKS cluster
terraform apply
```

### Access the cluster API

```bash
az login
az account list
az account set --subscription=<subscription_id>

# Update kubeconfig
az aks get-credentials --resource-group  <resource_group_name> --name <name of the cluster>

```
