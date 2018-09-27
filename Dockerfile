FROM node:6.10.3-slim
RUN apt-get update
RUN apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 8888
RUN  yarn install \
    && yarn run build \
    && cp -r dist/* /var/www/html \
    && rm -rf /app
CMD ["nginx","-g","daemon off;"]
