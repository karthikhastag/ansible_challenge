# ansible-challenge
# Terraform + Ansible + Jenkins

This repo deploys two EC2 instances and configures them using Ansible.

Frontend:
- Amazon Linux
- Hostname: c8.local
- Nginx reverse proxy

Backend:
- Ubuntu 21.04
- Hostname: u21.local
- Netdata running on port 19999
