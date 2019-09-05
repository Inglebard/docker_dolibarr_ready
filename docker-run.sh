#!/bin/bash

usermod -u $WWW_USER_ID www-data
groupmod -g $WWW_GROUP_ID www-data

chown -R www-data:www-data /var/www


if [ ! -f /usr/local/etc/php/php.ini ]; then
  cat <<EOF > /usr/local/etc/php/php.ini
date.timezone = $PHP_INI_DATE_TIMEZONE
sendmail_path = /usr/sbin/sendmail -t -i
EOF
fi


exec apache2-foreground

