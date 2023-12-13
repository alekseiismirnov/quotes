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

RUN gem install rails -v 7.0.3.1

ADD rails_project_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/rails_project_setup.sh
ENTRYPOINT ["/usr/local/bin/rails_project_setup.sh"]

EXPOSE 3000
