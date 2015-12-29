# docker containers for grav
Two docker containers to run [grav](http://getgrav.org). One with NGINX one
with PHP.

**Note:** This is most likely not something you want to put in production.

## Add grav project
It requires a mounted folder called "data" and in it should be another folder
called "htdocs".
```sh
$ mkdir -p data/htdocs
```
Add the grav project in that folder.

## Run the containers
Just run:
```sh
$ docker-compose up
```
It should now be accessable at [http://127.0.0.1:8081](http://127.0.0.1:8081).

## Requirements
* [docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
