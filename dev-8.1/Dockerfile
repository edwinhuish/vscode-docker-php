FROM edwinhuish/vscode-php:8.1

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install \
  ffmpeg \
  libavif-dev \
  g++ \
  libbz2-dev \
  libc-client-dev \
  libcurl4-gnutls-dev \
  libedit-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libkrb5-dev \
  libldap2-dev \
  libldb-dev \
  libmagickwand-dev \
  libmcrypt-dev \
  libmemcached-dev \
  libpng-dev \
  libpq-dev \
  libsqlite3-dev \
  libssl-dev \
  libreadline-dev \
  libxslt1-dev \
  libzip-dev \
  memcached \
  wget \
  unzip \
  zlib1g-dev \
  vim \
  iputils-ping \
  && docker-php-ext-install -j$(nproc) \
  bcmath \
  bz2 \
  calendar \
  exif \
  gettext \
  mysqli \
  opcache \
  pdo_mysql \
  pdo_pgsql \
  pgsql \
  soap \
  xsl \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd \
  && PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install -j$(nproc) imap \
  && docker-php-ext-configure intl \
  && docker-php-ext-install -j$(nproc) intl \
  && docker-php-ext-configure ldap \
  && docker-php-ext-install ldap \
  && docker-php-ext-configure zip \
  && docker-php-ext-install zip \
  && docker-php-ext-install pcntl \
  && docker-php-ext-install -j$(nproc) iconv \
  && CFLAGS="$CFLAGS -D_GNU_SOURCE" docker-php-ext-install sockets \
  && pecl install xmlrpc-1.0.0RC3 && docker-php-ext-enable xmlrpc \
  && pecl install memcached && docker-php-ext-enable memcached \
  && pecl install mongodb && docker-php-ext-enable mongodb \
  && pecl install redis && docker-php-ext-enable redis \
  && pecl install swoole && docker-php-ext-enable swoole \
  && yes '' | pecl install imagick && docker-php-ext-enable imagick \
  # && docker-php-source delete \
  # && apt-get remove -y g++ wget \
  && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/*

USER vscode
RUN echo "export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"" >> ${HOME}/.bashrc \
  && composer global require -q \
  friendsofphp/php-cs-fixer \
  robmorgan/phinx

USER root

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g yarn eslint" 2>&1
