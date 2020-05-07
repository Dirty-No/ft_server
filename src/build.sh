export DEBIAN_FRONTEND=noninteractive
apt-get -yqq update
apt-get -yqq install apt-utils
apt-get -yqq install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
add-apt-repository ppa:certbot/certbot
apt-get -yqq update
apt-get install -yqq $(grep -vE "^\s*#" packet_requirements.txt  | tr "\n" " ") 
bash install_wordpress.sh
#mysql -u root -h
bash install_mysql.sh
#mysql_secure_installation