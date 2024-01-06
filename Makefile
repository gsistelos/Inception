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
	mkdir -p ~/data/database ~/data/wordpress

ssl:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-out certificate.cert -keyout private.key -subj "/CN=gguedes.42.rio"

clean: down
	-docker rm -f $$(docker ps -aq)
	-docker rmi -f $$(docker images -aq)
	-docker network rm $$(docker network ls -q)
	-docker volume rm $$(docker volume ls -q)

.PHONY: all up start down stop volumes ssl clean
