FROM python:3.8

# install dependencies (gettext-base to install envsubst)
RUN set -ex \
  \
  && apt-get update \
  && apt-get -y install \
    apt-transport-https=1.8.2 \
    curl=7.64.0-4+deb10u1 \
    gettext-base=0.19.8.1-9 \
    gnupg=2.2.12-1+deb10u1 \
    jq=1.5+dfsg-2+b1 \
    lsb-release=10.2019051400 \
    --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*  \
  \
  # install terraform
  && curl https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_386.zip -o terraform.zip \
  && unzip terraform.zip \
  && rm -rf terraform.zip \
  && mv terraform /usr/bin/ \
  && terraform --version

COPY requirements.txt /requirements.txt

# install ansible & linter
RUN pip install -r /requirements.txt
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install azure CLI
RUN set -ex \
  \
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ stretch main" | \
    tee /etc/apt/sources.list.d/azure-cli.list \
  \
  && apt-get update \
  \
  && apt-get install -y azure-cli=2.1.0-1~stretch --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
