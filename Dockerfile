##Choose your base image##
FROM alpine:latest

##Install nginx & remove cache##
RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

##Copy Nginx Configuration##
COPY nginx.conf /etc/nginx/http.d/default.conf 

##Create html directory & change permission##
RUN mkdir -p /var/www/html &&\
    chown -R nginx:nginx /var/www/html

##Copy index.html to html directory##
ADD index.html /var/www/html

##Set Working Directory##
WORKDIR /var/www/html

##EXPOSE port of web server##
EXPOSE 80

##Start nginx service on container startup##
CMD ["nginx","-g","daemon off;"]
