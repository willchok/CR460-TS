# Image de base
FROM ubuntu:16.04

#Installation d'apache
RUN apt-get update --fix-missing
RUN apt-get install -y apache2 libapache2-mod-php php-mysql gettext-base wordpress
RUN a2enmod php7.0


# Add wordpress files
RUN rm -rf /var/www/
COPY wordpress/ /var/www/
RUN chown -R www-data:www-data /var/www/
RUN chmod 777 /var/www/
COPY wp-config.php-template /var/www/
COPY entrypoint.sh /

# Identifie quelle commande rouler
ENTRYPOINT  ["/bin/bash", "/entrypoint.sh"]