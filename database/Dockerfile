FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=newsdb

COPY ./news.sql /docker-entrypoint-initdb.d/