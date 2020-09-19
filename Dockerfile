# See here for image contents: https://github.com/tianon/docker-brew-ubuntu-core/blob/a5fc6fc792ed9dfc0ddf897178c9e05a0d2a9718/focal/Dockerfile
FROM ubuntu:20.04

# setup tzdata + update + upgrade + install apache2, php and nano
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \    
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apache2 \
    && apt-get install -y php7.4 \
    && apt-get install -y php7.4-gd \
    && apt-get install -y php7.4-curl \
    && apt-get install -y php7.4-mbstring \
    && apt-get install -y php7.4-xml \
    && apt-get install -y php7.4-zip \
    && apt-get install -y nano \
    && a2enmod rewrite

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]