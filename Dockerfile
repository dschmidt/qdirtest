FROM ubuntu:18.10

RUN apt-get update -y && apt-get install -y g++
ADD test-statx.c /tmp/test-statx.c
RUN gcc -I/usr/include /tmp/test-statx.c -o /tmp/test-statx

RUN /tmp/test-statx / && exit 23
