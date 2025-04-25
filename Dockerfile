FROM registry.access.redhat.com/ubi9/ubi:9.5

LABEL org.opencontainers.image.authors="oballest@redhat.com"

RUN dnf install -y httpd
RUN chgrp -R 0 /run /var/log/httpd
RUN chmod -R g=u /run /var/log/httpd
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]