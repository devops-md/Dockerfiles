FROM amazon/aws-cli:2.6.1

ADD bin/* /usr/local/bin/

RUN yum clean metadata && yum install -y git jq 

WORKDIR /app
ENTRYPOINT []