# Quickstart examples for Otomi

Quickly deploy Otomi in your public cloud of choice or (comming soon) run Otomi locally on your machine with kind

Intended for experimentation/evaluation ONLY.

**You will be responsible for any/all infrastructure costs incurred by these used resources.**
This repository intends to minimize costs by only provisioning the minimum required resources for a given provider.

## Public cloud providers

Quickstarts are provided for [**Amazon Web Services** (`aws`)](./aws), [**Microsoft Azure Cloud** (`azure`)](./azure), and [**Google Cloud Platform** (`gcp`)](./gcp).

Each quickstart will install Otomi on a 3 nodes Kubernetes cluster. This setup provides easy access to all Otomi functionality while establishing a foundation that can be easily expanded to a full enterprise setup (using a public DNS zone, an external Git repository, or using Azure Active Directory as an IDP.

### Requirements - Cloud

- Terraform >=0.14.0
- Credentials for the cloud provider used for the quickstart

### Deploy

To begin with any quickstart, perform the following steps:

1. Clone or download this repository to a local folder
1. Choose a cloud provider and navigate into the provider's folder
1. Copy or rename `terraform.tfvars.example` to `terraform.tfvars` and fill in all required variables
1. Run `terraform init`
1. Run `terraform apply`

When provisioning has finished, terraform will output the URL to connect to Otomi Console. Before you can sign-in, first create a new user in Keycloak. Follow the post installation instuctions [here](https://otomi.io/docs/installation/post-install-actions)


### Remove

When you're finished exploring Otomi, use terraform to tear down all resources in the quickstart.

**NOTE: Any resources not provisioned by the quickstart are not guaranteed to be destroyed when tearing down the quickstart.**
Make sure you tear down any resources you provisioned manually before running the destroy command.

Run `terraform destroy -auto-approve` to remove all resources without prompting for confirmation.

## Local deployment (comming soon)

Next to the quickstarts for running Otomi in your public cloud of choice, you can also run Otomi locally on your machine using [kind](https://kind.sigs.k8s.io/)



