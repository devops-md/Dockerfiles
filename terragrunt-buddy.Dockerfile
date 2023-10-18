ARG AWSCLI_VERSION=2.13.26
FROM amazon/aws-cli:${AWSCLI_VERSION}

# ARG TERRAFORM_VERSION=1.5.3
# ARG TERRAGRUNT_VERSION=0.48.4
# ARG VAULT_VERSION=1.15.0
# ARG GOLANG_VERSION=1.21.3

ADD data/files.tar /

RUN yum update -y && \
    yum upgrade -y && \
    yum install -q -y git jq openssl && \
    yum clean metadata && \
    adduser edocker

ENV GOPATH /app/go
ENV PATH /usr/local/go/bin:$PATH

USER edocker
WORKDIR /app
ENTRYPOINT []