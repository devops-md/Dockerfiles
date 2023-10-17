DEFAULT_TERRAFORM_VERSION="1.5.3"
DEFAULT_TERRAGRUNT_VERSION="0.48.4"
DEFAULT_VAULT_VERSION="1.15.0"
DEFAULT_GOLANG_VERSION="go1.21.3"


[[ -z "$TERRAFORM_VERSION" ]]  && TERRAFORM_VERSION=${DEFAULT_TERRAFORM_VERSION}
[[ -z "$TERRAGRUNT_VERSION" ]] && TERRAGRUNT_VERSION=${DEFAULT_TERRAGRUNT_VERSION}
[[ -z "$VAULT_VERSION" ]]      && VAULT_VERSION=${DEFAULT_VAULT_VERSION}
[[ -z "$GOLANG_VERSION" ]]     && GOLANG_VERSION=${DEFAULT_GOLANG_VERSION}

[ -d bin ]               || mkdir bin
[ -d tmp ]               || mkdir tmp
[ -d usr/local/ ]        || mkdir -p usr/local/
[ -f tmp/terraform.zip ] || wget -O tmp/terraform.zip  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && unzip tmp/terraform.zip -d bin/
[ -f bin/terragrunt ]    || wget -O bin/terragrunt     https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 
[ -f tmp/vault.zip ]     || wget -O tmp/vault.zip      https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && unzip tmp/vault.zip -d bin/
[ -f tmp/go.tar.gz ]     || wget -O tmp/go.tar.gz      https://go.dev/dl/${GOLANG_VERSION}.linux-amd64.tar.gz && tar -C usr/local -xzf tmp/go.tar.gz

mv bin usr/local/
chmod +x usr/local/bin/*
tar cvf files.tar usr/

docker build -t devopsmd/terragruntbuddy:tf-${TERRAFORM_VERSION}-tg-${TERRAGRUNT_VERSION} -f terragrunt-buddy.Dockerfile .

rm -rf tmp/ usr/ files.tar
