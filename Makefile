.DEFAULT_GOAL := help

.PHONY: help
help: ## Print Makefile help.
	@grep -Eh '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: install-hooks
install-hooks: ## Install git hooks.
	prek install -f --install-hooks

.PHONY: deploy
deploy: ## Deploy site to the default target
	uv run lektor deploy ${TARGET}

.PHONY: deploy-github
deploy-github: TARGET = github
deploy-github: deploy ## Publish site to github

.PHONY: serve
serve: ## Serve lektor locally
	uv run lektor serve
