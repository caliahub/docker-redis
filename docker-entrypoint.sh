#!/bin/bash

# Generate the config only if it doesn't exist
#	REDIS_HOME=/etc/redis
#	REDIS_REQUIREPASS
#	REDIS_MAXMEMORY
#	REDIS_MAXCLIENTS
################################## NETWORK #####################################
#	REDIS_BIND=127.0.0.1
#	REDIS_PROTECTED_MODE=yes
#	REDIS_PORT=6379
#	REDIS_TCP_BACKLOG=511
#	REDIS_TIMEOUT=0
#	REDIS_TCP_KEEPALIVE=300
################################# GENERAL #####################################
#	REDIS_DAEMONIZE=no
#	REDIS_SUPERVISED=no
#	REDIS_PIDFILE=/var/run/redis_6379.pid
#	REDIS_LOGLEVEL=notice
#	REDIS_LOGFILE=""
#	REDIS_DATABASES=16
#	REDIS_ALWAYS_SHOW_LOGO=yes
################################ SNAPSHOTTING  ################################
#	REDIS_SAVES=900/1,300/10,60/10000
#	REDIS_STOP_WRITES_ON_GBSAVE_ERROR=yes
#	REDIS_RDBCOMPRESSION=yes
#	REDIS_RDBCHECKSUM=yes
#	REDIS_DBFILENAME=dump.rdb
#	REDIS_DIR=./
################################# REPLICATION #################################
#	REDIS_REPLICA_SERVE_STALE_DATA=yes
#	REDIS_REPLICA_READ_ONLY=yes
#	REDIS_REPL_DISKLESS_SYNC=no
#	REDIS_REPL_DISKLESS_SYNC_DELAY=5
#	REDIS_REPL_DISABLE_TCP_NODELAY=no
#	REDIS_REPLICA_PRIORITY=100
############################# LAZY FREEING ####################################
#	REDIS_LAZYFREE_LAZY_EVICTION=no
#	REDIS_LAZYFREE_LAZY_EXPIRE=no
#	REDIS_LAZYFREE_LAZY_SERVER_DEL=no
#	REDIS_REPLICA_LAZY_FLUSH=no
############################## APPEND ONLY MODE ###############################
#	REDIS_APPENDONLY=no
#	REDIS_APPENDFILENAME="appendonly.aof"
#	REDIS_APPENDFSYNC=everysec
#	REDIS_NO_APPENDFSYNC_ON_REWRITE=no
#	REDIS_AUTO_AOF_REWRITE_PERCENTAGE=100
#	REDIS_AUTO_AOF_REWRITE_MIN_SIZE=64mb
#	REDIS_AOF_LOAD_TRUNCATED=yes
#	REDIS_AOF_USE_RDB_PREAMBLE=yes
################################ LUA SCRIPTING  ###############################
#	REDIS_LUA_TIME_LIMIT=5000
################################## SLOW LOG ###################################
#	REDIS_SLOWLOG_LOG_SLOWER_THAN=10000
#	REDIS_SLOWLOG_MAX_LEN=128
################################ LATENCY MONITOR ##############################
#	REDIS_LATENCY_MONITOR_THRESHOLD=0
############################# EVENT NOTIFICATION ##############################
#	REDIS_NOTIFY_KEYSPACE_EVENTS=""
############################### ADVANCED CONFIG ###############################
#	REDIS_HASH_MAX_ZIPLIST_ENTRIES=512
#	REDIS_HASH_MAX_ZIPLIST_VALUE=64
#	REDIS_LIST_MAX_ZIPLIST_SIZE=-2
#	REDIS_LIST_COMPRESS_DEPTH=0
#	REDIS_SET_MAX_INTSET_ENTRIES=512
#	REDIS_ZSET_MAX_ZIPLIST_ENTRIES=128
#	REDIS_ZSET_MAX_ZIPLIST_VALUE=64
#	REDIS_HLL_SPARSE_MAX_BYTES=3000
#	REDIS_STREAM_NODE_MAX_BYTES=4096
#	REDIS_STREAM_NODE_MAX_ENTRIES=100
#	REDIS_ACTIVEREHASHING=yes
#	REDIS_CLIENT_OUTPUT_BUFFER_LIMITS=normal/0/0/0,replica/256mb/64mb/60,pubsub/32mb/8mb/60
#	REDIS_HZ=10
#	REDIS_DYNAMIC_HZ=yes
#	REDIS_AOF_REWRITE_INCREMENTAL_FSYNC=yes
#	REDIS_RDB_SAVE_INCREMENTAL_FSYNS=yes

