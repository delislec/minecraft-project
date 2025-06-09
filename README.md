# Minecraft Server Deployment on AWS (Automated)

## Background
This project fully automates the provisioning, configuration, and setup of a Minecraft Java Edition server on AWS EC2 using Terraform and Ansible. The goal is to replace all manual steps with a user-friendly script eliminating the need to log in to the AWS Console or SSH manually.

---

## Requirements

### Tools You Need Installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.3+
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [nmap](https://nmap.org/download.html)
- [Git](https://git-scm.com/downloads) for cloning the repository

### AWS Setup
- Configure AWS CLI using credentials from the AWS Learner Lab:
  ```bash
  export AWS_ACCESS_KEY_ID=...
  export AWS_SECRET_ACCESS_KEY=...
  export AWS_SESSION_TOKEN=...
  export AWS_DEFAULT_REGION=us-east-1
  ```
### Create SSH Keypair
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/minecraft-key
chmod 400 ~/.ssh/minecraft-key.pem
```

## Pipeline Diagram
![Pipeline Diagram](https://github.com/delislec/minecraft-project/blob/main/Pipeline.png)
---

## How to Run

### 1. Clone the Project
```bash
git clone https://github.com/delislec/minecraft-project.git
cd minecraft-project
```

### 2. Run the Setup Script
```bash
bash scripts/setup.sh
```

This script will:
- Use Terraform to provision an EC2 instance with security group rules
- Use Ansible to:
  - Install Java
  - Download and configure the Minecraft server
  - Set up a systemd service so it auto-starts on reboot
- Run nmap to verify the server is running on port 25565

### 3. Connect with Minecraft Client
1. Open Minecraft Java Edition.
2. Go to Multiplayer > Add Server.
3. Use the IP printed by the script.
4. Connect!

## Resources Used
- [Minecraft Server JAR Download](https://www.minecraft.net/en-us/download/server)
- [Amazon Linux 2023 AMIs](https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes.html)
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Ansible `dnf` Module Docs](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/dnf_module.html)
- [Systemd Guide](https://wiki.archlinux.org/title/systemd)

---

## What’s Automated
- EC2 provisioning using Terraform
- SSH key association and security group rules
- Java 21 installation via Ansible
- Minecraft server installation and EULA agreement
- Systemd service that auto-starts Minecraft on reboot
- Server validation using nmap

---

You can now deploy a Minecraft server in minutes, using a single command.
