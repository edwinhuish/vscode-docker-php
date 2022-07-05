FROM edwinhuish/vscode-docker-php:7.4-20220618-222728

RUN git config --global codespaces-theme.hide-status 1

RUN cd /tmp \
    && wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz \
    && tar xvf /tmp/Python-2.7.10.tgz \
    && cd Python-2.7.10 \
    && ./configure --prefix=/usr/local/python2 \
    && make \
    && make install \
    && ln -s /usr/local/python2/bin/python /usr/bin/python2 \
    && rm -rf /tmp/*
