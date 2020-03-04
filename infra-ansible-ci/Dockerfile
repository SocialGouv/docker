FROM python:3.8

ENV TERRAFORM_VERSION="0.12.21"

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
  && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && rm -rf terraform.zip \
  && mv terraform /usr/bin/ \
  # test terraform install
  && terraform --version

COPY requirements.txt /requirements.txt

# install ansible & linter
RUN pip install -r /requirements.txt
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
