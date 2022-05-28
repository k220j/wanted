#!/bin/sh
set -e
bundle exec puma -C config/puma.rb -p 3000
exec "$@"