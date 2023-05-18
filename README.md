# Docker-Images
## Image Urls
Database image: https://hub.docker.com/r/jehadlefdawi/news-db<br>
Backend image: https://hub.docker.com/r/jehadlefdawi/news-backend<br>
Frontend image: https://hub.docker.com/r/jehadlefdawi/news-frontend
## Database Docker File
<pre>
  FROM mysql:latest

  ENV MYSQL_ROOT_PASSWORD=root
  ENV MYSQL_DATABASE=newsdb

  COPY ./news.sql /docker-entrypoint-initdb.d/
</pre>

* `FROM mysql:latest` : use the latest official MySQL Docker image.
* `ENV MYSQL_ROOT_PASSWORD=root` : set the password for database `root`.
* `ENV MYSQL_DATABASE=newsdb` : set the name for database `newsdb`.
* `COPY ./news.sql /docker-entrypoint-initdb.d/` : copy the sql script to `/docker-entrypoint-initdb.d/` in the container.

## Backend Docker File
<pre>
  FROM node:alpine

  WORKDIR /app

  COPY package*.json ./

  RUN npm install

  COPY . .

  EXPOSE 8080

  CMD ["npm","start"]
</pre>

* `FROM node:alpine` : use the alpine version of the official Node.js Docker image.
* `WORKDIR /app` : set the working directory in the container to /app.
* `COPY package*.json ./` : this copy `package.json` and `package-lock.json` to the container.
* `RUN npm install` : this installs the Node.js dependencies for the app.
* `COPY . .` : this copy the rest of the app source code to the container.
* `EXPOSE 8080` : tell the docker that the container will use port 8080.
* `CMD ["npm","start"]` : default command, run when the container start.

## Frontend Docker File
<pre>
  FROM httpd:2.4

  COPY ./public-html/ /usr/local/apache2/htdocs/

  EXPOSE 80
</pre>

* `FROM httpd:2.4` : use version 2.4 of the official httpd (Apache http Server) Docker image.
* `COPY ./public-html/ /usr/local/apache2/htdocs/` : this copy the html file from the `public-html` directory to the `htdocs` directory in the container.
* `EXPOSE 80` : tell the docker that the container will use port 80.

## Instructions
### Build the images
open each Dockerfile folder, then:-
* `docker build -t news-db .`
* `docker build -t news-backend .`
* `docker build -t news-frontend .`

### Create the network
To connect the containers with each other:-
* `docker network create news-network`

### Run the containers
Run container for each image:-
* `docker run --network news-network --name news-db-container -d -p 3306:3306 news-db`
* `docker run --network news-network --name news-backend-container -d -p 8080:8080 news-backend`
* `docker run --network news-network --name news-frontend-container -d -p 3000:80 news-frontend`

### Push images
First create copy with the same name of my Docker hub username:-
* `docker tag news-db  jehadlefdawi/news-db`
* `docker tag news-backend  jehadlefdawi/news-backend`
* `docker tag news-frontend  jehadlefdawi/news-frontend`

Second push the images:-
* `docker push jehadlefdawi/news-db`
* `docker push jehadlefdawi/news-backend`
* `docker push jehadlefdawi/news-frontend`
