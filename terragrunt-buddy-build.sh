DEFAULT_TERRAFORM_VERSION="1.5.3"
DEFAULT_TERRAGRUNT_VERSION="0.48.4"
DEFAULT_VAULT_VERSION="1.15.0"


[[ -z "$TERRAFORM_VERSION" ]]  && TERRAFORM_VERSION=${DEFAULT_TERRAFORM_VERSION}
[[ -z "$TERRAGRUNT_VERSION" ]] && TERRAGRUNT_VERSION=${DEFAULT_TERRAGRUNT_VERSION}
[[ -z "$VAULT_VERSION" ]]      && VAULT_VERSION=${DEFAULT_VAULT_VERSION}

[ -d bin ]           || mkdir bin
[ -d tmp ]           || mkdir tmp
[ -f bin/terraform ] || wget -O tmp/terraform.zip  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
[ -f bin/terragrunt] || wget -O bin/terragrunt     https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 
[ -f bin/vault ]     || wget -O tmp/vault.zip      https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

#cd tmp
unzip tmp/terraform.zip -d bin/
unzip tmp/vault.zip -d bin/

#cd ../
chmod +x bin/*

docker build -t devopsmd/terragruntbuddy:tf-${TERRAFORM_VERSION}-tg-${TERRAGRUNT_VERSION} -f terragrunt-buddy.Dockerfile .

#rm -f tmp/*
