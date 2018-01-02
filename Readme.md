# Dummy NodeJS Project

## Introduction

This is a dummy nodejs project used as reference for other projects such as: [https://github.com/rms1000watt/hello-world-concourse](https://github.com/rms1000watt/hello-world-concourse)

## Contents

- [Usage](#usage)

## Usage

```bash
./build.sh
docker run -itd --rm --name dummy-nodejs-project -p 3000:3000 rms1000watt/dummy-nodejs-project:latest
open http://localhost:3000
docker stop dummy-nodejs-project
```
