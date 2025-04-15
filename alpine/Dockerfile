FROM alpine:3.17
RUN apk add --no-cache curl
COPY entrypoint.sh /app/
ENV PING_URL=https://example.com
CMD ["/app/entrypoint.sh"]
