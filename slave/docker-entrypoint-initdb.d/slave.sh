#!/bin/bash
# echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"

set -e
# export PGPASSWORD="$POSTGRESQL_PASSWORD"
# psql登录参考：https://stackoverflow.com/questions/3582552/what-is-the-format-for-the-postgresql-connection-string-url
# If you look into the current docker-entrypoint.sh version, you will see, that during the execution of scripts in /docker-entrypoint-initdb.d PostgreSQL listens only on the UNIX socket, and the startup log says:

# LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"



cat >> ${PGDATA}/recovery.conf <<EOF
standby_mode = on
recovery_target_timeline = 'latest'
primary_conninfo = 'host=master_db port=5432 user=postgres password=123'
EOF


cat >> ${PGDATA}/postgresql.conf <<EOF
max_connections = 500			
hot_standby = on			
max_standby_streaming_delay = 30s	
wal_receiver_status_interval = 5s
hot_standby_feedback = on	
EOF