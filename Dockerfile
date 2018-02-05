FROM babim/apache:php7.2

# install laravel
RUN apt-get update && apt-get install -y php-*dom php-*mbstring zip unzip git curl && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    ln -sf /usr/bin/php7.2 /etc/alternatives/php

# Define mountable directories.
RUN mkdir -p /etc-start/laravel && cp -R /var/www/laravel/* /etc-start/laravel

# clean depend
RUN apt-get purge git -y

# clean
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ADD start.sh /start.sh
RUN chmod 0755 /start.sh