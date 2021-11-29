FROM ruby:2.6.3-alpine as builder

ENV RAILS_ENV=production

ENV NODE_ENV=production

# maybe?
ENV RAILS_SERVE_STATIC_FILES=false

RUN apk update \
    && apk add build-base \
    && apk add nodejs \
    && apk add yarn \
    && apk add postgresql-dev \
    && apk add tzdata

WORKDIR /usr/src

COPY ["Gemfile", "Gemfile.lock", "/usr/src/"]

RUN gem install bundler:2.1.2

RUN bundle config set without development test

RUN bundle install

COPY ["package.json", "yarn.lock", "/usr/src/"]

RUN yarn install --production

COPY [".", "/usr/src"]

RUN SECRET_KEY_BASE=`bin/rails secret` bin/rails assets:precompile



FROM nginx:1.21.4-alpine

ENV ROOT_DIR=/usr/share/nginx/html

WORKDIR $ROOT_DIR

COPY .docker/nginx/nginx.conf /tmp/default.conf

# copy over static (compiled) assets
COPY --from=builder /usr/src/public public/

# 1. substitutes variable references in the Nginx config template for real values from the environment
# 2. puts the final config in its place
RUN envsubst '$ROOT_DIR' < /tmp/default.conf > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
