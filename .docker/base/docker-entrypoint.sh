#!/bin/sh

set -e

SECRET_KEY_BASE=`bin/rails secret`

# generate static files at runtime
bin/rails assets:precompile

bin/rails db:create

bin/rails db:migrate

# exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
