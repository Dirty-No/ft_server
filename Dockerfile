FROM	debian:buster
EXPOSE	80
EXPOSE	443
WORKDIR	/app
COPY	./src/ /app
RUN		apt-get update -yqq && apt-get upgrade -yqq

RUN 	apt-get install -yqq nginx 
RUN		apt-get install -yqq mariadb-server mariadb-client
RUN		apt-get install -yqq php-fpm php-mysql
RUN		apt-get install -yqq php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi -y

RUN		apt-get install -yqq vim

RUN 	mv ssl /etc/nginx/.

RUN		mv sites-enabled/default /etc/nginx/sites-enabled/.

RUN		service mysql start \
		&&		echo "CREATE DATABASE wordpress;" | mysql -u root \
		&&		echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root \
		&&		echo "FLUSH PRIVILEGES;" | mysql -u root \
		&&		echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root	#

RUN		tar -xf tars/phpMyAdmin.tar.gz \
		&& mv phpMyAdmin-5.0.2-all-languages /usr/share/phpmyadmin \
		&& ln -s /usr/share/phpmyadmin /usr/share/nginx/html/phpmyadmin \
		&& mv config/config.inc.php /usr/share/nginx/html/phpmyadmin/

RUN		tar -xzf tars/wordpress.tar.gz -C  /usr/share/nginx/html/. \
		&& mv config/wp-config.php /usr/share/nginx/html/wordpress/.

RUN		mv template /usr/share/nginx/html/.

RUN 	service mysql start && mysql wordpress -u root --password=  < config/wordpress.sql

CMD 	bash start.sh && service nginx restart \
		&& service php7.3-fpm start \
		&& service mysql start \
		&& printf "\e[31mPhpMyAdmin:\n\t|_\t\
Login : root\n\t|_\t\
Password is empty\n\n\
WordPress:\n\t|_\t\
Login : smaccary\n\t|_\t\
Password : 1234\e[0m\n" && bash
