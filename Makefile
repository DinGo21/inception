FILE = srcs/docker-compose.yml

all: up

up:
	docker compose -f $(FILE) up -d

down:
	docker compose -f $(FILE) down

start:
	docker compose -f $(FILE) start

stop:
	docker compose -f $(FILE) stop

status:
	docker ps
