# Dockerfiles

## Terragrunt

### Build Terragrunt for Terraform 0.12
Terraform 0.12 requires Terragrunt v0.19.0 and up

`docker build -t terragrunt-tf12:v0.23.14 -f terragrunt.Dockerfile --build-arg TERRAGRUNT_VERSION=v0.23.14 --build-arg TERRAFORM_VERSION=0.12.24 .`

### Build Terragrunt for Terraform 0.12
Terraform 0.11 requires Terragrunt <=v0.18.7

`docker build -t terragrunt-tf11:v0.18.7 -f terragrunt.Dockerfile --build-arg TERRAGRUNT_VERSION=v0.18.7 --build-arg TERRAFORM_VERSION=0.11.14 .`