FROM ubuntu:24.04@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

RUN apt-get update && apt-get install --no-install-recommends -y git=1:2.43.0-1ubuntu7.1 openssh-client=1:9.6p1-3ubuntu13.4 && rm -rf /var/lib/apt/lists/*

USER 1000
WORKDIR /home/ubuntu
