# Getting started with Otomi on AKS

## Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://kubernetes.io/docs/tasks/tools/)

>Note: If you login via [Azure Cloud Shell]( https://shell.azure.com), you don't need to install the prerequisites

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
## Set up a managed kubernetes cluster on AKS

Setting the environment variables
```bash
# Set Resource Group Name 
RGNAME=otomi
# Set Region (Location) or any other location
LOCATION=westeurope
# Create Resource Group
az group create -n $RGNAME -l $LOCATION
# Set Cluster name
NAME=quickstart
CLUSTER_NAME=otomi-aks-$NAME
```

Creating the cluster

```bash
# Create AKS cluster
az aks create --name $CLUSTER_NAME \
--resource-group $RGNAME \
--location $LOCATION \
--zones 1 2 \
--vm-set-type VirtualMachineScaleSets \
--nodepool-name otomipool \
--node-count 3 \
--node-vm-size Standard_F8s_v2 \
--kubernetes-version 1.23.15 \
--enable-cluster-autoscaler \
--min-count 1 \
--max-count 6 \
--max-pods 100 \
--network-plugin azure \
--network-policy calico \
--outbound-type loadBalancer \
--uptime-sla \
--generate-ssh-keys
```

Update the Kubernetes config file

```bash
az aks get-credentials -n $CLUSTER_NAME -g $RGNAME
```

## Install Otomi using helm

```bash
# Add the Otomi repo
helm repo add otomi https://otomi.io/otomi-core 
helm repo update
# Otomi install with minimal chart values
helm install otomi otomi/otomi --set cluster.k8sVersion="1.23" --set cluster.name=$CLUSTER_NAME --set cluster.provider=azure
```

The helm chart deploys an installer job responsible for installing the Otomi platform on the AKS cluster.

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
