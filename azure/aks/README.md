## Getting started with Otomi on AKS
---
### Prerequisites

- [GCloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://cloud.google.com/sdk/docs/install)


### Set up a managed kubernetes cluster on GKE

- Navigate into the `gcp/gke` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields
- Open a terminal and run the following, 
```bash
# Initialises the directory
terraform init
# Sets up the GKE cluster
terraform apply
```

### Install Otomi
- Navigate to the `gke/otomi-install` directory
- Rename the `terraform.tfvars.example` to `terraform.tfvars` and fill in the fields
- Open a terminal and run the following, 
```bash
# Initialises the directory
terraform init
# Deploys and otomi installer job on the GKE cluster
terraform apply
```

### Some useful GCloud commands

The following commands will be handy in case you have not setup your gcloud sdk

```bash
# Initialise and authentication
gcloud init
gcloud auth login
gcloud auth application-default login

# Enable google services api
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com

# Update kubeconfig
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

# In case of `Error: project: required field is not set`
# export the env variable with the project name
export GOOGLE_PROJECT=YOUR_PROJECT_NAME
```
