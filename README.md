#### redis版本：5.0.7

#### docker镜像环境变量

|参数名称|默认值|说明|
|:---|:---|:---|
|REDIS_HOME|/etc/redis|工作目录|
|REDIS_REQUIREPASS|密码，默认不设置|
|REDIS_MAXMEMORY|最大内存，默认不设置|
|REDIS_MAXCLIENTS|最大连接数，默认不设置|
|REDIS_BIND|127.0.0.1|bind 127.0.0.1|
|REDIS_PROTECTED_MODE|yes|protected-mode yes|
|REDIS_PORT|6379|port 6379|
|REDIS_TCP_BACKLOG|511|tcp-backlog 511|
|REDIS_TIMEOUT|0|timeout 0|
|REDIS_TCP_KEEPALIVE|300|tcp-keepalive 300|
|REDIS_DAEMONIZE|no|daemonize no|
|REDIS_SUPERVISED|no|supervised no|
|REDIS_PIDFILE|/var/run/redis_6379.pid|pidfile /var/run/redis_6379.pid|
|REDIS_LOGLEVEL|notice|loglevel notice|
|REDIS_LOGFILE|""|logfile ""|
|REDIS_DATABASES|16|databases 16|
|REDIS_ALWAYS_SHOW_LOGO|yes|always-show-logo yes|
|REDIS_SAVES|900/1,300/10,60/10000|save 900 1 & save 300 10 & save 60 10000|
|REDIS_STOP_WRITES_ON_GBSAVE_ERROR|yes|stop-writes-on-bgsave-error yes|
|REDIS_RDBCOMPRESSION|yes|rdbcompression yes|
|REDIS_RDBCHECKSUM|yes|rdbchecksum yes|
|REDIS_DBFILENAME|dump.rdb|dbfilename dump.rdb|
|REDIS_DIR|./|dir ./|
|REDIS_REPLICA_SERVE_STALE_DATA|yes|replica-serve-stale-data yes|
|REDIS_REPLICA_READ_ONLY|yes|replica-read-only yes|
|REDIS_REPL_DISKLESS_SYNC|no|repl-diskless-sync no|
|REDIS_REPL_DISKLESS_SYNC_DELAY|5|repl-diskless-sync-delay 5|
|REDIS_REPL_DISABLE_TCP_NODELAY|no|repl-disable-tcp-nodelay no|
|REDIS_REPLICA_PRIORITY|100|replica-priority 100|
|REDIS_LAZYFREE_LAZY_EVICTION|no|lazyfree-lazy-eviction no|
|REDIS_LAZYFREE_LAZY_EXPIRE|no|lazyfree-lazy-expire no|
|REDIS_LAZYFREE_LAZY_SERVER_DEL|no|lazyfree-lazy-server-del no|
|REDIS_REPLICA_LAZY_FLUSH|no|replica-lazy-flush no|
|REDIS_APPENDONLY|no|appendonly no|
|REDIS_APPENDFILENAME|"appendonly.aof"|appendfilename "appendonly.aof"|
|REDIS_APPENDFSYNC|everysec|appendfsync everysec|
|REDIS_NO_APPENDFSYNC_ON_REWRITE|no|no-appendfsync-on-rewrite no|
|REDIS_AUTO_AOF_REWRITE_PERCENTAGE|100|auto-aof-rewrite-percentage 100|
|REDIS_AUTO_AOF_REWRITE_MIN_SIZE|64mb|auto-aof-rewrite-min-size 64mb|
|REDIS_AOF_LOAD_TRUNCATED|yes|aof-load-truncated yes|
|REDIS_AOF_USE_RDB_PREAMBLE|yes|aof-use-rdb-preamble yes|
|REDIS_LUA_TIME_LIMIT|5000|lua-time-limit 5000|
|REDIS_SLOWLOG_LOG_SLOWER_THAN|10000|slowlog-log-slower-than 10000|
|REDIS_SLOWLOG_MAX_LEN|128|slowlog-max-len 128|
|REDIS_LATENCY_MONITOR_THRESHOLD|0|latency-monitor-threshold 0|
|REDIS_NOTIFY_KEYSPACE_EVENTS|""|notify-keyspace-events ""|
|REDIS_HASH_MAX_ZIPLIST_ENTRIES|512|hash-max-ziplist-entries 512|
|REDIS_HASH_MAX_ZIPLIST_VALUE|64|hash-max-ziplist-value 64|
|REDIS_LIST_MAX_ZIPLIST_SIZE|-2|list-max-ziplist-size -2|
|REDIS_LIST_COMPRESS_DEPTH|0|list-compress-depth 0|
|REDIS_SET_MAX_INTSET_ENTRIES|512|set-max-intset-entries 512|
|REDIS_ZSET_MAX_ZIPLIST_ENTRIES|128|zset-max-ziplist-entries 128|
|REDIS_ZSET_MAX_ZIPLIST_VALUE|64|zset-max-ziplist-value 64|
|REDIS_HLL_SPARSE_MAX_BYTES|3000|hll-sparse-max-bytes 3000|
|REDIS_STREAM_NODE_MAX_BYTES|4096|stream-node-max-bytes 4096|
|REDIS_STREAM_NODE_MAX_ENTRIES|100|stream-node-max-entries 100|
|REDIS_ACTIVEREHASHING|yes|activerehashing yes|
|REDIS_CLIENT_OUTPUT_BUFFER_LIMITS|normal/0/0/0,replica/256mb/64mb/60,pubsub/32mb/8mb/60|client-output-buffer-limit normal 0 0 0 & client-output-buffer-limit replica 256mb 64mb 60 & client-output-buffer-limit pubsub 32mb 8mb 60|
|REDIS_HZ|10|hz 10|
|REDIS_DYNAMIC_HZ|yes|dynamic-hz yes|
|REDIS_AOF_REWRITE_INCREMENTAL_FSYNC|yes|aof-rewrite-incremental-fsync yes|
|REDIS_RDB_SAVE_INCREMENTAL_FSYNS|yes|rdb-save-incremental-fsync yes|

#### docker启动示例：
```
docker run -d -p 6379:6379 --restart=always \
    -e REDIS_REQUIREPASS=caliahub \
    -e REDIS_MAXMEMORY=1G \
    -e REDIS_BIND=0.0.0.0 \
    -e REDIS_MAXCLIENTS=1000 \
    caliahub/redis:5.0.7
```

#### docker-compose启动示例：
```
version: '3'
services:
  redis:
    image: caliahub/redis:5.0.7
    restart: always
    ports:
      - 6379:6379
    environment:
      - REDIS_REQUIREPASS=caliahub
      - REDIS_MAXMEMORY=1G
      - REDIS_BIND=0.0.0.0
      - REDIS_MAXCLIENTS=1000
```
