#!/usr/bin/env bash
set -e

# Define superuser password
/usr/bin/murmurd -ini /data/config.ini -supw "$SUPERUSER_PASSWORD"

# Start server
exec /usr/bin/murmurd -ini /data/config.ini -v -fg