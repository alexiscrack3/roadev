FROM nginx:1.21.4-alpine

ENV ROOT_DIR=/usr/share/nginx/html

WORKDIR $ROOT_DIR

COPY .docker/nginx/nginx.conf /tmp/default.conf

# copy over static (compiled) assets
COPY public public/

# 1. substitutes variable references in the Nginx config template for real values from the environment
# 2. puts the final config in its place
RUN envsubst '$ROOT_DIR' < /tmp/default.conf > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
