FROM nginx:alpine
RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
            CMD curl -f http://localhost/health || exit 1
COPY ./index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]


