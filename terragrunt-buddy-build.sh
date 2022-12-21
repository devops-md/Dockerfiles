DEFAULT_TERRAFORM_VERSION="1.0.3"
DEFAULT_TERRAGRUNT_VERSION="0.38.7"
DEFAULT_VAULT_VERSION="1.10.2"


[[ -z "$TERRAFORM_VERSION" ]]  && TERRAFORM_VERSION=${EFAULT_TERRAFORM_VERSION}
[[ -z "$TERRAGRUNT_VERSION" ]] && TERRAGRUNT_VERSION=${DEFAULT_TERRAGRUNT_VERSION}
[[ -z "$VAULT_VERSION" ]]      && VAULT_VERSION=${DEFAULT_VAULT_VERSION}

[ -d bin ]            || mkdir bin
[ -d tmp ]            || mkdir tmp
[ -f vault.zip ]      || wget -O tmp/vault.zip      https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
[ -f terraform.zip ]  || wget -O tmp/terraform.zip  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
[ -f terragrunt.zip ] || wget -O bin/terragrunt     https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 

cd tmp
unzip vault.zip && mv vault ../bin
unzip terraform.zip && mv terraform ../bin

cd ../

docker build -t devopsmd/terragruntbuddy:tf-1.0.3-tg-0.36.6 -f terragrunt-buddy.Dockerfile .

rm -f bin/* tmp/*
