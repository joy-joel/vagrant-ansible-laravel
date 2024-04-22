#!/bin/bash

# UPDATING & UPGRADING THE SERVER

sudo apt update && sudo apt upgrade -y < /dev/null


# INSTALl LAMP STACK (Apache, MySQL, PHP, Ansible)

sudo apt-get install apache2 -y < /dev/null

sudo apt install ansible -y < /dev/null

sudo apt-get install mysql-server -y < /dev/null

sudo add-apt-repository -y ppa:ondrej/php < /dev/null

sudo apt-get install php-sqlite3

sudo apt-get update < /dev/null

sudo apt-get install libapache2-mod-php php php-common php-xml php-mysql php-gd php-mbstring php-tokenizer php-json php-bcmath php-curl php-zip unzip -y < /dev/null

sudo sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/8.2/apache2/php.ini

sudo systemctl restart apache2 < /dev/null


# INSTALL COMPOSER

sudo apt install curl -y 

sudo curl -sS https://getcomposer.org/installer | php 

sudo mv composer.phar /usr/local/bin/composer 

composer --version < /dev/null


# CONFIGURE APACHE VIRTUAL HOST

cat << EOF > /etc/apache2/sites-available/laravel.conf
<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName 192.168.33.30
    DocumentRoot /var/www/html/laravel/public

    <Directory /var/www/html/laravel>
        Options Indexes MultiViews FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enable Apache rewrite module
sudo a2enmod rewrite 

# Enable the virtual host
sudo a2ensite laravel.conf

# Restart Apache to apply changes
sudo systemctl restart apache2


# CLONE LARAVEL APPLICATION AND DEPENDENCIES


mkdir /var/www/html/laravel && cd /var/www/html/laravel

# Clone PHP application from GitHub
cd /var/www/html && sudo git clone https://github.com/laravel/laravel.git

cd /var/www/html/laravel && composer install --no-dev < /dev/null

# Set proper permissions for the application directory
sudo chown -R www-data:www-data /var/www/html/laravel

sudo chmod -R 775 /var/www/html/laravel

sudo chmod -R 775 /var/www/html/laravel/storage

sudo chmod -R 775 /var/www/html/laravel/bootstrap/cache

cd /var/www/html/laravel && sudo cp .env.example .env

php artisan key:generate


# CONFIGURING MYSQL: CREATING USER AND PASSWORD

echo "Creating MySQL user and database"
PASS=$2
if [ -z "$2" ]; then
  PASS=`openssl rand -base64 8`
fi

mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$1'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$1'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user and database created."
echo "Username:   $1"
echo "Database:   $1"
echo "Password:   $PASS"


# EXECUTE KEY GENERATE AND MIGRATE COMMAND FOR PHP

sudo sed -i 's/DB_DATABASE=laravel/DB_DATABASE=altschool-second-semester/' /var/www/html/laravel/.env

sudo sed -i 's/DB_USERNAME=root/DB_USERNAME=joyjoel/' /var/www/html/laravel/.env

sudo sed -i 's/DB_PASSWORD=/DB_PASSWORD=joyjoel@123/' /var/www/html/laravel/.env

php artisan config:cache

cd /var/www/html/laravel && php artisan migrate

# Finish setup
echo "LAMP stack deployment for Slave node completed successfully!"