set -e

if [[ ! -f "${REDIS_HOME}/redis.conf" ]]; then
    CONFIG="${REDIS_HOME}/redis.conf"
	
	# requirepass
	if [[ -n ${REDIS_REQUIREPASS} ]]; then
        echo "requirepass ${REDIS_REQUIREPASS}" >> "${CONFIG}"
    fi
	# maxmemory
	if [[ -n ${REDIS_MAXMEMORY} ]]; then
        echo "maxmemory ${REDIS_MAXMEMORY}" >> "${CONFIG}"
    fi
	# maxclients
	if [[ -n ${REDIS_MAXCLIENTS} ]]; then
        echo "maxclients ${REDIS_MAXCLIENTS}" >> "${CONFIG}"
    fi
	
	# bind 127.0.0.1
    if [[ -z ${REDIS_BIND} ]]; then
	echo "bind 127.0.0.1" >> "${CONFIG}"
    else
	echo "bind ${REDIS_BIND}" >> "${CONFIG}"
    fi
	# protected-mode yes
	if [[ -z ${REDIS_PROTECTED_MODE} ]]; then
		echo "protected-mode yes" >> "${CONFIG}"
	else
		echo "protected-mode ${REDIS_PROTECTED_MODE}" >> "${CONFIG}"
    fi
	# port 6379
	if [[ -z ${REDIS_PORT} ]]; then
		echo "port 6379" >> "${CONFIG}"
	else
		echo "port ${REDIS_PORT}" >> "${CONFIG}"
    fi
	# tcp-backlog 511
	if [[ -z ${REDIS_TCP_BACKLOG} ]]; then
		echo "tcp-backlog 511" >> "${CONFIG}"
	else
		echo "tcp-backlog ${REDIS_TCP_BACKLOG}" >> "${CONFIG}"
    fi
	# timeout 0
	if [[ -z ${REDIS_TIMEOUT} ]]; then
		echo "timeout 0" >> "${CONFIG}"
	else
		echo "timeout ${REDIS_TIMEOUT}" >> "${CONFIG}"
    fi
	# tcp-keepalive 300
	if [[ -z ${REDIS_TCP_KEEPALIVE} ]]; then
		echo "tcp-keepalive 300" >> "${CONFIG}"
	else
		echo "tcp-keepalive ${REDIS_TCP_KEEPALIVE}" >> "${CONFIG}"
    fi
	# daemonize no
	if [[ -z ${REDIS_DAEMONIZE} ]]; then
		echo "daemonize no" >> "${CONFIG}"
	else
		echo "daemonize ${REDIS_DAEMONIZE}" >> "${CONFIG}"
    fi
	# supervised no
	if [[ -z ${REDIS_SUPERVISED} ]]; then
		echo "supervised no" >> "${CONFIG}"
	else
		echo "supervised ${REDIS_SUPERVISED}" >> "${CONFIG}"
    fi
	# pidfile /var/run/redis_6379.pid
	if [[ -z ${REDIS_PIDFILE} ]]; then
		echo "pidfile /var/run/redis_6379.pid" >> "${CONFIG}"
	else
		echo "pidfile ${REDIS_PIDFILE}" >> "${CONFIG}"
    fi
	# loglevel notice
	if [[ -z ${REDIS_LOGLEVEL} ]]; then
		echo "loglevel notice" >> "${CONFIG}"
	else
		echo "loglevel ${REDIS_LOGLEVEL}" >> "${CONFIG}"
    fi
	# logfile ""
	if [[ -z ${REDIS_LOGFILE} ]]; then
		echo "logfile \"\"" >> "${CONFIG}"
	else
		echo "logfile ${REDIS_LOGFILE}" >> "${CONFIG}"
    fi
	# databases 16
	if [[ -z ${REDIS_DATABASES} ]]; then
		echo "databases 16" >> "${CONFIG}"
	else
		echo "databases ${REDIS_DATABASES}" >> "${CONFIG}"
    fi
	# always-show-logo yes
	if [[ -z ${REDIS_ALWAYS_SHOW_LOGO} ]]; then
		echo "always-show-logo yes" >> "${CONFIG}"
	else
		echo "always-show-logo ${REDIS_ALWAYS_SHOW_LOGO}" >> "${CONFIG}"
    fi
	# save 900 1
	# save 300 10
	# save 60 10000
	if [[ -z ${REDIS_SAVES} ]]; then
		echo "save 900 1" >> "${CONFIG}"
		echo "save 300 10" >> "${CONFIG}"
		echo "save 60 10000" >> "${CONFIG}"
	else
		REDIS_SAVE_ARR=(${REDIS_SAVES//,/ })
		for REDIS_SAVE in ${REDIS_SAVE_ARR[@]}
		do
		  REDIS_SAVE=${REDIS_SAVE//\// }
		  echo "save ${REDIS_SAVE}" >> "${CONFIG}"
		done
    fi
	# stop-writes-on-bgsave-error yes
	if [[ -z ${REDIS_STOP_WRITES_ON_GBSAVE_ERROR} ]]; then
		echo "stop-writes-on-bgsave-error yes" >> "${CONFIG}"
	else
		echo "stop-writes-on-bgsave-error ${REDIS_STOP_WRITES_ON_GBSAVE_ERROR}" >> "${CONFIG}"
    fi
	# rdbcompression yes
	if [[ -z ${REDIS_RDBCOMPRESSION} ]]; then
		echo "rdbcompression yes" >> "${CONFIG}"
	else
		echo "rdbcompression ${REDIS_RDBCOMPRESSION}" >> "${CONFIG}"
    fi
	# rdbchecksum yes
	if [[ -z ${REDIS_RDBCHECKSUM} ]]; then
		echo "rdbchecksum yes" >> "${CONFIG}"
	else
		echo "rdbchecksum ${REDIS_RDBCHECKSUM}" >> "${CONFIG}"
    fi
	# dbfilename dump.rdb
	if [[ -z ${REDIS_DBFILENAME} ]]; then
		echo "dbfilename dump.rdb" >> "${CONFIG}"
	else
		echo "dbfilename ${REDIS_DBFILENAME}" >> "${CONFIG}"
    fi
	# dir ./
	if [[ -z ${REDIS_DIR} ]]; then
		echo "dir ./" >> "${CONFIG}"
	else
		echo "dir ${REDIS_DIR}" >> "${CONFIG}"
    fi
	# replica-serve-stale-data yes
	if [[ -z ${REDIS_REPLICA_SERVE_STALE_DATA} ]]; then
		echo "replica-serve-stale-data yes" >> "${CONFIG}"
	else
		echo "replica-serve-stale-data ${REDIS_REPLICA_SERVE_STALE_DATA}" >> "${CONFIG}"
    fi
	# replica-read-only yes
	if [[ -z ${REDIS_REPLICA_READ_ONLY} ]]; then
		echo "replica-read-only yes" >> "${CONFIG}"
	else
		echo "replica-read-only ${REDIS_REPLICA_READ_ONLY}" >> "${CONFIG}"
    fi
	# repl-diskless-sync no
	if [[ -z ${REDIS_REPL_DISKLESS_SYNC} ]]; then
		echo "repl-diskless-sync no" >> "${CONFIG}"
	else
		echo "repl-diskless-sync ${REDIS_REPL_DISKLESS_SYNC}" >> "${CONFIG}"
    fi
        # repl-diskless-sync-delay 5
        if [[ -z ${REDIS_REPL_DISKLESS_SYNC_DELAY} ]]; then
                echo "repl-diskless-sync-delay 5" >> "${CONFIG}"
        else
                echo "repl-diskless-sync-delay ${REDIS_REPL_DISKLESS_SYNC_DELAY}" >> "${CONFIG}"
    fi
	# repl-disable-tcp-nodelay no
	if [[ -z ${REDIS_REPL_DISABLE_TCP_NODELAY} ]]; then
		echo "repl-disable-tcp-nodelay no" >> "${CONFIG}"
	else
		echo "repl-disable-tcp-nodelay ${REDIS_REPL_DISABLE_TCP_NODELAY}" >> "${CONFIG}"
    fi
	# replica-priority 100
	if [[ -z ${REDIS_REPLICA_PRIORITY} ]]; then
		echo "replica-priority 100" >> "${CONFIG}"
	else
		echo "replica-priority ${REDIS_REPLICA_PRIORITY}" >> "${CONFIG}"
    fi
	# lazyfree-lazy-eviction no
	if [[ -z ${REDIS_LAZYFREE_LAZY_EVICTION} ]]; then
		echo "lazyfree-lazy-eviction no" >> "${CONFIG}"
	else
		echo "lazyfree-lazy-eviction ${REDIS_LAZYFREE_LAZY_EVICTION}" >> "${CONFIG}"
    fi
	# lazyfree-lazy-expire no
	if [[ -z ${REDIS_LAZYFREE_LAZY_EXPIRE} ]]; then
		echo "lazyfree-lazy-expire no" >> "${CONFIG}"
	else
		echo "lazyfree-lazy-expire ${REDIS_LAZYFREE_LAZY_EXPIRE}" >> "${CONFIG}"
    fi
	# lazyfree-lazy-server-del no
	if [[ -z ${REDIS_LAZYFREE_LAZY_SERVER_DEL} ]]; then
		echo "lazyfree-lazy-server-del no" >> "${CONFIG}"
	else
		echo "lazyfree-lazy-server-del ${REDIS_LAZYFREE_LAZY_SERVER_DEL}" >> "${CONFIG}"
    fi
	# replica-lazy-flush no
	if [[ -z ${REDIS_REPLICA_LAZY_FLUSH} ]]; then
		echo "replica-lazy-flush no" >> "${CONFIG}"
	else
		echo "replica-lazy-flush ${REDIS_REPLICA_LAZY_FLUSH}" >> "${CONFIG}"
    fi
	# appendonly no
	if [[ -z ${REDIS_APPENDONLY} ]]; then
		echo "appendonly no" >> "${CONFIG}"
	else
		echo "appendonly ${REDIS_APPENDONLY}" >> "${CONFIG}"
    fi
	# appendfilename "appendonly.aof"
	if [[ -z ${REDIS_APPENDFILENAME} ]]; then
		echo "appendfilename \"appendonly.aof\"" >> "${CONFIG}"
	else
		echo "appendfilename ${REDIS_APPENDFILENAME}" >> "${CONFIG}"
    fi
	# appendfsync everysec
	if [[ -z ${REDIS_APPENDFSYNC} ]]; then
		echo "appendfsync everysec" >> "${CONFIG}"
	else
		echo "appendfsync ${REDIS_APPENDFSYNC}" >> "${CONFIG}"
    fi
	# no-appendfsync-on-rewrite no
	if [[ -z ${REDIS_NO_APPENDFSYNC_ON_REWRITE} ]]; then
		echo "no-appendfsync-on-rewrite no" >> "${CONFIG}"
	else
		echo "no-appendfsync-on-rewrite ${REDIS_NO_APPENDFSYNC_ON_REWRITE}" >> "${CONFIG}"
    fi
	# auto-aof-rewrite-percentage 100
	if [[ -z ${REDIS_AUTO_AOF_REWRITE_PERCENTAGE} ]]; then
		echo "auto-aof-rewrite-percentage 100" >> "${CONFIG}"
	else
		echo "auto-aof-rewrite-percentage ${REDIS_AUTO_AOF_REWRITE_PERCENTAGE}" >> "${CONFIG}"
    fi
	# auto-aof-rewrite-min-size 64mb
	if [[ -z ${REDIS_AUTO_AOF_REWRITE_MIN_SIZE} ]]; then
		echo "auto-aof-rewrite-min-size 64mb" >> "${CONFIG}"
	else
		echo "auto-aof-rewrite-min-size ${REDIS_AUTO_AOF_REWRITE_MIN_SIZE}" >> "${CONFIG}"
    fi
	# aof-load-truncated yes
	if [[ -z ${REDIS_AOF_LOAD_TRUNCATED} ]]; then
		echo "aof-load-truncated yes" >> "${CONFIG}"
	else
		echo "aof-load-truncated ${REDIS_AOF_LOAD_TRUNCATED}" >> "${CONFIG}"
    fi
	# aof-use-rdb-preamble yes
	if [[ -z ${REDIS_AOF_USE_RDB_PREAMBLE} ]]; then
		echo "aof-use-rdb-preamble yes" >> "${CONFIG}"
	else
		echo "aof-use-rdb-preamble ${REDIS_AOF_USE_RDB_PREAMBLE}" >> "${CONFIG}"
    fi
	# lua-time-limit 5000
	if [[ -z ${REDIS_LUA_TIME_LIMIT} ]]; then
		echo "lua-time-limit 5000" >> "${CONFIG}"
	else
		echo "lua-time-limit ${REDIS_LUA_TIME_LIMIT}" >> "${CONFIG}"
    fi
	# slowlog-log-slower-than 10000
	if [[ -z ${REDIS_SLOWLOG_LOG_SLOWER_THAN} ]]; then
		echo "slowlog-log-slower-than 10000" >> "${CONFIG}"
	else
		echo "slowlog-log-slower-than ${REDIS_SLOWLOG_LOG_SLOWER_THAN}" >> "${CONFIG}"
    fi
	# slowlog-max-len 128
	if [[ -z ${REDIS_SLOWLOG_MAX_LEN} ]]; then
		echo "slowlog-max-len 128" >> "${CONFIG}"
	else
		echo "slowlog-max-len ${REDIS_SLOWLOG_MAX_LEN}" >> "${CONFIG}"
    fi
	# latency-monitor-threshold 0
	if [[ -z ${REDIS_LATENCY_MONITOR_THRESHOLD} ]]; then
		echo "latency-monitor-threshold 0" >> "${CONFIG}"
	else
		echo "latency-monitor-threshold ${REDIS_LATENCY_MONITOR_THRESHOLD}" >> "${CONFIG}"
    fi
	# notify-keyspace-events ""
	if [[ -z ${REDIS_NOTIFY_KEYSPACE_EVENTS} ]]; then
		echo "notify-keyspace-events \"\"" >> "${CONFIG}"
	else
		echo "notify-keyspace-events ${REDIS_NOTIFY_KEYSPACE_EVENTS}" >> "${CONFIG}"
    fi
	# hash-max-ziplist-entries 512
	if [[ -z ${REDIS_HASH_MAX_ZIPLIST_ENTRIES} ]]; then
		echo "hash-max-ziplist-entries 512" >> "${CONFIG}"
	else
		echo "hash-max-ziplist-entries ${REDIS_HASH_MAX_ZIPLIST_ENTRIES}" >> "${CONFIG}"
    fi
	# hash-max-ziplist-value 64
	if [[ -z ${REDIS_HASH_MAX_ZIPLIST_VALUE} ]]; then
		echo "hash-max-ziplist-value 64" >> "${CONFIG}"
	else
		echo "hash-max-ziplist-value ${REDIS_HASH_MAX_ZIPLIST_VALUE}" >> "${CONFIG}"
    fi
	# list-max-ziplist-size -2
	if [[ -z ${REDIS_LIST_MAX_ZIPLIST_SIZE} ]]; then
		echo "list-max-ziplist-size -2" >> "${CONFIG}"
	else
		echo "list-max-ziplist-size ${REDIS_LIST_MAX_ZIPLIST_SIZE}" >> "${CONFIG}"
    fi
	# list-compress-depth 0
	if [[ -z ${REDIS_LIST_COMPRESS_DEPTH} ]]; then
		echo "list-compress-depth 0" >> "${CONFIG}"
	else
		echo "list-compress-depth ${REDIS_LIST_COMPRESS_DEPTH}" >> "${CONFIG}"
    fi
	# set-max-intset-entries 512
	if [[ -z ${REDIS_SET_MAX_INTSET_ENTRIES} ]]; then
		echo "set-max-intset-entries 512" >> "${CONFIG}"
	else
		echo "set-max-intset-entries ${REDIS_SET_MAX_INTSET_ENTRIES}" >> "${CONFIG}"
    fi
	# zset-max-ziplist-entries 128
	if [[ -z ${REDIS_ZSET_MAX_ZIPLIST_ENTRIES} ]]; then
		echo "zset-max-ziplist-entries 128" >> "${CONFIG}"
	else
		echo "zset-max-ziplist-entries ${REDIS_ZSET_MAX_ZIPLIST_ENTRIES}" >> "${CONFIG}"
    fi
	# zset-max-ziplist-value 64
	if [[ -z ${REDIS_ZSET_MAX_ZIPLIST_VALUE} ]]; then
		echo "zset-max-ziplist-value 64" >> "${CONFIG}"
	else
		echo "zset-max-ziplist-value ${REDIS_ZSET_MAX_ZIPLIST_VALUE}" >> "${CONFIG}"
    fi
	# hll-sparse-max-bytes 3000
	if [[ -z ${REDIS_HLL_SPARSE_MAX_BYTES} ]]; then
		echo "hll-sparse-max-bytes 3000" >> "${CONFIG}"
	else
		echo "hll-sparse-max-bytes ${REDIS_HLL_SPARSE_MAX_BYTES}" >> "${CONFIG}"
    fi
	# stream-node-max-bytes 4096
	if [[ -z ${REDIS_STREAM_NODE_MAX_BYTES} ]]; then
		echo "stream-node-max-bytes 4096" >> "${CONFIG}"
	else
		echo "stream-node-max-bytes ${REDIS_STREAM_NODE_MAX_BYTES}" >> "${CONFIG}"
    fi
	# stream-node-max-entries 100
	if [[ -z ${REDIS_STREAM_NODE_MAX_ENTRIES} ]]; then
		echo "stream-node-max-entries 100" >> "${CONFIG}"
	else
		echo "stream-node-max-entries ${REDIS_STREAM_NODE_MAX_ENTRIES}" >> "${CONFIG}"
    fi
	# activerehashing yes
	if [[ -z ${REDIS_ACTIVEREHASHING} ]]; then
		echo "activerehashing yes" >> "${CONFIG}"
	else
		echo "activerehashing ${REDIS_ACTIVEREHASHING}" >> "${CONFIG}"
    fi
	# client-output-buffer-limit normal 0 0 0
	# client-output-buffer-limit replica 256mb 64mb 60
	# client-output-buffer-limit pubsub 32mb 8mb 60
	if [[ -z ${REDIS_CLIENT_OUTPUT_BUFFER_LIMITS} ]]; then
		echo "client-output-buffer-limit normal 0 0 0" >> "${CONFIG}"
		echo "client-output-buffer-limit replica 256mb 64mb 60" >> "${CONFIG}"
		echo "client-output-buffer-limit pubsub 32mb 8mb 60" >> "${CONFIG}"
	else
		REDIS_CLIENT_OUTPUT_BUFFER_LIMIT_ARR=(${REDIS_CLIENT_OUTPUT_BUFFER_LIMITS//,/ })
		for REDIS_CLIENT_OUTPUT_BUFFER_LIMIT in ${REDIS_CLIENT_OUTPUT_BUFFER_LIMIT_ARR[@]}
		do
		  REDIS_CLIENT_OUTPUT_BUFFER_LIMIT=${REDIS_CLIENT_OUTPUT_BUFFER_LIMIT//\// }
		  echo "client-output-buffer-limit ${REDIS_CLIENT_OUTPUT_BUFFER_LIMIT}" >> "${CONFIG}"
		done
    fi
	# hz 10
	if [[ -z ${REDIS_HZ} ]]; then
		echo "hz 10" >> "${CONFIG}"
	else
		echo "hz ${REDIS_HZ}" >> "${CONFIG}"
    fi
	# dynamic-hz yes
	if [[ -z ${REDIS_DYNAMIC_HZ} ]]; then
		echo "dynamic-hz yes" >> "${CONFIG}"
	else
		echo "dynamic-hz ${REDIS_DYNAMIC_HZ}" >> "${CONFIG}"
    fi
	# aof-rewrite-incremental-fsync yes
	if [[ -z ${REDIS_AOF_REWRITE_INCREMENTAL_FSYNC} ]]; then
		echo "aof-rewrite-incremental-fsync yes" >> "${CONFIG}"
	else
		echo "aof-rewrite-incremental-fsync ${REDIS_AOF_REWRITE_INCREMENTAL_FSYNC}" >> "${CONFIG}"
    fi
	# rdb-save-incremental-fsync yes
	if [[ -z ${REDIS_RDB_SAVE_INCREMENTAL_FSYNS} ]]; then
		echo "rdb-save-incremental-fsync yes" >> "${CONFIG}"
	else
		echo "rdb-save-incremental-fsync ${REDIS_RDB_SAVE_INCREMENTAL_FSYNS}" >> "${CONFIG}"
    fi
fi

exec "$@"
