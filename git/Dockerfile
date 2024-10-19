FROM ubuntu:24.04@sha256:99c35190e22d294cdace2783ac55effc69d32896daaa265f0bbedbcde4fbe3e5

RUN apt-get update && apt-get install --no-install-recommends -y git=1:2.43.0-1ubuntu7.1 openssh-client=1:9.6p1-3ubuntu13.4 && rm -rf /var/lib/apt/lists/*

USER 1000
WORKDIR /home/ubuntu
