FROM docker.io/library/ruby:3.0.0-alpine

RUN apk update && \
  apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  libxslt-dev \
  libffi-dev \
  readline \
  build-base \
  postgresql-dev \
  sqlite-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  git \
  tzdata \
  vips \
  && rm -rf /var/cache/apk/*

WORKDIR /app/quotes

RUN echo "*** Rails setup ***" \
&& if [[ ! -x /app/quotes/bin/rails ]] ; then echo '***' \
&& gem install rails -v 7.0.3.1 \
&& rails new /app/quotes --api -d postgresql -T -s --skip-git \
&& /app/quotes/bin/bundle add spring --group "development, test" --skip-install \
&& /app/quotes/bin/bundle add factory_bot_rails --group "development, test" --skip-install \
&& /app/quotes/bin/bundle add faker --group "development, test" --skip-install \
&& /app/quotes/bin/bundle add rspec --group "development, test" --skip-install \
&& /app/quotes/bin/bundle add prettyprint --group "development, test" --skip-install \
&& /app/quotes/bin/bundle add rubocop --group "development" --skip-install \
&& /app/quotes/bin/bundle add solargraph --group "development" --skip-install \
&& /app/quotes/bin/bundle add database_cleaner-active_record --group "test" --skip-install \
&& /app/quotes/bin/bundle install ; fi

COPY run_rails.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run_rails.sh 

ENTRYPOINT ["run_rails.sh"]
EXPOSE 3000

