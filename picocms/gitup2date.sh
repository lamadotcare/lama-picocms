#!/bin/ash

if ! [ -f /usr/share/nginx/html/pico ]; then
  cd /usr/share/nginx/html \
  && curl -sSL https://getcomposer.org/installer | php \
  && git clone $PICO_COMPOSER_REPO pico \
  && php composer.phar --working-dir=pico install || exit 1
  echo "Waiting ${GITUP2DATE_SLEEP:-900} seconds until update..."
  sleep ${GITUP2DATE_SLEEP:-900}
fi

cd /usr/share/nginx/html/pico

while true; do
  git pull
  php ../composer.phar update
  echo "Waiting ${GITUP2DATE_SLEEP:-900} seconds until update..."
  sleep ${GITUP2DATE_SLEEP:-900}
done
