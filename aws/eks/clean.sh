#!/bin/bash
#
# This script is used to clean terraform cache files 
# You may run it after destroying the resources in order to start a fresh install.
#
echo "Cleaning temporary files"
[ -d .terraform ] && rm -r -f .terraform 
[ -f .terraform.lock.hcl ] && rm .terraform.lock.hcl
[ -f terraform.tfstate ] && rm terraform.tfstate
[ -f kubeconfig_otomi ] && rm kubeconfig_otomi
echo "Done"


