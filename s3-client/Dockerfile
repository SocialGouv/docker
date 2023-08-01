ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION

# hadolint ignore=DL3008
RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  ca-certificates \
  curl \
  unzip \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1001 ubuntu && useradd -rm -d /home/ubuntu -s /bin/bash -g ubuntu -G sudo -u 1001 ubuntu
ENV HOME=/home/ubuntu

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

USER 1001
WORKDIR /home/ubuntu

COPY dump-upload.sh .

CMD ["./dump-upload.sh"]
