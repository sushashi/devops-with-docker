# Part 1: DevOps with Docker ([TKT21036](https://studies.helsinki.fi/kurssit/toteutus/otm-4bd45ab8-8b23-4973-a918-a6b6f7bbb347/TKT21036))

## Exercises

### Exercise 1.1
- output for `docker ps -a` after creating 3 containers running in detached mode and stopping two:
```
xxxx@xxxxxx-PC:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                      PORTS     NAMES
80b8336d0f5f   nginx     "/docker-entrypoint.…"   5 seconds ago    Exited (0) 3 seconds ago              great_leavitt
e073679ec0bb   nginx     "/docker-entrypoint.…"   27 seconds ago   Exited (0) 24 seconds ago             gifted_meninsky
3066be923656   nginx     "/docker-entrypoint.…"   54 seconds ago   Up 53 seconds               80/tcp    quizzical_tesla
```

### Exercise 1.2
- output for `docker ps -a` and `docker image ls` after removing all images and containers:

```
xxxx@xxxxxx-PC:~$ docker stop 3066
3066
xxxx@xxxxxx-PC:~$ docker container prune
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
80b8336d0f5fcfaee733854ee09b58a7861052fbfbc510d8297ef1c6dba5a684
e073679ec0bbf85abe3fcd360d8f907a0722ee1d28d9cf8bbf8ec44c8a8a2145
3066be9236560f6d1f82e09d1ed8e1a0a609216db29e923881a54a3d3963a2b7

Total reclaimed space: 3.279kB
xxxx@xxxxxx-PC:~$ docker image rm nginx
Untagged: nginx:latest
Untagged: nginx@sha256:c26ae7472d624ba1fafd296e73cecc4f93f853088e6a9c13c0d52f6ca5865107
Deleted: sha256:e4720093a3c1381245b53a5a51b417963b3c4472d3f47fc301930a4f3b17666a
Deleted: sha256:583de6ce675ade688fa76e7c18948b4907557a139e12825ae85e5a8c947e2c89
Deleted: sha256:1084f34dba33ee0238270b757d7d4c3ffa06fcac38f1be5bf26bf35d8982eb17
Deleted: sha256:eb8c0a03ddeb2a6164cddaa21c9795cf8e20dbe788ed6bcaa9cc2b5a58fa8aff
Deleted: sha256:3a4f946657e22d88014e3063827b07c83ac6d999d7f7b19618037bcee5c5f009
Deleted: sha256:0c2e669c3c8abe5ce516bd0ffbb3dec76614a9cd1dec058a7c4815a403adee83
Deleted: sha256:0814ebf6e0ed919bf8bf686038d645aa2b535eb9a6bc4b58b2df1b31d499fe3d
Deleted: sha256:ceb365432eec83dafc777cac5ee87737b093095035c89dd2eae01970c57b1d15
xxxx@xxxxxx-PC:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
xxxx@xxxxxx-PC:~$ docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
xxxx@xxxxxx-PC:~$
```

### Exercise 1.3

- The secret message is: `You can find the source code here: https://github.com/docker-hy`
- Commands given are:
    - `docker run -d devopsdockeruh/simple-web-service:ubuntu`
    - `docker container ls`
    - `docker exec elegant_hoover tail -f ./text.log`

```shell
xxxx@xxxxxx-PC:~$ docker run -d devopsdockeruh/simple-web-service:ubuntu
Unable to find image 'devopsdockeruh/simple-web-service:ubuntu' locally
ubuntu: Pulling from devopsdockeruh/simple-web-service
5d3b2c2d21bb: Pull complete
3fc2062ea667: Pull complete
75adf526d75b: Pull complete
965d4bbb586a: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a
Status: Downloaded newer image for devopsdockeruh/simple-web-service:ubuntu
f9e5eb300da81d848c9b75f4d335b536d5e20ff32f23e483384711c7c3c93c6e
xxxx@xxxxxx-PC:~$ docker container ls
CONTAINER ID   IMAGE                                      COMMAND                 CREATED          STATUS          PORTS     NAMES
f9e5eb300da8   devopsdockeruh/simple-web-service:ubuntu   "/usr/src/app/server"   14 seconds ago   Up 14 seconds             elegant_hoover
xxxx@xxxxxx-PC:~$ docker exec elegant_hoover tail -f ./text.log
2024-03-12 09:50:12 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-03-12 09:50:14 +0000 UTC
2024-03-12 09:50:16 +0000 UTC
2024-03-12 09:50:18 +0000 UTC
2024-03-12 09:50:20 +0000 UTC
2024-03-12 09:50:22 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-03-12 09:50:24 +0000 UTC
```

### Exercise 1.4
- Command used to start the process and install the dependencies: `docker run -it -d --name curler ubuntu sh -c 'apt-get update; apt-get -y install curl; while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'`
- Once installed, attach to the container: `docker attach curler`
- Input `helsinki.fi`

```console
xxxx@xxxxxx-PC:~$ docker run -it -d --name curler ubuntu sh -c 'apt-get update; apt-get -y install curl; while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
bccd10f490ab: Pull complete
Digest: sha256:77906da86b60585ce12215807090eb327e7386c8fafb5402369e421f44eff17e
Status: Downloaded newer image for ubuntu:latest
9a3712da97eb9157eee6e6e2eeddd5a9d351e199251e7b22098a1f71441de34e
xxxx@xxxxxx-PC:~$ docker attach curler
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.22.1</center>
</body>
</html>
Input website:
```

## Summary / notes ..

Commands | What | Short
--- | --- | ---
`docker image ls` | Lists images 

- `docker run -it -d <image>`
    - `-it` to interract with the container.
    - `-d` to run in detached mode

- `docker container attach <container>`:
    -  to attach your terminal's standard input, output and error to a running container.
    - `--no-stdin` option to not attachg STDIN