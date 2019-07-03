FROM registry.gitlab.factory.social.gouv.fr/infra/images-docker/docker-kube:latest

COPY ./entrypoint.sh /entrypoint.sh
COPY ./killer.py /killer.py

ENTRYPOINT ["/entrypoint.sh"]
