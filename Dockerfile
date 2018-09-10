FROM php:7.0-apache-stretch
RUN apt-get update \
        && apt-get install -y zip wget  \
        && wget -O /tmp/zendao.zip https://sourceforge.net/projects/zentao/files/10.3/ZenTaoPMS.10.3.stable.zip/download \
        && cd /tmp  \
        && unzip /tmp/zendao.zip  \
        && mv -f zentaopms/ /var/www/html/  \
        && chmod o=rwx -R /var/www/html/zentaopms/tmp/  \
        && chmod o=rwx -R /var/www/html/zentaopms/www/data \
        && docker-php-ext-install pdo_mysql  \
        && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
        && sed -i "s/;date.timezone =/date.timezone = Asia\/Shanghai/g" /usr/local/etc/php/php.ini \
        && sed -i "s#;session.save_path = \"/tmp\"#session.save_path = \"/var/www/html/zentaopms/tmp/\"#g" /usr/local/etc/php/php.ini
