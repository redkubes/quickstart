# Getting started with Otomi on GKE

## Prerequisites

- [GCloud SDK](https://cloud.google.com/sdk/docs/install)

>Note: If you login via [Google Cloud Shell](https://cloud.google.com/shell), you don't need to install the prerequisites

**GCloud CLI Cheat Sheet**

```bash
# Initialize and authentication
gcloud init
gcloud auth login
gcloud config set project PROJECT_ID

# Enable google services api
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```

---

## Set up a managed kubernetes cluster on GKE

Set up environment variables

```bash
# Set Cluster name
CLUSTER_NAME=otomi-gcp-quickstart
# Set region
COMPUTE_REGION=europe-west4
```

```bash
# Create the cluster 
gcloud container clusters create $CLUSTER_NAME \
    --enable-autoscaling \
    --enable-network-policy \
    --num-nodes 1 \
    --min-nodes 1 \
    --max-nodes 3 \
    --machine-type e2-standard-8 \
    --region $COMPUTE_REGION
```

Update the Kubernetes config file

```bash
gcloud container clusters get-credentials $CLUSTER_NAME --region $COMPUTE_REGION
```

---

## Install Otomi using Helm

```bash
# Add the Otomi repo
helm repo add otomi https://otomi.io/otomi-core 
helm repo update
# Otomi install with minimal chart values
helm install otomi otomi/otomi --set cluster.k8sVersion="1.21" --set cluster.name=$CLUSTER_NAME --set cluster.provider=google
```

The Helm chart deploys an installer job responsible for installing Otomi on the GKE cluster.

```bash
# Monitor the job status
kubectl get job otomi -w
# Installer job logs
kubectl logs jobs/otomi -n default -f
```

At the end of the logs of the installer job, you will find the `URL` and the `credentials` to log into the Otomi console.

```bash
 ########################################################################################                                      
 #  To start using Otomi, go to https://<your-ip>.nip.io and sign in to the web console 
 #  with username "otomi-admin" and password "password".
 #  Then activate Drone. For more information see: https://otomi.io/docs/get-started/activation
 ########################################################################################
```

Now follow the activation instructions [here.](https://otomi.io/docs/get-started/activation)
