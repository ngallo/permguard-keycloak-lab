# Makefile for permguard-keycloak-lab

DOCKER_COMPOSE = docker-compose

.PHONY: clean down up

default: up

# Remove containers, networks, volumes
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans

# Stop services
down:
	$(DOCKER_COMPOSE) down

# Start services
up:
	$(DOCKER_COMPOSE) up -d
