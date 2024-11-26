FROM bitnami/python:3.10

RUN apt-get update && apt-get install -y git openssh-client && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 1000 user && useradd -u 1000 -r -g user -m -d /home/user user

USER 1000

RUN pip install github-backup
