.DEFAULT_GOAL := all

# more digestible to have a small file at the root
include bin/Makefile.contrib
include bin/Makefile.python
include bin/Makefile.jupyter
include bin/Makefile.watch

# Terminal helpers
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

all: pre-commit build

.PHONY: help
help: ## Show this help.
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  ${YELLOW}%-16s${GREEN}%s${RESET}\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: run
run: jupyter-notebook			## Start jupyter notebook server.

.PHONY: build
build: build-python				## Build the library.

format: fmt-python				## Format the code.

lint: lint-python				## Lint the code quality.

test: test-python				## Test the library code.

coverage: test-coverage			## Calculate test coverage of the library code.

clean: watch-del clean-python	## Clean build artifacts.

watch:	watch-add				## Format & build on file changes.
