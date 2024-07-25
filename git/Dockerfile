FROM ubuntu:24.04

RUN apt-get update && apt-get install --no-install-recommends -y git=1:2.43.0-1ubuntu7.1 openssh-client=1:9.6p1-3ubuntu13.4 && rm -rf /var/lib/apt/lists/*

USER 1000
WORKDIR /home/ubuntu
