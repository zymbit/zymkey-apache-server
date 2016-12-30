FROM bitnami/apache:latest
MAINTAINER Zymbit <info@zymbit.com>

RUN apt-get update && \
  apt-get install -y ssl-cert


ENV APACHE_LOG_DIR /var/log/apache
RUN mkdir -p ${APACHE_LOG_DIR}


COPY files/ /
RUN chmod +x /usr/local/bin/* /docker-entrypoint

ENTRYPOINT ["/docker-entrypoint"]
