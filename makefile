.PHONY: all
all: create_dirs up

create_dirs:
	mkdir -p /home/hbay/data/mariadb_data
	mkdir -p /home/hbay/data/wordpress_data

.PHONY: up
up:
	docker-compose -f ./srcs/docker-compose.yml up --build

.PHONY: down
down:
	docker-compose -f ./srcs/docker-compose.yml down

.PHONY: stop
stop:
	docker-compose -f ./srcs/docker-compose.yml stop

.PHONY: start
start:
	docker-compose -f ./srcs/docker-compose.yml start

.PHONY: status
status:
	docker ps
