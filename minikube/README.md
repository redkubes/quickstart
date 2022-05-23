# Getting started with Otomi on Minikube

## Prerequisites

- [minikube(Mac/Windows)](https://minikube.sigs.k8s.io/docs/start/)

## Configure Minikube cluster

>**_NOTE:_** Windows users,  open PowerShell as Administrator to execute the commands

```bash

# Enable calico if you want to check network policies
# For Windows 
minikube start --memory=8192 --cpus=8 --driver=hyperv --kubernetes-version=v1.22.4 --cni calico
# For Mac
minikube start --memory=8192 --cpus=8 --driver=hyperkit --kubernetes-version=v1.22.4 --cni calico
```

Enable metallb (network load balancer)

```bash
# Enable metallb
minikube addons enable metallb
# Get the IP
minikube ip
# Configure metallb with the IP as seen in the figure below
minikube addons configure metallb
```

## Install Otomi using helm

```bash
# Add the Otomi repo
helm repo add otomi https://otomi.io/otomi-core 
helm repo update
# Otomi install with minimal chart values
helm install otomi otomi/otomi --set cluster.k8sVersion="1.22" --set cluster.name=minikube --set cluster.provider=custom --set apps.host-mods.enabled=false
```

The helm chart deploys an installer job responsible for installing the Otomi platform on the minikube cluster.

```bash
# Monitor the job status
kubectl get job otomi -w
# Installer job logs
kubectl logs jobs/otomi -n default -f
```

At the end of the logs of the installer job, you will find the `URL` and the `credentials` to log into the Otomi console.

Follow the post installation steps [here.](../post-install/README.md)

## Additional resources

- [Install Otomi on Minikube - Windows](https://towardsdev.com/otomi-self-hosted-paas-for-kubernetes-on-windows-minikube-55fdfe588652)
- [Install Otomi on Minikube - Mac](https://itnext.io/installing-otomi-on-minikube-2f83dfc421d2)
