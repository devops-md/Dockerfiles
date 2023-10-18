DEFAULT_TERRAFORM_VERSION="1.5.3"
DEFAULT_TERRAGRUNT_VERSION="0.48.4"
DEFAULT_VAULT_VERSION="1.15.0"
DEFAULT_GOLANG_VERSION="go1.21.3"


[[ -z "$TERRAFORM_VERSION" ]]  && TERRAFORM_VERSION=${DEFAULT_TERRAFORM_VERSION}
[[ -z "$TERRAGRUNT_VERSION" ]] && TERRAGRUNT_VERSION=${DEFAULT_TERRAGRUNT_VERSION}
[[ -z "$VAULT_VERSION" ]]      && VAULT_VERSION=${DEFAULT_VAULT_VERSION}
[[ -z "$GOLANG_VERSION" ]]     && GOLANG_VERSION=${DEFAULT_GOLANG_VERSION}

[ -d data ]              || mkdir -p data/downloads
[ -d data/usr ]          || mkdir -p data/usr/local/bin
[ -f data/downloads/terraform.zip ] || wget -O data/downloads/terraform.zip  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
[ -f data/downloads/terragrunt ]    || wget -O data/downloads/terragrunt     https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 
[ -f data/downloads/vault.zip ]     || wget -O data/downloads/vault.zip      https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip 
[ -f data/downloads/go.tar.gz ]     || wget -O data/downloads/go.tar.gz      https://go.dev/dl/${GOLANG_VERSION}.linux-amd64.tar.gz 

cd data
tar -C usr/local/ -xzf downloads/go.tar.gz
cp downloads/terragrunt          usr/local/bin/
unzip downloads/terraform.zip -d usr/local/bin/
unzip downloads/vault.zip     -d usr/local/bin/
chmod +x usr/local/bin/*
tar cvf files.tar usr/ && rm -rf usr
cd ..

docker build -t devopsmd/terragruntbuddy:tf-${TERRAFORM_VERSION}-tg-${TERRAGRUNT_VERSION} -f terragrunt-buddy.Dockerfile .

#rm -rf data/files.tar # uncomment this and comment next line while testing
rm -rf data/downloads
