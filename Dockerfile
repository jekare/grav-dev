# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.1/containers/ubuntu/.devcontainer/base.Dockerfile
FROM ubuntu:20.04

# setup tzdata + update + upgrade + make user sysadmin + add to sudo group
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \    
    && apt-get update \
    && apt-get upgrade -y \
#    && adduser sysadmin \
#    && usermod -aG sudo sysadmin \
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

#RUN wget https://getgrav.org/download/core/grav-admin/latest \
#    && unzip grav-admin.zip -d ./grav \
#    && chown -rf www-data:www-data ./grav

EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]