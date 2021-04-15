FROM postgres:13.2

COPY ./build.sh /docker-entrypoint-initdb.d/build.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/build.sh