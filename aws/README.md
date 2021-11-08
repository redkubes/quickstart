## Getting started with Otomi on EKS

### Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://cloud.google.com/sdk/docs/install)

### Set up a managed kubernetes cluster on EKS

- Navigate into the `eks` directory
- Add your aws credentials to the `terraform.tfvars.example` and rename the file to `terraform.tfvars`
- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Sets up the EKS cluster
terraform apply
```

### Install Otomi

- Navigate to the `otomi-install` directory
- Add your `aws_region` to the `terraform.tfvars.example` and rename the file to `terraform.tfvars`
- Open a terminal and run the following:

```bash
# Initializes the directory
terraform init
# Deploys and otomi installer job on the EKS cluster
terraform apply
```

Check the logs of the Otomi installer job to see when the installation has finished. The installation can take around 20 to 30 minutes.

First get the credentials of the cluster:

```bash
aws eks update-kubeconfig --name <cluster-name>
```

Monitor the logs of the installer job:

```bash
kubectl logs jobs/quickstart-otomi -n default -f
```

When the installer is finished, copy the `url` and `admin-password` from the console output. Follow the post installation steps [here](https://otomi.io/docs/installation/post-install)
