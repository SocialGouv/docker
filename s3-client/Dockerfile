ARG UBUNTU_VERSION=22.04@sha256:104ae83764a5119017b8e8d6218fa0832b09df65aae7d5a6de29a85d813da2fb
FROM ubuntu:$UBUNTU_VERSION

# hadolint ignore=DL3008
RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  ca-certificates \
  curl \
  unzip \
  gnupg \
  && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3059,DL4006
RUN  curl -fSsL https://www.postgresql.org/media/keys/ACCC4CF8.asc \
  | gpg --dearmor \
  | tee /usr/share/keyrings/postgresql.gpg > /dev/null

# hadolint ignore=DL3059,DL4006
RUN echo deb [arch=amd64,arm64,ppc64el signed-by=/usr/share/keyrings/postgresql.gpg] \
  http://apt.postgresql.org/pub/repos/apt/ jammy-pgdg main \
  | tee -a /etc/apt/sources.list.d/postgresql.list

# hadolint ignore=DL3008,DL3059
RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  postgresql-client-15 \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1001 ubuntu && useradd -rm -d /home/ubuntu -s /bin/bash -g ubuntu -G sudo -u 1001 ubuntu
ENV HOME=/home/ubuntu

# install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

USER 1001
WORKDIR /home/ubuntu

COPY entrypoint.sh .
COPY dump-upload.sh .
COPY rotate-dumps.sh .

CMD ["./entrypoint.sh"]
