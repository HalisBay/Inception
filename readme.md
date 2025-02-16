# Inception: Docker System Administration Project


![ekran](schema.png)


## Table of Contents
- [Introduction](#introduction)
- [General Guidelines](#general-guidelines)
- [Mandatory Part](#mandatory-part)
- [Directory Structure](#directory-structure)


## Introduction
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## General Guidelines
- This project needs to be done on a Virtual Machine.
- All the files required for the configuration of your project must be placed in a `srcs` folder.
- A Makefile is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using `docker-compose.yml`).
- This subject requires putting into practice concepts that, depending on your background, you may not have learned yet. Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.

## Mandatory Part
This project consists in setting up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use Docker Compose.
- Each Docker image must have the same name as its corresponding service.
- Each service has to run in a dedicated container.
- For performance matters, the containers must be built either from the penultimate stable version of Alpine or Debian. The choice is yours.
- You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your `docker-compose.yml` by your Makefile.
- It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

You then have to set up:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A Docker network that establishes the connection between your containers.
- Your containers have to restart in case of a crash.

Additional guidelines:
- A Docker container is not a virtual machine. Thus, it is not recommended to use any hacky patch based on `tail -f` and so forth when trying to run it. Read about how daemons work and whether it’s a good idea to use them or not.
- Of course, using `network: host` or `--link` or `links:` is forbidden. The network line must be present in your `docker-compose.yml` file.
- Your containers must not be started with a command running an infinite loop. Thus, this also applies to any command used as entrypoint, or used in entrypoint scripts. The following are a few prohibited hacky patches: `tail -f`, `bash`, `sleep infinity`, `while true`.
- Read about PID 1 and the best practices for writing Dockerfiles.
- In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain `admin/Admin` or `administrator/Administrator` (e.g., `admin`, `administrator`, `Administrator`, `admin-123`, and so forth).
- Your volumes will be available in the `/home/login/data` folder of the host machine using Docker. Of course, you have to replace the `login` with yours.
- To make things simpler, you have to configure your domain name so it points to your local IP address. This domain name must be `login.42.fr`. Again, you have to use your own login. For example, if your login is `wil`, `wil.42.fr` will redirect to the IP address pointing to wil’s website.
- The `latest` tag is prohibited.
- No password must be present in your Dockerfiles.
- It is mandatory to use environment variables.
- Also, it is strongly recommended to use a `.env` file to store environment variables and strongly recommended that you use the Docker secrets to store any confidential information.
- Your NGINX container must be the only entry point into your infrastructure via port 443 only, using the TLSv1.2 or TLSv1.3 protocol.

## Directory Structure
Below is an example of the expected directory structure:
```plaintext
$> ls -alR
total XX
drwxrwxr-x 3 wil wil 4096 April 42 20:42 .
drwxrwxrwt 17 wil wil 4096 April 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 Makefile
drwxrwxr-x 3 wil wil 4096 April 42 20:42 secrets
drwxrwxr-x 3 wil wil 4096 April 42 20:42 srcs
./secrets:
total XX
drwxrwxr-x 2 wil wil 4096 April 42 20:42 .
drwxrwxr-x 6 wil wil 4096 April 42 20:42 ..
-rw-r--r-- 1 wil wil XXXX April 42 20:42 credentials.txt
-rw-r--r-- 1 wil wil XXXX April 42 20:42 db_password.txt
-rw-r--r-- 1 wil wil XXXX April 42 20:42 db_root_password.txt
./srcs:
total XX
drwxrwxr-x 3 wil wil 4096 April 42 20:42 .
drwxrwxr-x 3 wil wil 4096 April 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 docker-compose.yml
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 .env
drwxrwxr-x 5 wil wil 4096 April 42 20:42 requirements
./srcs/requirements:
total XX
drwxrwxr-x 5 wil wil 4096 April 42 20:42 .
drwxrwxr-x 3 wil wil 4096 April 42 20:42 ..
drwxrwxr-x 4 wil wil 4096 April 42 20:42 bonus
drwxrwxr-x 4 wil wil 4096 April 42 20:42 mariadb
drwxrwxr-x 4 wil wil 4096 April 42 20:42 nginx
drwxrwxr-x 4 wil wil 4096 April 42 20:42 tools
drwxrwxr-x 4 wil wil 4096 April 42 20:42 wordpress
./srcs/requirements/mariadb:
total XX
drwxrwxr-x 4 wil wil 4096 April 42 20:45 .
drwxrwxr-x 5 wil wil 4096 April 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 April 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 April 42 20:42 tools
[...]
./srcs/requirements/nginx:
total XX
drwxrwxr-x 4 wil wil 4096 April 42 20:42 .
drwxrwxr-x 5 wil wil 4096 April 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 April 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX April 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 April 42 20:42 tools
[...]
$> cat srcs/.env
DOMAIN_NAME=wil.42.fr
# MYSQL SETUP
MYSQL_USER=XXXXXXXXXXXX
[...]
$>
