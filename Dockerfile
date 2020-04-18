FROM bitnami/elasticsearch-curator
LABEL maintainer="Dmitriy Tarasevich <dmitritarasevich@mail.ru>"
USER root

COPY . /curator
WORKDIR /curator
RUN touch /curator/curator.log &&\
    apt update &&\
    apt install --no-install-recommends -y cron &&\ 
    rm -rf /var/lib/apt/lists/* &&\
    apt clean &&\
    echo 'export LC_ALL="C.UTF-8"' >> /etc/default/locale &&\
    echo 'export LANG="C.UTF-8"' &&\
    sh /curator/bin/crontab.sh

ENTRYPOINT ["cron", "&&", "tail", "-f", "/curator/curator.log"]
