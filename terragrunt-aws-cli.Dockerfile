FROM devopsmd/terragrunt:tf-0.12.24-tg-0.23.14

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories
RUN apk --no-cache add aws-cli
