FROM caliahub/alpine:3.11.5

MAINTAINER Calia "cnboycalia@gmail.com"

ENV REDIS_VERSION=5.0.7 \
    REDIS_PORT=6379 \
    REDIS_HOME=/etc/redis

COPY docker-entrypoint.sh /usr/local/bin/

RUN set -eux; \
    cd /tmp; \
	addgroup -S redis --gid=1000; \
    adduser -S -g redis --uid=1000 redis; \
    apk add --no-cache --virtual .build-deps \
		coreutils \
		gcc \
		linux-headers \
		make \
		musl-dev \
		openssl-dev; \ 
    wget -O redis.tar.gz http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz; \
    mkdir -p "${REDIS_HOME}"; \	
    tar zxf redis.tar.gz -C ${REDIS_HOME} --strip-components=1; \
    make -C "${REDIS_HOME}"; \
    make -C "${REDIS_HOME}" install; \
    rm -rf "${REDIS_HOME}"* "/tmp/redis"*; \
	chown -R redis:redis "${REDIS_HOME}"

WORKDIR ${REDIS_HOME}

VOLUME ${REDIS_HOME}

USER redis

EXPOSE ${REDIS_PORT}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["redis-server", "redis.conf"]
