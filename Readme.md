# Dummy NodeJS Project

## Introduction

This is a dummy nodejs project used as reference for other projects such as: [https://github.com/rms1000watt/hello-world-concourse](https://github.com/rms1000watt/hello-world-concourse)

## Contents

- [Usage](#usage)
- [Node Compiliation](#node-compilation)

## Usage

```bash
./build.sh
docker run -itd --rm --name dummy-nodejs-project -p 3000:3000 rms1000watt/dummy-nodejs-project:latest
open http://localhost:3000
docker stop dummy-nodejs-project
```

## Node Compliation

When we compile the node project, it's dynamically linked to some shared objects. Here are the shared objects:

```bash
$ ldd main-linux
linux-vdso.so.1 (0x00007fff395e8000)
libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f830253e000)
librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f8302336000)
libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f830202b000)
libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f8301d2a000)
libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f8301b14000)
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f83018f7000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f830154c000)
/lib64/ld-linux-x86-64.so.2 (0x00007f8302742000)
```

So, I just copy them into the from scratch docker image, and all is well!

