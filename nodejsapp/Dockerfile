FROM node:16
WORKDIR /app
COPY package.json /app
RUN npm install 
COPY index.js /app
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
