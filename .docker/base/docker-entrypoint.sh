#!/bin/sh

set -e

SECRET_KEY_BASE=`bin/rails secret` bin/rails db:create

SECRET_KEY_BASE=`bin/rails secret` bin/rails db:migrate

# exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
