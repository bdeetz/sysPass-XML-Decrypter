FROM php:7.0.15-alpine

# install latest CA certs
RUN apk --no-cache upgrade ca-certificates && update-ca-certificates && apk --no-cache add bash

# install usermod
# NOTE THAT WE ARE ADDING THE 3.5 COMMUNITY REPO ON A 3.4 ALPINE INSTALL
RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.5/community/ >> /etc/apk/repositories

RUN apk update && apk --no-cache add shadow

# Install latest su-exec
RUN  curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c \
     && fetch_deps='gcc libc-dev' \
     && apk --no-cache add $fetch_deps \
     && rm -rf /var/lib/apt/lists/* \
     && gcc -Wall /usr/local/bin/su-exec.c -o/usr/local/bin/su-exec \
     && chown root:root /usr/local/bin/su-exec \
     && chmod 0755 /usr/local/bin/su-exec \
     && rm /usr/local/bin/su-exec.c

RUN apk add --no-cache openssh git


# INSTALL COMPOSER
RUN curl -k -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY docker_entrypoint.sh /usr/local/bin/

# install syspass decrypter
RUN git clone https://github.com/bdeetz/sysPass-XML-Decrypter.git

WORKDIR sysPass-XML-Decrypter

RUN composer install

ENTRYPOINT ["docker_entrypoint.sh"]
