FROM edwinhuish/vscode-docker-php:7.4-20220618-222728

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash \
    && sudo apt install symfony-cli
