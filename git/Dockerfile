FROM ubuntu:24.04@sha256:80dd3c3b9c6cecb9f1667e9290b3bc61b78c2678c02cbdae5f0fea92cc6734ab

RUN apt-get update && apt-get install --no-install-recommends -y git=1:2.43.0-1ubuntu7.1 openssh-client=1:9.6p1-3ubuntu13.4 && rm -rf /var/lib/apt/lists/*

USER 1000
WORKDIR /home/ubuntu
