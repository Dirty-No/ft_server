FROM debian:buster
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY ./src/ /app
RUN apt-get update && apt-get upgrade
RUN apt-get install -yqq wget
RUN apt-get install -yqq  nginx \
    && apt-get install -yqq mariadb-server mariadb-client \
    && apt-get install -yqq php-fpm php-mysql \
    && apt-get install -yqq php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi -y

RUN mkdir /var/www/gtml/phpmyadmin \
    && tar xvzf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components=1 -C /var/www/gtml/phpmyadmin \
    && tar xvzf src/wordpress-5.4.1-fr_FR.tar.gz -C  var/www/html && 
CMD service nginx restart && service php7.3-fpm start && service mysql start && bash