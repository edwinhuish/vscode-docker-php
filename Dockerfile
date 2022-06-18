FROM edwinhuish/vscode-docker-php:8.1-20220610-103111

RUN git config --global codespaces-theme.hide-status 1 \
    && curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o /usr/local/bin/php-cs-fixer && chmod a+x /usr/local/bin/php-cs-fixer 
