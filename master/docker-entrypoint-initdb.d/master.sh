#!/bin/bash
echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"

set -e
# export PGPASSWORD="$POSTGRESQL_PASSWORD"
# psql登录参考：https://stackoverflow.com/questions/3582552/what-is-the-format-for-the-postgresql-connection-string-url
# If you look into the current docker-entrypoint.sh version, you will see, that during the execution of scripts in /docker-entrypoint-initdb.d PostgreSQL listens only on the UNIX socket, and the startup log says:

# LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"

psql  -U postgres <<-EOSQL
    CREATE ROLE replicaor REPLICATION LOGIN encrypted PASSWORD 'replicaor';
EOSQL


cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = replica
wal_sender_timeout = 60s
archive_mode = on
archive_command = 'cd .'
max_wal_senders = 8
EOF