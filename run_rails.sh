#!/bin/sh
while ! pg_isready ; do sleep 10 ; echo " awating db" ; done 
/app/quotes/bin/rails db:prepare \
&& /app/quotes/bin/bundle exec spring binstub --all
rm -fr /app/quotes/tmp/pids/server.pid
/app/quotes/bin/rails s -b 0.0.0.0

