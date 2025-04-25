FROM registry.access.redhat.com/ubi9/ubi:9.5

LABEL org.opencontainers.image.authors="oballest@redhat.com"

RUN dnf install -y httpd && \\
    dnf clean all \\
    chgrp -R 0 /run /var/log/httpd \\
    chmod -R g=u /run /var/log/httpd \\
    sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

COPY src/ /var/www/html/

EXPOSE 8080

USER 1001

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]