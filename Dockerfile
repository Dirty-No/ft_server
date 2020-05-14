FROM	debian:buster
EXPOSE	80
EXPOSE	443
WORKDIR	/app
COPY	./src/ /app
RUN		apt-get update -yqq && apt-get upgrade -yqq

RUN 	apt-get install -yqq  nginx 
RUN		apt-get install -yqq mariadb-server mariadb-client
sudo 	apt-get install mysql-server
RUN		apt-get install -yqq php-fpm php-mysql
RUN		apt-get install -yqq php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi -y

RUN		apt-get install -yqq vim

RUN 	mv ssl /etc/nginx/.

RUN		mv sites-enabled/* /etc/nginx/sites-enabled/.


#RUN 	mv ethereal /var/www/html/.
RUN 	mv miniblog /usr/share/nginx/html/.
#RUN	 mkdir /var/www/gtml/phpmyadmin \
 #  	 && tar xvzf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components=1 -C /var/www/gtml/phpmyadmin \
  # 	 && tar xvzf src/wordpress-5.4.1-fr_FR.tar.gz -C  var/www/html && 

RUN		service mysql start
RUN		echo "CREATE DATABASE wordpress;" | mysql -u root
RUN		echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
RUN		echo "FLUSH PRIVILEGES;" | mysql -u root
RUN		echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
RUN		mysql wordpress -u root --password=  < wordpress.sql

RUN		alias sudo=''

CMD 	service nginx restart && service php7.3-fpm start && service mysql start && bash


