# [Part 1](https://devopswithdocker.com/category/part-1): DevOps with Docker ([TKT21036](https://studies.helsinki.fi/courses/course-implementation/otm-4bd45ab8-8b23-4973-a918-a6b6f7bbb347)) 1 ECTS



## Exercise 1.1: Getting Started
- output for `docker ps -a` after creating 3 containers running in detached mode and stopping two: 
```console
xxxx@xxxxxx-PC:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                      PORTS     NAMES
80b8336d0f5f   nginx     "/docker-entrypoint.…"   5 seconds ago    Exited (0) 3 seconds ago              great_leavitt
e073679ec0bb   nginx     "/docker-entrypoint.…"   27 seconds ago   Exited (0) 24 seconds ago             gifted_meninsky
3066be923656   nginx     "/docker-entrypoint.…"   54 seconds ago   Up 53 seconds               80/tcp    quizzical_tesla
```

## Exercise 1.2: Cleanup
- output for `docker ps -a` and `docker image ls` after removing all images and containers:

```console
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

## Exercise 1.3: Secret Message

- The secret message is: `You can find the source code here: https://github.com/docker-hy`
- Commands given are:
    - `docker run -d devopsdockeruh/simple-web-service:ubuntu`
    - `docker container ls`
    - `docker exec elegant_hoover tail -f ./text.log`

