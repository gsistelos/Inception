COMPOSE = docker-compose -f srcs/docker-compose.yml

all: up

up: volumes
	$(COMPOSE) up --build -d

start:
	$(COMPOSE) start

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

volumes:
	mkdir -p /home/gguedes/data/database /home/gguedes/data/wordpress

ssl:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-out certificate.cert -keyout private.key -subj "/CN=gguedes.42.fr"

clean: down
	-docker rm -f $$(docker ps -q)
	-docker rmi -f $$(docker images -q)
	-docker network rm $$(docker network ls -q)
	-docker volume rm $$(docker volume ls -q)
	-rm -rf /home/gguedes/data/*

.PHONY: all up start down stop volumes ssl clean
