### Prerequisites

Terraform version 1.4:
<https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli>

Azure CLI :
<https://learn.microsoft.com/en-us/cli/azure/install-azure-cli>

Kubectl:
<https://kubernetes.io/docs/tasks/tools/>



### Infrastructure provisioning

Make sure you are logged to Azure CLI with administrator permissions in your Azure account to create resources.

# Sign in to Azure
az login
# Get a list of subscriptions for the logged in account
az account list
# Set subscription if you need to do instalation on a certain account
az account set --subscription=<subscription_id>


Please check your Azure Location(Region) in EKS/variables.tf and Otomi/variables.tf - change if needed.

1. Open terminal

2. Go to EKS folder

3. Run:

terraform init

4. Run:

terraform apply

5. Wait until cluster is created (about 5-10 min)

In case you are using brand new Azure Account it might be needed to create request to increase limits for resources creation. you might get error like this:

(QuotaExceeded) Provisioning of resource(s) for <will be displayed some resources trying to create> in resource group otomi failed. Message: Operation could not be completed as it results in exceeding approved Total Regional Cores quota. Additional details - Deployment Model: Resource Manager, Location: eastus, Current Limit: 10, Current Usage: 0, Additional Required: 24, (Minimum) New Limit Required: 24. Submit a request for Quota increase at <Will be link here> by specifying parameters listed in the ‘Details’ section for deployment to succeed. Please read more about quota limits at https://docs.microsoft.com/en-us/azure/azure-supportability/regional-quota-requests. Details: 
Code: QuotaExceeded
Message: Provisioning of resource(s) for <will be displayed some resources trying to create> in resource group otomi failed. Message: Operation could not be completed as it results in exceeding approved Total Regional Cores quota. Additional details - Deployment Model: Resource Manager, Location: eastus, Current Limit: 10, Current Usage: 0, Additional Required: 24, (Minimum) New Limit Required: 24. Submit a request for Quota increase at <Will be link here> by specifying parameters listed in the ‘Details’ section for deployment to succeed. Please read more about quota limits at https://docs.microsoft.com/en-us/azure/azure-supportability/regional-quota-requests. Details: 

In order to fix it - just follow the link in you browser and apply for increasing limitation. Usually it takes few minutes to increase the limits. Might be you will need to increase several limits. It will be done once in your account

### Otomi Installation

6. Go to Otomi folder

7. Run:

terraform init

8. Run:

terraform apply


### Accessing Otomi Admin panel

After resources created you can log in to your cluster and wait until Otomi is installed and configured

To ovewrite you kubectl file with created cluster run, type "y" when promped:

az aks get-credentials -n otomi-aks-quickstart -g otomi

After you can check logs for Otomi:

kubectl logs jobs/quickstart-otomi -n default -f
Wait until finished you will receive address, admin login and password.

When Otomi is installed with minimal values, a custom CA is generated and Otomi uses nip.io for host names. It is possible to switch from nip.io to using a DNS zone after installing Otomi initially without DNS For detailed info please visit:

<https://otomi.io/docs/for-ops/how-to/switch-to-dns>




### Destroying created resources

1. Open terminal 

2. Go to Otomi folder

3. Run:


    terraform destroy


4. Type "yes" in prompt 

5. When destroy completed go to EKS folder with following commands


    cd ..
    cd EKS


6. Run:


    terraform destroy


7. Type "yes" in prompt (destroy of cluster should take around 5 min)

