FROM postgres:13.2

COPY ./master.sh /docker-entrypoint-initdb.d/master.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/master.sh