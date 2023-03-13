# Getting started with Otomi on Minikube

#### Table of Contents

- [Prerequisites](#prerequisites)
- [Configure Minikube cluster](#configure-minikube-cluster)
  - [For Windows](#for-windows)
  - [For Mac](#for-mac)
  - [For Linux, using the KVM2 driver](#for-linux-using-the-kvm2-driver)
  - [ For using the Docker driver (Recommended for Apple M1 Chip)](#for-using-the-docker-driver-recommended-for-apple-m1-chip)
- [Enable Metallb (Network Load Balancer)](#enable-metallb-network-load-balancer)
  - [Interactive Way](#interactive-way)
  - [Manual Way](#manual-way)
    - [Manually Enable and Configure Metallb](#1manually-enable-and-configure-metallb)
    - [Get the IP](#2get-the-ip)
    - [Configure Metallb](#3configure-metallb)
- [Install Otomi using Helm](#install-otomi-using-helm)
  - [Add the Otomi Repo](#add-the-otomi-repo)
  - [Otomi install with Minimal Chart Values](#otomi-install-with-minimal-chart-values)
  - [Monitor the Job Status](#monitor-the-job-status)
- [Installer Job Logs](#installer-job-logs)
- [Additional Resources](#additional-resources)

## Prerequisites

- [minikube](https://minikube.sigs.k8s.io/docs/start/) (Mac/Windows/Linux)
- Linux only: [kvm2](https://minikube.sigs.k8s.io/docs/drivers/kvm2/) or [Docker](https://minikube.sigs.k8s.io/docs/drivers/docker/) - detailed setup depends on Linux distribution

## Configure Minikube cluster

> **_NOTE:_** Windows users, open PowerShell as Administrator to execute the commands

> **_NOTE:_** Enable calico if you want to check network policies

### For Windows

```bash
minikube start --memory=8192 --cpus=8 --driver=hyperv --kubernetes-version=v1.23.17 --cni calico
```

### For Mac

```bash
minikube start --memory=8192 --cpus=8 --driver=hyperkit --kubernetes-version=v1.23.17 --cni calico
```

### For Linux, using the KVM2 driver

```bash
minikube start --memory=8192 --cpus=8 --driver=kvm2 --kubernetes-version=v1.23.17 --cni calico
```

### For using the Docker driver (Recommended for Apple M1 Chip)

```bash
minikube start --memory=8192 --cpus=8 --driver=docker --kubernetes-version=v1.23.17 --cni calico
```

## Enable Metallb (Network Load Balancer)

### Interactive way:

Copy and paste the following script into your terminal.

```bash
minikube addons enable metallb
MINIKUBE_IP=$(minikube ip);START_IP=101;END_IP=121
expect << _EOF_
spawn minikube addons configure metallb
expect "Enter Load Balancer Start IP:" { send "${MINIKUBE_IP%.*}.$START_IP\\r" }
expect "Enter Load Balancer End IP:" { send "${MINIKUBE_IP%.*}.$END_IP\\r" }
expect eof
_EOF_
```

If the above script fails, follow the steps described below in order to manually enable and configure Metallb addon, otherwise you can skip to the [Install Otomi using helm](#install-otomi-using-helm) Part

### Manual Way:

<details>

<summary>Expand...</summary>

### 1.Manually Enable and Configure Metallb

```bash
minikube addons enable metallb
```

### 2.Get the IP

```
minikube ip
```

Terminal Output

```
192.168.49.2
```

_Pleas note that IP might and will probably be different in your system_

### 3.Configure metallb

```
minikube addons configure metallb
```

Terminal Output

```
-- Enter Load Balancer Start IP: 192.168.49.101
-- Enter Load Balancer END IP: 192.168.49.121
```

Define the load balancer's ip range using the above example replacing the IP address which is acquired in Step 3.
_Note_ First 3 segments of the IP should be same as the minikube IP Network address while the last segment may be customized.

</details>

---

## Install Otomi using helm

### Add the Otomi repo

```bash
helm repo add otomi https://otomi.io/otomi-core
helm repo update
```

### Otomi install with minimal chart values

```bash
helm install otomi otomi/otomi --set cluster.k8sVersion="1.23" --set cluster.name=minikube --set cluster.provider=custom --set apps.host-mods.enabled=false --set apps.metrics-server.extraArgs.kubelet-insecure-tls=true --set apps.metrics-server.extraArgs.kubelet-preferred-address-types=InternalIP
```

The helm chart deploys an installer job responsible for installing the Otomi platform on the minikube cluster.

### Monitor the job status

```bash
kubectl get job otomi -w
```

### Installer job logs

```
kubectl logs jobs/otomi -n default -f
```

At the end of the logs of the installer job, you will find the `URL` and the `credentials` to log into the Otomi console.

Follow the post installation steps [here.](../post-install/README.md)

---

## Additional resources

- [Install Otomi on Minikube - Windows](https://towardsdev.com/otomi-self-hosted-paas-for-kubernetes-on-windows-minikube-55fdfe588652)
- [Install Otomi on Minikube - Mac](https://itnext.io/installing-otomi-on-minikube-2f83dfc421d2)
