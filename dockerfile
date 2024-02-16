FROM alpine:3.19

# Create user and Setup environment
RUN adduser -DHs /sbin/nologin murmur \
  && apk update \
  && apk upgrade \
  && apk add murmur \
  && apk add bash \
  && rm -rf /var/cache/apk/*

# Add data dir and set permissions
RUN mkdir /data \
  && chown murmur:murmur /data

# Copy config
COPY ./config/config.ini /data

# Set data dir as persistent volume
VOLUME /data

# Add entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Login
USER murmur:murmur

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]