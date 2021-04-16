#!/bin/bash
# echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"

set -e
# export PGPASSWORD="$POSTGRESQL_PASSWORD"
# psql登录参考：https://stackoverflow.com/questions/3582552/what-is-the-format-for-the-postgresql-connection-string-url
# psql  postgresql://postgres@localhost <<-EOSQL
#     CREATE ROLE user_name1 REPLICATION LOGIN PASSWORD 'my_password';
# EOSQL


# cat >> ${PGDATA}/postgresql.conf <<EOF
# wal_level = hot_standby
# archive_mode = on
# archive_command = 'cd .'
# max_wal_senders = 8
# hot_standby = on
# EOF