#!/bin/bash
echo '<meta name="environment" content="development">' >> /usr/share/nginx/html/index.html
exec "$@"