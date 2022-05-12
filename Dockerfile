FROM edwinhuish/vscode-docker-php:8.1-20220512-132140

COPY ./data/home/* /home/vscode/
RUN chown vscode:vscode /home/vscode -R
