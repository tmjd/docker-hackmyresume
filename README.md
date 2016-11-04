# docker-hackmyresume

Containerized hackmyresume with all the jsonresume-themes installed.

# Usage

    docker run --rm -v $(pwd):/resume tmjd/hackmyresume hackmyresume BUILD -t node_modules/jsonresume-theme-class /resume/resume.json TO /resume/out/index.all


## Credit Due

This Dockerfile was based on [alrayyes/docker-alpine-hackmyresume-bash](https://github.com/alrayyes/docker-alpine-hackmyresume-bash).
