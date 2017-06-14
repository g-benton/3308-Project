## Docker Quickstart

First, you'll want to install [Docker](https://docs.docker.com/engine/installation/). Scroll down to the 'Supported Platforms' section and go from there. Be sure to install the main docker engine as well as docker compose.

cd into the app/ directory and look around a bit, especially the Dockerfile and docker-compose.yml.

run the following command

```
docker-compose up --build
```

Navigate to `localhost:8000` in the browser. You should see a success message from Django.