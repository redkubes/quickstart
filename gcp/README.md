## Getting started with Otomi on GKE

---

### Prerequisites

- [GCloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://cloud.google.com/sdk/docs/install)

### Create a GKE cluster in GCP

- Navigate into the `gke` directory
- Add your Project ID and Project Region to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`

- Open a terminal and run the following,

```bash
# Initializes the directory
terraform init
# Sets up the GKE cluster
terraform apply
```
### Install Otomi

- Navigate to the `otomi-install` directory
- Add your Project ID and Project Region to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`
- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Deploys and otomi installer job on the GKE cluster
terraform apply
```

Check the logs of the Otomi installer job to see when the installation has finished. The installation can take around 20 to 30 minutes.

First get the credentials of the cluster:

```bash
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```

Monitor the logs of the installer job:

```bash
kubectl logs jobs/quickstart-otomi -n default -f
```

When the installer is finished, copy the `url` and `admin-password` from the console output. Follow the post installation steps [here](https://otomi.io/docs/installation/post-install)

### Some useful GCloud commands

The following commands will be handy in case you have not setup your gcloud sdk:

```bash
# Initialise and authentication
gcloud init
gcloud auth login
gcloud auth application-default login

# Enable google services api
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com

# In case of `Error: project: required field is not set`
# export the env variable with the project name
export GOOGLE_PROJECT=YOUR_PROJECT_NAME
```
