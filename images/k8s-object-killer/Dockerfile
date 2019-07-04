FROM registry.gitlab.factory.social.gouv.fr/infra/images-docker/docker-kube:latest

COPY ./entrypoint.sh /entrypoint.sh
COPY ./killer /killer

ENTRYPOINT ["/entrypoint.sh"]
