FROM amazon/aws-cli:2.6.1

ADD bin/* /usr/local/bin/

RUN yum install -q -y git jq openssl && yum clean metadata && adduser edocker

USER edocker
WORKDIR /app
ENTRYPOINT []