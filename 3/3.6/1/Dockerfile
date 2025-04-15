FROM node:16
ARG APP_VERSION=1.0
RUN echo "Building version $APP_VERSION"
LABEL maintainer="matvey@test.test" \
      version="1.0.0"
RUN useradd -m -s /bin/bash nodeuser
USER nodeuser
WORKDIR /home/nodeuser/app/
VOLUME /home/nodeuser/app/data/
COPY ./package.json .
RUN npm install
COPY ./index.js .
CMD ["node", "index.js"]

