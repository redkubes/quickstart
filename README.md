# Otomi Quickstarts

Quickly deploy a Kubernetes cluster with [Otomi](https://github.com/redkubes/otomi-core) in public cloud of your choice.

**NOTE:** Intended for experimentation/evaluation ONLY.

**You will be responsible for any/all infrastructure costs incurred by the used resources.**
This repository intends to minimize costs by only provisioning the minimum required resources for a given provider.

---

## Public cloud providers

The quickstart is available for:

- [**Google Cloud Platform** (`gcp`)](./gcp)
- [**Microsoft Azure Cloud** (`azure`)](./azure)
- [**Amazon Web Services** (`aws`)](./aws)

The quickstart creates managed Kubernetes cluster (AKS/GKE/EKS) and installs Otomi in evaluation mode, which does not require any 3rd party services (e.g.: DNS, IdP, KMS). For a full (enterprise/production) setup, please visit [otomi.io](https://otomi.io)

### Requirements

- Terraform >=0.14.0 (installation guide: [link](https://learn.hashicorp.com/tutorials/terraform/install-cli))
- Credentials for the cloud provider used for the quick start

### Deploy

To deploy a quickstart, perform the following steps:

1. Clone this repository
2. Choose a cloud provider and navigate into `<cloud-provider>/<managed-k8s>` folder (e.g.: cd aws/eks)
3. Copy `terraform.tfvars.example` file to `terraform.tfvars` file and fill in missing configuration parameters 
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
