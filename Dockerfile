FROM ruby:2.6.3-alpine

LABEL maintainer="Alexis Ortega <alexis.oc3@gmail.com>"

ENV RAILS_ENV=production

ENV NODE_ENV=production

ENV RAILS_SERVE_STATIC_FILES=true

ENV FIX_THIS_BOOLEAN=true

RUN apk update \
    && apk add build-base \
    && apk add less \
    && apk add tree \
    && apk add vim \
    && apk add nodejs \
    && apk add yarn \
    && apk add sqlite \
    && apk add sqlite-dev \
    && apk add tzdata

WORKDIR /usr/src

COPY ["Gemfile", "Gemfile.lock", "/usr/src/"]

RUN gem install rails:6.1.4

RUN gem install bundler:2.1.2

RUN bundle config set without development test

RUN bundle install

COPY ["package.json", "yarn.lock", "/usr/src/"]

RUN yarn install --production

RUN rails assets:precompile

COPY [".", "/usr/src"]

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
