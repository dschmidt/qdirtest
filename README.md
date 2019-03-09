# docker buildkit statx issue

statx call fails with `DOCKER_BUILDKIT=1`.

```
$ DOCKER_BUILDKIT=1 docker build --progress=plain .

[…]

#10 [5/5] RUN /tmp/test-statx / && exit 23
#10       digest: sha256:6900a514c484a09392cd0ec3c714eae7c73a48450324f20ed25e2431a323b1f6
#10         name: "[5/5] RUN /tmp/test-statx / && exit 23"
#10      started: 2019-03-09 02:58:19.088304356 +0000 UTC
#10    completed: 2019-03-09 02:58:19.915249816 +0000 UTC
#10     duration: 826.94546ms
#10        error: "executor failed running [/bin/sh -c /tmp/test-statx / && exit 23]: exit code: 1"
#10 0.791 /: Operation not permitted
#10 0.791 statx(/) = -1

```

vs.

```
$ docker build --progress=plain  .

Sending build context to Docker daemon  161.3kB
Step 1/5 : FROM ubuntu:18.10
 ---> 09798120c134
Step 2/5 : RUN apt-get update -y && apt-get install -y g++
 ---> Using cache
 ---> 7a2f2522dd24
Step 3/5 : ADD test-statx.c /tmp/test-statx.c
 ---> Using cache
 ---> 8f0df6235547
Step 4/5 : RUN gcc -I/usr/include /tmp/test-statx.c -o /tmp/test-statx
 ---> Using cache
 ---> c48884a99439
Step 5/5 : RUN /tmp/test-statx / && exit 23
 ---> Running in eec7f1956faf
statx(/) = 0
results=fff
  Size: 152             Blocks: 0          IO Block: 4096    directory
Device: 00:996          Inode: 256         Links: 1
Access: (0755/drwxr-xr-x)  Uid:     0   Gid:     0
Access: 2019-03-09 02:43:58.318566113+0000
Modify: 2019-03-09 02:56:19.176096339+0000
Change: 2019-03-09 02:56:19.176096339+0000
 Birth: 2019-03-08 21:16:46.212637214+0000
Attributes: 0000000000000000 (........ ........ ........ ........ ........ ........ ........ .---.-..)
The command '/bin/sh -c /tmp/test-statx / && exit 23' returned a non-zero code: 23
```

