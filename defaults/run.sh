#!/bin/sh
echo '    __                                              _ '
echo '   / /_  ____ _____  __  ______ _____  ____ __   __(_)'
echo '  / __ \/ __ `/ __ \/ / / / __ `/_  / / __ `/ | / / / '
echo ' / /_/ / /_/ / / / / /_/ / /_/ / / /_/ /_/ /| |/ / /  '
echo '/_.___/\__,_/_/ /_/\__, /\__,_/ /___/\__,_/ |___/_/   '
echo '                  /____/                              '
echo "T#: It's torr!-torrssen2-Transmission combined package"
echo

# Initial settings
if [ ! -d /home/banya/ ]; then
  ## Create user:group
  echo "zavi:x:$PGID:" >> /etc/group
  echo "banya:x:$PUID:$PGID:banya:/home/banya:/bin/ash" >> /etc/passwd
  echo "banya:!::0:::::" >> /etc/shadow

  mkdir -p /home/banya
  chown banya:zavi -R /home/banya /root/data
  chmod 755 -R /home/banya /root/data
fi
if [ ! -f /root/data/settings.json ]; then
  cp /defaults/settings.json /root/data/settings.json
fi
if [ ! -f /root/data/h2.mv.db ]; then
  cp /defaults/h2.mv.db /root/data/h2.mv.db
fi

# Run Transmission & Nginx (PHP7)
su - banya -c "transmission-daemon -g /root/data"
php-fpm7
nginx

# Bootstrap torr
if [ ! -f /root/torr.php ]; then
  wget -P /root/ http://localhost/torr/torr.php
fi

# Run torrssen2
while true
do
  cd /torrssen2 && git pull && cd /

  cp /torrssen2/docker/torrssen2-*.jar torrssen2.jar

  #java -jar torrssen2.jar
  java $JAVA_OPTS -Xshareclasses -Xquickstart -jar torrssen2.jar
done
