## Getting started with Otomi on GKE

---

### Prerequisites

- [GCloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://cloud.google.com/sdk/docs/install)

#### GCloud Cheat Sheet

```bash
# Initialize and authentication
gcloud init
gcloud auth login
gcloud auth application-default login

# Enable google services api
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```

---

### Set up a managed kubernetes cluster on GKE

- Navigate into the `gke` directory
- Add your Project ID and Project Region to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`

- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Sets up the GKE cluster
terraform apply
```

---

### Install Otomi

- Navigate to the `otomi-install` directory
- Add your GKE Cluster Name and Project Region to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`
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
# Default: gcloud container clusters get-credentials otomi-quickstart --region europe-west4
gcloud container clusters get-credentials <cluster_name> --region <region>
```

Monitor the logs of the installer job:

```bash
kubectl logs jobs/quickstart-otomi -n default -f
```

When the installer is finished, copy the `url` and `admin-password` from the console output.

Follow the post installation steps [here.](https://otomi.io/docs/installation/post-install)
