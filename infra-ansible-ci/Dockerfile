FROM python:2.7

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_386.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/bin/ && \
    terraform --version

RUN pip install ansible==2.8.1 ansible-lint yamllint

RUN apt update && apt-get install -y jq

RUN apt-get update && apt-get install -y curl apt-transport-https lsb-release gnupg
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
        gpg --dearmor | \
        tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

#ENV AZ_REPO=stretch$(lsb_release -cs)
ENV AZ_REPO=stretch
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli

# install envsubst
RUN apt-get -y install gettext-base && apt-get clean && rm -rf /var/lib/apt/lists/*
