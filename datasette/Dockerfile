FROM datasetteproject/datasette:0.64

RUN adduser script

RUN apt-get update -y;
RUN apt-get install -y curl unzip sqlite3;

WORKDIR /home/script
USER 1000