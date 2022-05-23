# Getting started with Otomi on DigitalOcean

## Prerequisites

- [doctl](https://docs.digitalocean.com/reference/doctl/how-to/install/)

## Configure DOKS cluster

>**_NOTE:_** if you find it easier to create the cluster via DigitalOcean portal, go ahead.

```bash
# Cheatsheet
doctl auth init 
doctl kubernetes cluster list

# Set env
NAME="quickstart"
OWNER="user"

# Create kubernetes cluster
doctl kubernetes cluster create otomi-digitalocean-$NAME \
--tag $OWNER \
--region ams3 \
--node-pool "name=${NAME};size=s-4vcpu-8gb;tag=${OWNER};auto-scale=true;min-nodes=2;max-nodes=5;count=2;" \
--wait
```

```bash
# Update kubeconfig
doctl kubernetes cluster kubeconfig save otomi-digitalocean-$NAME
```

## Install Otomi using helm

```bash
# Add the Otomi repo
helm repo add otomi https://otomi.io/otomi-core
helm repo update
# Otomi install with minimal chart values
helm install otomi otomi/otomi --set cluster.k8sVersion="1.22" --set cluster.name=otomi-digitalocean-$NAME --set cluster.provider=digitalocean
```

The helm chart deploys an installer job responsible for installing the Otomi platform on the DOKS cluster.

```bash
# Monitor the job status
kubectl get job otomi -w
# Installer job logs
kubectl logs jobs/otomi -n default -f
```

At the end of the logs of the installer job, you will find the `URL` and the `credentials` to log into the Otomi console.

Follow the post installation steps [here.](../post-install/README.md)

## Additional resources

- [Install Otomi on DigitalOcean](https://towardsdev.com/otomi-on-digital-ocean-16778f4466b8)
