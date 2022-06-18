FROM edwinhuish/vscode-docker-php:7.4-20220618-222728

RUN git config --global codespaces-theme.hide-status 1 \
    && curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o /usr/local/bin/php-cs-fixer && chmod a+x /usr/local/bin/php-cs-fixer 
