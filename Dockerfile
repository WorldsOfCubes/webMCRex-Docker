FROM php:5.6-apache

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

COPY ./webMCRexAGPL/upload /var/www/html/
RUN chown -R www-data:www-data /var/www/html

RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN apt-get update && \
        apt-get install -y \
            zlib1g-dev

RUN docker-php-ext-install mysql

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install gd

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
