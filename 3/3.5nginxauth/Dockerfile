FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html/
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./htpasswd /etc/nginx/htpasswd
EXPOSE 80

