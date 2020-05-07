cd /var/www
wget http://fr.wordpress.org/latest-fr_FR.tar.gz
tar -xzvf latest-fr_FR.tar.gz
mv wordpress myblog
rm latest-fr_FR.tar.gz
mv myblog.conf /etc/php/7.3/fpm/pool.d/
mv myblog /etc/nginx/sites-available/myblogls
ln -s /etc/nginx/sites-available/myblog /etc/nginx/sites-enabled/myblog
systemctl restart nginx.service
certbot certonly --webroot -w /var/www/myblog --agree-tos --no-eff-email --email smaccary@student.42.fr -d 91.172.60.73 --rsa-key-size 4096
openssl dhparam -out /etc/ssl/certs/dhparam.pem 1048
chmod 600 /etc/ssl/certs/dhparam.pem