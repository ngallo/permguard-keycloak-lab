# Makefile for permguard-keycloak-lab

DOCKER = docker
DOCKER_COMPOSE = docker-compose

PROVISIONER_DIR := keycloak/provisioner
PYENV_PY        := 3.11.9
PYENV_VENV      := provisioner

GO_APP_DIR := apps/go-smarthome

.PHONY: clean down up

# Default target
default: up

# Local setup
setup:
	@eval "$$(pyenv init -)"; eval "$$(pyenv virtualenv-init -)"; \
	pyenv install -s $(PYENV_PY); \
	if ! pyenv virtualenvs --bare | grep -qx "$(PYENV_VENV)"; then \
	  pyenv virtualenv $(PYENV_PY) $(PYENV_VENV); \
	fi; \
	cd "$(PROVISIONER_DIR)"; \
	PYENV_VERSION="$(PYENV_VENV)" pyenv exec python -m pip install --upgrade pip; \
	PYENV_VERSION="$(PYENV_VENV)" pyenv exec pip install -r requirements.txt


# Destroy services
destroy:
	$(DOCKER_COMPOSE) down -v --remove-orphans
	$(DOCKER) system prune -a --volumes -f

# Remove containers, networks, volumes
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans

# Stop services
down:
	$(DOCKER_COMPOSE) down

# Start services
up:
	$(DOCKER_COMPOSE) up -d

# Run the Go app directly from source
run-go:
	cd $(GO_APP_DIR) && go run ./cmd/server

# Build the Go app binary
build-go:
	cd $(GO_APP_DIR) && go build -o bin/go-smarthome ./cmd/server

# Run the Go app from the compiled binary
start-go: build-go
	./$(GO_APP_DIR)/bin/go-smarthome