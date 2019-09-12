FROM debian:stable-slim
MAINTAINER Samark Chisanguan <samarkchnsgn@gmail.com>

RUN apt-get update && \
    apt-cache search node


RUN apt-get install -y \
    php7.3 \
    php7.3-bcmath \
    php7.3-bz2 \
    php7.3-cgi \
    php7.3-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-dba \
    php7.3-dev \
    php7.3-enchant \
    php7.3-fpm \
    php7.3-gd \
    php7.3-gmp \
    php7.3-imap \
    php7.3-interbase \
    php7.3-intl \
    php7.3-json \
    php7.3-ldap \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-odbc \
    php7.3-opcache \
    php7.3-pgsql \
    php7.3-phpdbg \
    php7.3-pspell \
    php7.3-readline \
    php7.3-recode \
    php7.3-snmp \
    php7.3-soap \
    php7.3-sqlite3 \
    php7.3-sybase \
    php7.3-tidy \
    php7.3-xml \
    php7.3-xmlrpc \
    php7.3-xsl \
    php7.3-zip \
    php-xdebug \
    git \
    composer \
    nodejs

RUN apt-get install -y apache2 apache2-bin apache2-data

RUN apt-get install -y libapache2-mod-php7.3

RUN a2enmod ssl && a2enmod rewrite

RUN apt-cache search libapache2

RUN mkdir -p /var/www/html/public
RUN echo  "ServerName localhost" >> /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html/
#RUN apachectl -D FOREGROUND
#RUN service apache2 start
CMD apachectl -D FOREGROUND
EXPOSE 80




