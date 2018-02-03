ARG NODE_DOCKER_VERSION

FROM node:${NODE_DOCKER_VERSION} as builder
WORKDIR /dummy-nodejs-project
COPY . .
RUN npm install && \
    npm test && \
    npm run pkg

FROM scratch
COPY --from=builder /dummy-nodejs-project/main-linux /main-linux
COPY --from=builder /usr/lib/ /usr/lib
COPY --from=builder /lib/ /lib
COPY --from=builder /lib64/ /lib64
ENTRYPOINT ["./main-linux"]
