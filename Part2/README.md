# [Part 2](https://devopswithdocker.com/category/part-2): DevOps with Docker: docker-compose ([TKT21037](https://studies.helsinki.fi/courses/course-implementation/otm-c73ef1c6-8fb0-42e8-9052-ef59b01cb409)) 1 ECTS

## Exercise 2.1
- [docker-compose](Exercise2.1/docker-compose.yml) file
- Create log file to link to: `touch text.log`
- Run `docker compose up`

## Exercise 2.2
- [docker-compose](Exercise2.2/docker-compose.yml) file
- Run `docker compose up`
- Check browser http://localhost:8080/

## Exercise 2.3
- [docker-compose](Exercise2.3/docker-compose.yml) file
- Run `docker compose up`
- Check browser http://localhost:5000/

## Exercise 2.4
- [docker-compose](Exercise2.4/docker-compose.yml) file
- Run `docker compose up`
- Check browser http://localhost:5000/

## Exercise 2.5
- Command used: `docker compose up --scale compute=3`

## Exercise 2.6
- [docker-compose](Exercise2.6/docker-compose.yml) file

## Exercise 2.7
- [docker-compose](Exercise2.7/docker-compose.yml) file

## Exercise 2.8
- [docker-compose](Exercise2.8/docker-compose.yml) file
- [nginx.conf](Exercise2.8/nginx.conf) file

## Exercise 2.9
- Changes:
    - We can see that the first buttons of the frontend send a GET request using the port 8080.
    - I naively added a redirection in port 8080 in Nginx to the backend.
    - And published the port 8080
- Files:
    - [docker-compose](Exercise2.9/docker-compose.yml) file
    - [nginx.conf](Exercise2.9/nginx.conf) file
    - [Dockerfile](../Part1/Exercise1.12/Dockerfile) Frontend from Part 1
    - [Dockerfile](../Part1/Exercise1.13/Dockerfile) Backend from Part 1

## Exercise 2.10
- From my naive implementation in exercise 2.9 I have exposed port 8080:
    ```
    Starting Nmap 7.92 ( https://nmap.org ) at 2024-03-18 08:01 UTC
    Nmap scan report for localhost (127.0.0.1)
    Host is up (0.0000050s latency).
    Other addresses for localhost (not scanned): ::1
    Not shown: 997 closed tcp ports (reset)
    PORT     STATE    SERVICE
    80/tcp   filtered http
    111/tcp  open     rpcbind
    8080/tcp filtered http-proxy
    ```

- Changes:
    - Cancel port 8080 redirection and publication.
    - Modify the `ENV` variable `REACT_APP_BACKEND_URL` to `http://localhost/api/` in the [Dockerfile](Exercise2.10/Dockerfile) file of the frontend.
- Files:
    - [docker-compose](Exercise2.10/docker-compose.yml) file.
    - [Dockerfile](Exercise2.10/Dockerfile) frontend.
    - [nginx.conf](Exercise2.10/nginx.conf) file.
- Rerun `docker compose up`
    - All buttons work.
    - Ports 5000 and 8080 are no longer open.
    ```
    Starting Nmap 7.92 ( https://nmap.org ) at 2024-03-18 08:31 UTC
    Nmap scan report for localhost (127.0.0.1)
    Host is up (0.0000050s latency).
    Other addresses for localhost (not scanned): ::1
    Not shown: 998 closed tcp ports (reset)
    PORT    STATE    SERVICE
    80/tcp  filtered http
    111/tcp open     rpcbind
    ```
## Exercise 2.11
I reused the [Unicafe](https://fullstackopen.com/en/part1/a_more_complex_state_debugging_react_apps#exercises-1-6-1-14) exercise from the Full Stack Open Part 1 course and set up a development environment using containers.

Steps:
- Modification of [package.json](Exercise2.11/unicafe/package.json) file by adding
    - `"nodemon":"^3.1.0"` as dependency and
    - `"dev": "nodemon -L index.js"` to be able to start nodemon.
- [Dockerfile](Exercise2.11/Dockerfile) used.
- [Docker compose](Exercise2.11/docker-compose.yml) filed used.

