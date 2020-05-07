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

#RUN bash install_mysql.sh

RUN wget -c https://wordpress.org/latest.tar.gz  \
    && tar -xvzf latest.tar.gz

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.ORIG \
    && mv nginx.conf /etc/nginx/ \
    && mkdir -p /usr/share/nginx/cache/fcgi

RUN mkdir /var/run/php-fpm \
    && mv /etc/php/7.3/fpm/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf.ORIG \
    && mv php-fpm.conf /etc/php/7.3/fpm/ \
    && rm /etc/php/7.3/fpm/pool.d/www.conf \
    && mv www.conf /etc/php/7.3/fpm/pool.d/www.conf \
    && mv /etc/php/7.3/fpm/php.ini /etc/php/7.3/fpm/php.ini.ORIG \
    && mv php.ini /etc/php/7.3/fpm/php.ini


CMD service nginx restart && service php7.3-fpm start && service mysql start && bash