# Otomi Quickstarts

Quickly deploy a Kubernetes cluster with [Otomi](https://github.com/redkubes/otomi-core) in your public cloud of choice or install Otomi locally on your machine using Minikube.

**NOTE:** Intended for experimentation/evaluation ONLY.

**You will be responsible for any/all infrastructure costs incurred by the used resources.**
This repository intends to minimize costs by only provisioning the minimum required resources for a given provider.

---

## Public cloud providers

Quickstarts are available for:

- [**Google Cloud Platform** (`gcp`)](./gcp)
- [**Microsoft Azure Cloud** (`azure`)](./azure)
- [**Amazon Web Services** (`aws`)](./aws)

The Quickstart will create a managed Kubernetes cluster (AKS/GKE/EKS) and install Otomi without external dependencies like DNS, Active Directory or KMS. For a full (enterprise/production) setup, please visit [otomi.io](https://otomi.io)

### Requirements

- Terraform >=0.14.0
- Credentials for the cloud provider used for the quickstart

### Deploy

To deploy a quickstart, perform the following steps:

1. Clone or download this repository
2. Choose a cloud provider and navigate into `<cloud-provider>/<managed-k8s>` folder
3. Add the required information to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`
4. Run `terraform init`
5. Run `terraform apply`

Once the cluster is up and running,

1. Navigate to `otomi-install` folder
2. Add the required information to the `terraform.tfvars.example` file and rename the file to `terraform.tfvars`
3. Run `terraform init`
4. Run `terraform apply`

### Next Steps

1. Monitor the logs of the installer job

```bash
kubectl logs jobs/quickstart-otomi -n default -f
```

2. When the installer is finished, copy the `url` and `admin-password` from the console output
3. Follow the post installation steps [here](https://otomi.io/docs/installation/post-install)

### Destroy

When you're finished exploring Otomi, use terraform to tear down all resources in the quickstart.

**NOTE: Any resources not provisioned by the quickstart are not guaranteed to be destroyed when tearing down the quickstart.**
Make sure you tear down any resources you provisioned manually before running the destroy command.

```bash
# Navigate into `<cloud-provider>/<managed-k8s>` folder and run
terraform destroy -auto-approve
# This destroys all the resources without prompting confirmation
```

## Local cluster using Minikube (Coming Soon)

Next to the quickstarts for running Otomi in your public cloud of choice, you will soon also be able to run Otomi locally on your machine using [Minikube](https://minikube.sigs.k8s.io/docs/start/)
