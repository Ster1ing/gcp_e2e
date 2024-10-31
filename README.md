# gcp_e2e

## How to..
* install:
  * git
  * terraform
  * ansible (wsl for windows)
  * VSCode
  * gcloud CLI

* `gcloud auth application-default login`
* `cd terraform`
* `cp terraform.tfvars.dist terraform.tfvars`
* fill the gaps in terraform.tfvars
* `terraform init`
* `terraform fmt`
* `terraform plan`
* `terraform apply`
* `cd ../ansible`
* `cp server_vars.yml.dist server_vars.yml`
* fill the gaps in server_vars.yml
* `ansible-playbook -i hosts main.yml`
### gcloud
### Terroform
### Ansible
### VSCode romete