```console
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

## Exercise 1.4: Missing Dependencies
- Command used to start the process and install the dependencies:
    - `docker run -it -d --name curler ubuntu sh -c 'apt-get update; apt-get -y install curl; while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'`
- Once installed, attach to the container: 
    - `docker attach curler`
- Input:
    - `helsinki.fi`

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
## Exercise 1.5: Sizes of Images
- Commands used: 
    - `docker pull devopsdockeruh/simple-web-service:ubuntu`
    - `docker pull devopsdockeruh/simple-web-service:alpine`
    - `docker image ls`
        - we can see alpine is smaller
    - `docker run -d devopsdockeruh/simple-web-service:alpine`
    - `docker exec 3a tail -f ./text.log`
        - Secret message is the same

```console
xxxx@xxxxxx-PC:~$ docker pull devopsdockeruh/simple-web-service:ubuntu
ubuntu: Pulling from devopsdockeruh/simple-web-service
5d3b2c2d21bb: Pull complete
3fc2062ea667: Pull complete
75adf526d75b: Pull complete
965d4bbb586a: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a
Status: Downloaded newer image for devopsdockeruh/simple-web-service:ubuntu
docker.io/devopsdockeruh/simple-web-service:ubuntu

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview devopsdockeruh/simple-web-service:ubuntu
xxxx@xxxxxx-PC:~$ docker pull devopsdockeruh/simple-web-service:alpine
alpine: Pulling from devopsdockeruh/simple-web-service
ba3557a56b15: Pull complete
1dace236434b: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:dd4d367476f86b7d7579d3379fe446ae5dfce25480903fb0966fc2e5257e0543
Status: Downloaded newer image for devopsdockeruh/simple-web-service:alpine
docker.io/devopsdockeruh/simple-web-service:alpine

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview devopsdockeruh/simple-web-service:alpine
xxxx@xxxxxx-PC:~$ docker image ls
REPOSITORY                          TAG       IMAGE ID       CREATED       SIZE
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   2 years ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   2 years ago   15.7MB
xxxx@xxxxxx-PC:~$ docker run -d devopsdockeruh/simple-web-service:alpine
3aeec821c9a5a1ea16e56b99e0ef71ba552e440fc27fd383ec7fbf0781834cfc
xxxx@xxxxxx-PC:~$ docker exec 3a tail -f ./text.log
2024-03-12 11:02:07 +0000 UTC
2024-03-12 11:02:09 +0000 UTC
2024-03-12 11:02:11 +0000 UTC
2024-03-12 11:02:13 +0000 UTC
2024-03-12 11:02:15 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-03-12 11:02:17 +0000 UTC
2024-03-12 11:02:19 +0000 UTC
```

## Exercise 1.6: Hello Docker Hub
- Steps: 
    - Command used: `docker run -it devopsdockeruh/pull_exercise`
    - Navigate to Docker Hub and find the docs.
    - Submit the password: `basics`
    - Get the secret message: `This is the secret message`
```console
xxxx@xxxxxx-PC:~$ docker run -it devopsdockeruh/pull_exercise
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete
5e2195587d10: Pull complete
6f595b2fc66d: Pull complete
165f32bf4e94: Pull complete
67c4f504c224: Pull complete
Digest: sha256:7c0635934049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"
```

## Exercise 1.7: Image for Script
- [Dockerfile](./Exercise1.7/Dockerfile) for curler

## Exercise 1.8: Two Line Dockerfile
- Steps:
    - Create [Dockerfile](./Exercise1.8/Dockerfile)
    - Build the image with command: `docker build . -t web-server`
    - Run the built image with command: `docker run web-server`
    
```console
xxxx@xxxxxx-PC:/mnt/c/Users/xxxx/devops-with-docker/part1/Exercise1.8$ docker build . -t web-server
[+] Building 0.9s (5/5) FINISHED                                                                                                                    docker:default
 => [internal] load build definition from Dockerfile                                                                                                          0.0s
 => => transferring dockerfile: 94B                                                                                                                           0.0s 
 => [internal] load metadata for docker.io/devopsdockeruh/simple-web-service:alpine                                                                           0.9s 
 => [internal] load .dockerignore                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                               0.0s 
 => CACHED [1/1] FROM docker.io/devopsdockeruh/simple-web-service:alpine@sha256:dd4d367476f86b7d7579d3379fe446ae5dfce25480903fb0966fc2e5257e0543              0.0s 
 => exporting to image                                                                                                                                        0.0s 
 => => exporting layers                                                                                                                                       0.0s 
 => => writing image sha256:978fbf315695ef5a3ec2e77ee411c4dcd9aa9b867fbc7ea3d26962545fda0585                                                                  0.0s 
 => => naming to docker.io/library/web-server                                                                                                                 0.0s 

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview
xxxx@xxxxxx-PC:/mnt/c/Users/xxxx/devops-with-docker/part1/Exercise1.8$ docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```

## Exercise 1.9: Volumes
- Steps:
    - `touch text.log` to create a file we can link to it.
    - `docker run -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service` to start a container with a bind mount that points to the file we've just created.

## Exercise 1.10: Ports Open

- Command:
    - `docker run -p 127.0.0.1:8080:8080 web-server`

## Exercise 1.11: Spring
- Steps:
    - [Dockerfile](./Exercise1.11/Dockerfile) for spring-example-project
    - Build image: `docker build . -t spring-example`
    - Run image: `docker run -p 3000:8080 spring-example`
    - Check browser http://localhost:3000/

## Exercise 1.12: Hello, Frontend!
- Steps:
    - [Dockerfile](./Exercise1.12/Dockerfile) for example-frontend
    - Build image: `docker build . -t example-frontend`
    - Run image: `docker run -p 5000:5000 example-frontend`
    - Check browser http://localhost:5000/

## Exercise 1.13: Hello, Backend!
- Steps:
    - [Dockerfile](Exercise1.13/Dockerfile) for example-backend
    - Build image: `docker build . -t example-backend`
    - Run image: `docker run -p 8080:8080 example-backend`
    - Check browser http://localhost:8080/ping

## Exercise 1.14 Environment:
- Steps:
    - Added required `ENV` variables to
        - [Dockerfile](./Exercise1.12/Dockerfile) from "example-frontend" of ex 1.12
        - [Dockerfile](Exercise1.13/Dockerfile) from "example-backend" of ex 1.13
    - Rebuild and rerun images
    - Check browser http://localhost:5000/, click button, see magic.

## Exercise 1.15: Homework
This is a dockerised version of an exercise from Full Stack Open part 1: Unicafe.
- Docker Hub link: [Unicafe](https://hub.docker.com/r/a2742eb2a0e916c64554fd6144d8a7/unicafe)
- Commands:
    - `docker pull a2742eb2a0e916c64554fd6144d8a7/unicafe`
    - `docker run -p 3000:3000 3c3a23603f56`
    - Check browser http://localhost:3000/

## Exercise 1.16: Cloud Deployment
I deployed the dockerised Unicafe from the previous exercise on [render.com](https://render.com) 

- Link to the app: https://unicafe-3ft2.onrender.com/
    >It may take more than a minute to respond since I have a free plan on render
- [Dockerfile](./Exercise1.15/Dockerfile)
- Deployment on render.com is straightforward:
    - Dashboard -> New + -> Webservice -> Deploy an existing image from registry -> Enter URL of docker hub link -> Next and Deploy

## Summary / notes ..



- `docker run -it -d <image>`
    - `-it` to interact with the container.
    - `-d` to run in detached mode

- `docker container attach <container>`:
    -  to attach your terminal's standard input, output and error to a running container.
    - `--no-stdin` option to not attach STDIN

- `docker diff <container>`
    - Check files modifications in container

- `docker cp <frompath> <container>:<topath>`
    - copy a file to the container

- `docker commit <container> <image new name>`
    - create an image based on the container

- Docker File Structure: 

```
FROM ubuntu:latest
WORKDIR /usr/src/app
COPY somefile.sh
RUN touch something.txt
CMD ./somefile.sh
```
- `docker build . -t <imagename>`:
    - build an image based on the docker file

- Docker File `ENTRYPOINT` instead of `CMD` if we want to pass an argument when we `docker run` an image. `CMD` can be used in addition to have a default argument. (Note that without bracket, command is executed as wrapped with `/bin/sh -c`)
```
FROM python:3.11
ENTRYPOINT ["python3"]
CMD ["--help"]
```
> In this example, we can run a command at the end (`docker build . -t pyt` then `docker run pyt --version`) to check the version. Without any command, it will output the help.