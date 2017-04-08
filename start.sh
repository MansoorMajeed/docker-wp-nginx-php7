#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then
  WORDPRESS_DB="wp_db"
  WORDPRESS_HOST="104.131.40.4"
  WORDPRESS_USER="wp_user"
  WORDPRESS_PASSWORD="db_password"

  cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

  sed -i "s/database_name_here/$WORDPRESS_DB/
  s/username_here/$WORDPRESS_USER/
  s/localhost/$WORDPRESS_HOST/
  s/password_here/$WORDPRESS_PASSWORD/" /var/www/html/wp-config.php

  chown www-data:www-data /var/www/html/

fi

/usr/local/bin/supervisord -n
