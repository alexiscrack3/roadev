FROM nginx:1.21.4-alpine

LABEL maintainer="Alexis Ortega <alexis.oc3@gmail.com>"

ENV ROOT_DIR=/usr/share/nginx/html

WORKDIR $ROOT_DIR

COPY .docker/nginx/nginx.conf /tmp/default.conf

RUN mkdir log

# 1. substitutes variable references in the Nginx config template for real values from the environment
# 2. puts the final config in its place
RUN envsubst '$ROOT_DIR' < /tmp/default.conf > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx-debug", "-g", "daemon off;"]
