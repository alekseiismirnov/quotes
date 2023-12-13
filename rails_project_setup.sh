#!/bin/sh
echo "*** Rails Project Setup ***"
 ! [ -x /app/quotes/bin/rails ] && { echo '***'
echo '*** app does not exist yet'
echo '***'
rails new /app/quotes --api -d postgresql -T -s --skip-git
/app/quotes/bin/bundle install
/app/quotes/bin/rails db:prepare
/app/quotes/bin/bundle exec spring binstub rspec
}

rm -fr /app/quotes/tmp/pids/server.pid
/app/quotes/bin/rails s -b 0.0.0.0
