.PHONY: build

SHELL := /bin/bash
PATH := $(HOME)/.rd/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH

HOME_DIR ?= "build/home"
PROJECT_DIR ?= "build/home/project"

all: build

build:
	@docker build -t tb0hdan/agentic-sandbox -f deployments/Dockerfile .

dirs:
	@mkdir -p $(HOME_DIR) $(PROJECT_DIR)

claude: dirs
	@bin/agent claude $(HOME_DIR) $(PROJECT_DIR)

codex: dirs
	@bin/agent codex $(HOME_DIR) $(PROJECT_DIR)

gemini: dirs
	@bin/agent gemini $(HOME_DIR) $(PROJECT_DIR)

opencode: dirs
	@bin/agent opencode $(HOME_DIR) $(PROJECT_DIR)

compose: dirs
	@docker compose -f deployments/docker-compose.yml up -d

compose-down:
	@docker compose -f deployments/docker-compose.yml down
