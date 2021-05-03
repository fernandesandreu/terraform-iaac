#!/bin/bash


# Default
apt update
apt dist-upgrade -y
apt install git git-flow docker.io docker-compose -y

# Ansible
apt install ansible sshpass -y

# Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update && apt install terraform

# Gcloud
apt install apt-transport-https ca-certificates gnupg -y
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt update && sudo apt-get install google-cloud-sdk -y
apt install google-cloud-sdk-app-engine-java -y


# Terraform + ansible
apt install python3-pip -y
python3 -m pip install requests google-auth
