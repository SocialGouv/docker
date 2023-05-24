FROM datasetteproject/datasette:0.64@sha256:4136ff28b289b8c8c384c550cf552d1aca9096e5ae83e8c990090311c158b8b6

RUN adduser script

RUN apt-get update -y;
RUN apt-get install -y curl unzip sqlite3;

WORKDIR /home/script
USER 1000