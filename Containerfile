FROM registry.access.redhat.com/ubi9/ubi:9.5

LABEL org.opencontainers.image.authors="oballest@redhat.com"

RUN dnf install -y httpd

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]