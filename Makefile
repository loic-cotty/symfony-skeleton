# Définition des conteneurs
PHP_CONTAINER = php
NODE_CONTAINER = node
NGINX_CONTAINER = web

# Exécutables (locaux)
DOCKER = docker
DOCKER_COMPOSE = $(DOCKER) compose

# Commandes pour exécuter des commandes dans les conteneurs
PHP_EXEC = $(DOCKER_COMPOSE) exec $(PHP_CONTAINER)
NODE_EXEC = $(DOCKER_COMPOSE) exec $(NODE_CONTAINER)
NGINX_EXEC = $(DOCKER_COMPOSE) exec $(NGINX_CONTAINER)

# Exécutables dans les conteneurs
PHP = $(PHP_EXEC) php
COMPOSER = $(PHP_EXEC) composer
SYMFONY = $(PHP_EXEC) symfony
SYMFONY_CONSOLE = $(SYMFONY) console
NODE = $(NODE_EXEC) node
NPM = $(NODE_EXEC) npm

# Colors
COLOR_TITLE = \033[0;46m\033[34m
COLOR_RESET = \033[0m

##
##Makefile                       Description
##——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
help: ## Help screen for Makefile
	@echo "Liste des commandes disponibles :"
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
##docker compose                 Description
##——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
build: ## Build web environment.
	@printf "${COLOR_TITLE}\n--- Build environment   ---   ${COLOR_RESET}\n\n"
	$(DOCKER_COMPOSE) build $(or $(c), '--no-cache' )
up: ## Run environment in detached mode
	$(DOCKER_COMPOSE) up $(or $(c), '-d')
stop: ## Stop environment
	$(DOCKER_COMPOSE) stop
down: ## Stop and destroy environment
	$(DOCKER_COMPOSE) down
restart: ## Stop and run environment in detached mode
	$(DOCKER_COMPOSE) stop && $(DOCKER_COMPOSE) up -d
no-hope: ## Stop, destroy, build and run environment
	$(DOCKER_COMPOSE) down  && $(DOCKER_COMPOSE) build && $(DOCKER_COMPOSE) up -d
logs: ## See all docker logs
	$(DOCKER_COMPOSE) logs -f
compose: ## All other forgotten or unloved commands
	@$(DOCKER_COMPOSE) $(or $(c), )

##
##composer                       Description
##——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
composer: ## Run any composer command with 'c' parameter
	@printf "${COLOR_TITLE}\n--- Command executed: '$(MAKECMDGOALS) $(c)'   ---   ${COLOR_RESET}\n\n"
	@$(COMPOSER) $(or $(c), )
	@echo ""
##
##symfony                        Description
##——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
sf: ## Run any symfony console command with 'c' parameter
	@printf "${COLOR_TITLE}\n--- Command executed: $(SYMFONY_CONSOLE) $(c)   ---   ${COLOR_RESET}\n\n"
	@$(SYMFONY_CONSOLE) $(or $(c), )
	@echo ""
symfony: ## Run any symfony CLI command with parameter c=
	@printf "${COLOR_TITLE}\n---Command : $(SYMFONY) $(c)   ---   ${COLOR_RESET}\n\n"
	@$(SYMFONY) $(or $(c), )
	@echo ""

##
##node & npm                     Description
##——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
npm: ## Run any npm command with 'c' parameter
	@printf "${COLOR_TITLE}\n--- Command executed: $(NPM) $(or $(c), -v)   ---   ${COLOR_RESET}\n\n"
	@$(NPM) $(or $(c), -v)
node: ## Run any node command with 'c' parameter
	@printf "${COLOR_TITLE}\n--- Command executed: $(NODE) $(or $(c), -v)   ---   ${COLOR_RESET}\n\n"
	@$(NODE) $(or $(c), -v)
	@echo ""