#!/bin/bash

cd terraform || exit
terraform init
terraform apply -auto-approve

IP=$(terraform output -raw minecraft_public_ip)
echo "Public IP: $IP"
echo "$IP" > ../outputs/server-ip.txt

cd ../ansible || exit
ansible-playbook -i "$IP," --private-key ~/.ssh/minecraft-key --user ec2-user playbook.yml
