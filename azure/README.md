## Getting started with Otomi on AKS

### Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://cloud.google.com/sdk/docs/install)

#### Azure CLI Cheat Sheet

```bash
# Sign in to Azure
az login
# Get a list of subscriptions for the logged in account
az account list
# Set subscription
az account set --subscription=<subscription_id>
```

---

### Set up a managed kubernetes cluster on AKS

- Navigate into the `aks` directory
- Add your Azure Subscription Id and Tenant ID to the `terraform.tfvars.example` and rename the file to `terraform.tfvars`
- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Sets up the AKS cluster
terraform apply
```

---

### Install Otomi

When the cluster is available:

- Navigate to the `otomi-install` directory
- Fill in the  `terraform.tfvars` if not using defaults
- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Deploys and otomi installer job on the AKS cluster
terraform apply
```

Check the logs of the Otomi installer job to see when the installation has finished. The installation can take around 20 to 30 minutes.

First get the credentials of the cluster:

```bash
# Default: az aks get-credentials --resource-group otomi-quickstart-rg --name otomi-quickstart --admin
az aks get-credentials --resource-group <resource-group-name> --name <cluster-name>
```

Monitor the logs of the installer job:

```bash
kubectl logs jobs/quickstart-otomi -n default -f
```

When the installer is finished, copy the `url` and `admin-password` from the console output.

Follow the post installation steps [here.](https://otomi.io/docs/installation/post-install)
