FROM python:3.9
RUN apt-get update && apt-get install -y nodejs npm
ENV APP_MODE=python
ENV PORT=8080
WORKDIR /app
ADD ./assets.tar.gz /app/assets
COPY requirements.txt /app/
COPY package.json /app/
COPY flask_app.py /app/
COPY node_app.js /app/
COPY entrypoint.sh /app/
RUN chmod +x entrypoint.sh
RUN pip install -r requirements.txt
RUN npm install
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["--help"]
