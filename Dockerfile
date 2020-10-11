FROM ubuntu:18.04
EXPOSE 80 443
RUN apt-get update -y
RUN apt-get install -y python-dev libffi-dev libssl-dev libsqlite3-dev
