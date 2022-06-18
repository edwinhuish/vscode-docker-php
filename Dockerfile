FROM edwinhuish/vscode-docker-php:8.1-20220610-103111

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash \
    && sudo apt install symfony-cli
