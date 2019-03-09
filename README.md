# drone statx issue

statx call fails inside `drone exec`.

```
drone exec --trusted --privileged dominikschmidt/drone-docker
```

fails because the call to `test-statx` does not succeed.

```
docker build --progress=plain  .
```

succeeds because the call to `test-statx` succeeds.
