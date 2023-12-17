#!/bin/sh
rm -fr /app/quotes/tmp/pids/server.pid
/app/quotes/bin/rails s -b 0.0.0.0
