#!/bin/sh
while ! pg_isready ; do sleep 10 ; echo " awating db" ; done 
source ~/.profile
echo "*** Rails setup ***" 

if [ ! -x /app/quotes/bin/rails ] 
then
	gem install --user-install rails -v 7.0.3.1
	rails new . --api -d postgresql -T -s --skip-git 

	/app/quotes/bin/bundle add spring --group "development, test" --skip-install 
	/app/quotes/bin/bundle add factory_bot_rails --group "development, test" --skip-install 
	/app/quotes/bin/bundle add faker --group "development, test" --skip-install 
	/app/quotes/bin/bundle add rspec --group "development, test" --skip-install
	/app/quotes/bin/bundle add rspec-rails --group "development, test" --skip-install
	/app/quotes/bin/bundle add prettyprint --group "development, test" --skip-install
	/app/quotes/bin/bundle add rubocop --group "development" --skip-install
	/app/quotes/bin/bundle add solargraph --group "development" --skip-install
	/app/quotes/bin/bundle add database_cleaner-active_record --group "test" --skip-install
	/app/quotes/bin/bundle install 
	/app/quotes/bin/bundle exec spring binstub --all

	/app/quotes/bin/rails db:prepare
fi

/app/quotes/bin/bundle install
/app/quotes/bin/bundle exec spring binstub --all

rm -fr /app/quotes/tmp/pids/server.pid
/app/quotes/bin/rails s -b 0.0.0.0
