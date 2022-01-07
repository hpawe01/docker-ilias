FROM php:7.3-apache
RUN apt-get update \
  && apt-get install -y \
    zip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
    libzip-dev \
  && docker-php-ext-install \
    mysqli \
    pdo_mysql \
    gd \
    xml \
    mbstring \
    dom \
    soap \
    xml \
    xsl \
    zip
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html
USER www-data
COPY ILIAS-6.4.tar.gz /var/www/html
# RUN wget -c https://github.com/ILIAS-eLearning/ILIAS/archive/v6.4.tar.gz -O - | tar -xz -C /var/www/html/ilias --strip-components=1
RUN mkdir /var/www/html/ilias \
  && mkdir /var/www/html/files \
  && tar -xf /var/www/html/ILIAS-6.4.tar.gz -C /var/www/html/ilias --strip-components=1 \
  && rm /var/www/html/ILIAS-6.4.tar.gz \
  && mkdir -p /var/www/html/ilias/data/ilias/css \
  && mkdir /var/www/html/ilias/data/ilias/lm_data \
  && mkdir /var/www/html/ilias/data/ilias/mobs \
  && mkdir /var/www/html/ilias/data/ilias/usr_images \
  && echo "" > /var/www/html/files/ilias.log \
  && mkdir -p /var/www/html/files/ilias/files \
  && mkdir /var/www/html/files/ilias/forum \
  && mkdir /var/www/html/files/ilias/lm_data \
  && mkdir /var/www/html/files/ilias/mail \
  && mkdir /var/www/html/files/ilias/temp \
  && echo "KmAN4TJXnscbjnXybUJlcg" > /var/www/html/files/ilias/pwsalt.txt

COPY config/app/ilias.ini.php /var/www/html/ilias
COPY config/app/client.ini.php /var/www/html/ilias/data/ilias
RUN echo "<?php phpinfo();" > /var/www/html/ilias/info.php

USER root
COPY config/app/ilias_php.ini $PHP_INI_DIR/conf.d/
COPY config/app/ilias_apache.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/www/html/ilias
RUN composer update --no-dev
RUN chown -R www-data:www-data modules ilias.ini.php data/ilias/client.ini.php