# My armbian based data center

## Base infrastructure

* DNS server - for internal DNS entries
* Traefik - convert docker container to DNS name with Lets Encrypt Certificate

## User functionality

* NextCloud via Docker on shared disk
* MiniDLNA to share NextCloud disk to internal network / TV
* Gogs - internal Git repositories - Go based application in docker

Inspired by https://github.com/kdeenkhoorn/docker-compose

## External prerequisites

* DNS entity controlled with API
