# Basic web-app
FROM node:hydrogen-slim

LABEL session="BRKETI-1401"

# Copy app to /src
COPY . /src

WORKDIR /src

# Install dependencies
RUN  npm install

EXPOSE 8080

ENTRYPOINT ["node", "./app.js"]
