# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.231.5/containers/php/.devcontainer/base.Dockerfile

# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT="7.4-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="16"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# 修改 xdebug 配置
RUN sed -i 's|^xdebug\.start_with_request.*$|xdebug\.start_with_request = no|g' /usr/local/etc/php/conf.d/xdebug.ini
RUN sed -i 's|^xdebug\.client_port.*$|xdebug\.client_port = 9003|g' /usr/local/etc/php/conf.d/xdebug.ini

COPY ./scripts/* /tmp/scripts/
RUN bash /tmp/scripts/sshd-debian.sh \
    && bash /tmp/scripts/git-lfs-debian.sh \
    && bash /tmp/scripts/docker-debian.sh "true" "/var/run/docker-host.sock" "/var/run/docker.sock" "vscode"

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
  && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/*
  
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
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
  && pecl install memcached && docker-php-ext-enable memcached \
  && pecl install mongodb && docker-php-ext-enable mongodb \
  && pecl install redis && docker-php-ext-enable redis \
  && pecl install swoole && docker-php-ext-enable swoole \
  && yes '' | pecl install imagick && docker-php-ext-enable imagick \
  && docker-php-source delete

COPY ./data/php/* /usr/local/etc/php/

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g yarn eslint" 2>&1

COPY ./data/home/* /home/vscode/
RUN chown vscode:vscode /home/vscode -R

# Fire Docker/Moby script if needed along with Oryx's benv
ENTRYPOINT [ "/usr/local/share/docker-init.sh", "/usr/local/share/ssh-init.sh", "docker-php-entrypoint" ]
CMD [ "sleep", "infinity" ]
