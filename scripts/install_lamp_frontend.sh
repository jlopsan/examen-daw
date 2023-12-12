#!/bin/bash

# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
apt update
# apt upgrade -y

# Instalar apache
apt install apache2 -y

# Instalación de PHP
sudo apt install php libapache2-mod-php php-mysql -y

# Copiamos en archivo de configuracion de Apache
cp ../conf/000-default.conf /etc/apache2/sites-available

# Reiniciamos el servicio de Apache
sudo systemctl restart apache2

# Copiamos el archivo de prueba de PHP
cp ../php/index.php /var/www/html

# Cambiamos el usuario y el propietario del directorio /var/www/html
chown -R www-data:www-data /var/www/html