# docker commands
up:
	docker-compose -f ./backend/docker-compose.yml up --build

up-d:
	docker-compose -f ./backend/docker-compose.yml up --build -d

build:
	docker-compose -f ./backend/docker-compose.yml build

stop:
	docker-compose -f ./backend/docker-compose.yml stop

down:
	docker-compose -f ./backend/docker-compose.yml down --rmi all --volumes --remove-orphans

clean:
	make cprune
	make iprune

iprune:
	docker image prune

cprune:
	docker container prune

goodbye_all_volume:
	docker-compose -f ./backend/docker-compose.yml down -v

ps:
	docker-compose -f ./backend/docker-compose.yml ps

backend:
	docker-compose -f ./backend/docker-compose.yml exec backend bash

postgres:
	docker-compose -f ./backend/docker-compose.yml exec postgres psql -U postgres

test:
	docker-compose -f ./backend/docker-compose.yml exec -T backend python manage.py test


# django commands
migrate:
	docker-compose -f ./backend/docker-compose.yml exec backend python manage.py makemigrations
	docker-compose -f ./backend/docker-compose.yml exec backend python manage.py migrate


# PHONY
.PHONY: backend frontend
