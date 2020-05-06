ARG TERRAFORM_VERSION="0.11.14"

FROM hashicorp/terraform:${TERRAFORM_VERSION}

ARG TERRAGRUNT_VERSION="v0.18.7"
RUN echo ${TERRAGRUNT_VERSION} > /tmp/test.txt

ADD https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
RUN apk add --no-cache bash

WORKDIR /apps
ENTRYPOINT []