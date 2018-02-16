ARG NODE_DOCKER_VERSION

FROM node:${NODE_DOCKER_VERSION} as builder
WORKDIR /dummy-nodejs-project
COPY . .
RUN npm install && \
    npm test && \
    npm run pkg

FROM scratch
COPY --from=builder /dummy-nodejs-project/main-linux         /main-linux
COPY --from=builder /lib/x86_64-linux-gnu/libdl.so.2         /lib/x86_64-linux-gnu/libdl.so.2
COPY --from=builder /lib/x86_64-linux-gnu/librt.so.1         /lib/x86_64-linux-gnu/librt.so.1
COPY --from=builder /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
COPY --from=builder /lib/x86_64-linux-gnu/libm.so.6          /lib/x86_64-linux-gnu/libm.so.6
COPY --from=builder /lib/x86_64-linux-gnu/libgcc_s.so.1      /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=builder /lib/x86_64-linux-gnu/libpthread.so.0    /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6          /lib/x86_64-linux-gnu/libc.so.6
COPY --from=builder /lib64/ld-linux-x86-64.so.2              /lib64/ld-linux-x86-64.so.2
ENTRYPOINT ["./main-linux"]
