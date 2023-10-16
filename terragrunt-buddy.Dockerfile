FROM amazon/aws-cli:2.13.26

ADD bin/* /usr/local/bin/

RUN yum update -y && \
    yum upgrade -y &&\
    yum install -q -y golang git jq openssl &&\
    yum clean metadata &&\
    adduser edocker

USER edocker
WORKDIR /app
ENTRYPOINT []