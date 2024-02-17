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

# Add entrypoint
COPY entrypoint.sh /data/entrypoint.sh
RUN chmod +x /data/entrypoint.sh

# Login
USER murmur:murmur

# Set entrypoint
ENTRYPOINT ["/data/entrypoint.sh"]