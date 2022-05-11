# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.231.5/containers/php/.devcontainer/base.Dockerfile

# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT="8.1-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="16"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# 修改 xdebug 配置
RUN echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20210902/xdebug.so' > /usr/local/etc/php/xdebug.ini \
  && echo '; xdebug.mode=debug' >> /usr/local/etc/php/xdebug.ini \
  && echo '; xdebug.client_host=localhost' >> /usr/local/etc/php/xdebug.ini \
  && echo '; xdebug.client_port=9003' >> /usr/local/etc/php/xdebug.ini


# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g yarn eslint" 2>&1
