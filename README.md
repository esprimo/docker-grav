# docker container for grav
The container is based on alpine linux and has both PHP and ngingx in the same
image (which is not best practice) and is therefore easy to use in local 
development. 

**Note:** This is most likely not something you want to put in production.

# Add grav project
It requires a mounted folder called "data" and init should be another folder
called "htdocs".
```sh
$ mkdir -p data/htdocs
```
Add the grav project in that folder.

# Run the container
First you need to build it:
```sh
$ docker build -t mygravcontainer .
```
Then run it:
```sh
$ docker run -v ${PWD}/data:/data -p 8081:80 -t mygravcontainer
```
It should now be accessable at [http://127.0.0.1:8081](http://127.0.0.1:80801).
