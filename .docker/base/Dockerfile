FROM ruby:2.6.3-alpine

LABEL maintainer="Alexis Ortega <alexis.oc3@gmail.com>"

ENV RAILS_ENV=production

ENV NODE_ENV=production

# enable rails to serve static assets by setting ENV['RAILS_SERVE_STATIC_FILES'] to true
ENV RAILS_SERVE_STATIC_FILES=false

# ENV RAILS_LOG_TO_STDOUT true

RUN apk update \
    # required for nokogiri gem
    && apk add build-base \
    && apk add less \
    && apk add tree \
    && apk add vim \
    && apk add nodejs \
    && apk add yarn \
    # && apk add sqlite \
    # && apk add sqlite-dev \
    && apk add postgresql-client \
    # required for pg gem
    && apk add postgresql-dev \
    && apk add tzdata

WORKDIR /usr/src

COPY ["Gemfile", "Gemfile.lock", "/usr/src/"]

RUN gem install bundler:2.1.2

# when the Gemfile is changed and the lockfile has not been updated, running Bundler commands will be blocked
RUN bundle config set frozen true

# when the Gemfile is changed and the lockfile has not been updated, running Bundler commands will be blocked
RUN bundle config set deployment true

RUN bundle config set without development test

RUN bundle install

COPY ["package.json", "yarn.lock", "/usr/src/"]

RUN yarn install --production

COPY [".docker/base/docker-entrypoint.sh", "/usr/bin/"]

RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

COPY [".", "/usr/src"]

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
