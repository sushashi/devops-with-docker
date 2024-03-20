# [Part 3](https://devopswithdocker.com/category/part-3): DevOps with Docker: security and optimization ([TKT21038](https://studies.helsinki.fi/courses/course-implementation/otm-487d8dd8-3a4b-447a-9118-f7bfff8169b6)) 1 ECTS

## Exercise 3.1

- [Config](../.github/workflows/deploy-express-app.yaml) file for the deployment pipeline of the simple Express-App.
- [Docker-compose](Exercise3.1/docker-compose.yml) file that pulls and run the Express-App and Watchtower from Docker Hub.

## Exercise 3.2

- [Config](../.github/workflows/deploy-express-app.yaml) file for the deployment pipeline of the simple Express-App including deployment to Render.

- [Link](https://express-app-hf9n.onrender.com/) to the deployed Express-App on Render (may take 1 min to start)

## Exercise 3.3

- [Shell Script](Exercise3.3/builder.sh) file

- Runs as desribed in the exercise instructions.

## Exercise 3.4
Files:
- [Shell Script](Exercise3.4/builder.sh) file used
- [Dockerfile](Exercise3.4/Dockerfile) file used

Commands:
- First build the image with `docker build -t builder .`

- Then run as described in the exercise in a single line:
    ```
    docker run -e DOCKER_USER=username_here \
        -e DOCKER_PWD=password_here \
        -v /var/run/docker.sock:/var/run/docker.sock \
        builder mluukkai/express_app username_here/testing
    ```