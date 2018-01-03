ARG NODE_DOCKER_VERSION

FROM node:${NODE_DOCKER_VERSION} as builder
WORKDIR /go/src/github.com/rms1000watt/dummy-nodejs-project
COPY . .
RUN npm install
RUN npm test

FROM node:${NODE_DOCKER_VERSION}
COPY --from=builder /go/src/github.com/rms1000watt/dummy-nodejs-project/main.js /main.js
COPY --from=builder /go/src/github.com/rms1000watt/dummy-nodejs-project/node_modules /node_modules
ENTRYPOINT ["node", "main.js"]
