[ -d bin ]            || mkdir bin
[ -d tmp ]            || mkdir tmp
[ -f vault.zip ]      || wget -O tmp/vault.zip      https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_linux_amd64.zip
[ -f terraform.zip ]  || wget -O tmp/terraform.zip  https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip
[ -f terragrunt.zip ] || wget -O bin/terragrunt     https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.6/terragrunt_linux_amd64 

cd tmp
unzip vault.zip && mv vault ../bin
unzip terraform.zip && mv terraform ../bin

cd ../

docker build -t devopsmd/terragruntbuddy:tf-1.0.3-tg-0.36.6 -f terragrunt-buddy.Dockerfile .

rm -f bin/* tmp/*