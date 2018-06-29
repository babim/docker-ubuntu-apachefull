FROM babim/apache:base

RUN apt-get update && \
    apt-get install -y --force-yes php7.1 libapache2-mod-php7.1 && \
    apt-get install -y --force-yes imagemagick \
    php7.1-cgi php7.1-cli php7.1-phpdbg libphp7.1-embed php7.1-dev php-xdebug sqlite3 \
    php7.1-curl php7.1-gd php7.1-imap php7.1-interbase php7.1-intl php7.1-ldap php7.1-mcrypt php7.1-readline php7.1-odbc \
    php7.1-pgsql php7.1-pspell php7.1-recode php7.1-tidy php7.1-xmlrpc php7.1 php7.1-json php-all-dev php7.1-sybase \
    php7.1-sqlite3 php7.1-mysql php7.1-opcache php7.1-bz2 php7.1-mbstring php7.1-zip php-apcu php-imagick \
    php-memcached php-pear libsasl2-dev libssl-dev libsslcommon2-dev libcurl4-openssl-dev \
    php7.1-gmp php7.1-xml php7.1-bcmath php7.1-enchant php7.1-soap php7.1-xsl && \
    a2enmod rewrite headers http2 ssl && \
	#&& pecl install mongodb \
	#&& echo "extension=mongodb.so" >> /etc/php/7.1/apache2/php.ini \
	#&& echo "extension=mongodb.so" >> /etc/php/7.1/cli/php.ini && \
    ln -sf /usr/bin/php7.1 /etc/alternatives/php

# install option for webapp (owncloud)
RUN apt-get install -y --force-yes smbclient ffmpeg ghostscript openexr openexr openexr libxml2 gamin

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# copy config
RUN mkdir -p /etc-start/apache2 && cp -R /etc/apache2/* /etc-start/apache2 && \
    mkdir -p /etc-start/php && cp -R /etc/php/* /etc-start/php && \
    mkdir -p /etc-start/www && cp -R /var/www/* /etc-start/www

# Define mountable directories.
VOLUME ["/var/log/apache2", "/var/www", "/etc/apache2", "/etc/php"]