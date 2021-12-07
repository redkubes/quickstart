# Table of Contents

- [Table of Contents](#table-of-contents)
- [Instructions](#instructions)
  - [Requirements](#requirements)
  - [Configure k8s cluster](#configure-k8s-cluster)
  - [Install Otomi](#install-otomi)

# Instructions

- Please be advised to run Otomi on a sufficiently powerful machine or cluster, ie.: 12+ CPU, 32GB+ RAM, depending on the configuration. 
- It is not recommended to run it on a laptop because of the resource utilization. 
- We recommend a Linux distro like Ubuntu for the k8s host.

## Requirements

- Install `helm`. Official documentation: https://helm.bash/docs/intro/install/.

## Configure k8s cluster

We assume you are able to configure a k8s cluster with the aforementioned specifications. Here are some commonly used options (please note that your mileage may vary) in no particular order:

- [microk8s](https://microk8s.io)
- [k3s](https://k3s.io)
- [k0s](https://k0sproject.io)
- [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
- [kubespray](https://github.com/kubernetes-sigs/kubespray)

We've prepared a walkthrough for [minikube](https://minikube.sigs.k8s.io) if you would like a basic configuration and have no specific requirements for the environment (note that this is a single node configuration).

<details>
  <summary>(Optional) Minikube configuration</summary>
  
1. Install `minikube`. Official documentation: https://minikube.sigs.k8s.io/docs/start/.
2. Install `docker`. Official documentation: https://docs.docker.com/get-docker/.

3. Setup a single node Minikube k8s cluster:

```bash
# we support 18, 19, 20 and 21 at the moment.
minor="19" 
patch="0"

# assuming you want to expose this machine to an intranet, don't do this if the machine is exposed to the internet by leaving the variable empty.
enable_listen_addr="--listen-address=0.0.0.0" 

minikube start --driver docker --network minikube "--kubernetes-version=v1.$minor.$patch" --cpus=max --memory=max "$enable_listen_addr"
```

4. Inspect `onprem/values.yaml`. Ensure access to this file by either cloning this repository, downloading the file from Github, or copying the contents to a file named `values.yaml` (optionally substitute the file name in the following steps).

5. Follow the [common installation process](#install-otomi), but please note that once `nginx-ingress` is deployed, you should run (_otherwise `helm install` will NOT continue_): 

```bash
minikube tunnel & # will expose something like 127.0.0.1.nip.io, check `kubectl get ingress -A -o wide`
``` 

</details>
&nbsp; 

## Install Otomi

Run the following command to install Otomi:

```bash
helm repo add otomi https://otomi.io/otomi-core
helm repo update
helm install -f onprem/values.yaml otomi otomi/otomi
```

Monitor the logs of the installer job:

```bash
kubectl logs jobs/otomi -n default -f
```

When the installer is finished, copy the `url` and `admin-password` from the console output.

Follow the post installation steps [here.](https://otomi.io/docs/installation/post-install)
