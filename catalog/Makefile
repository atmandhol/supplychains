
GO ?= $(shell which go)
ARCH := $(shell $(GO) env GOARCH)
OS := $(shell $(GO) env GOOS)

SHELL := /usr/bin/env bash

.DEFAULT_GOAL := install

## kapp deploy app names are templated by tanzu supplychain init command.
.PHONY: install
install: require-kapp ## Installs the supply chains in the group to your active context.
	kapp deploy -a components.supplychain.tanzu -f components -y --dangerous-allow-empty-list-of-resources
	kapp deploy -a supplychain.tanzu -f supplychains -y --dangerous-allow-empty-list-of-resources

## kapp delete app names are templated by tanzu supplychain init command.
.PHONY: uninstall
uninstall: require-kapp ## Uninstalls the supply chains in this group from your active context.
	kapp delete -a supplychain.tanzu -y
	kapp delete -a components.supplychain.tanzu -y

.PHONY: package
# TODO: Add commands here
package: require-kctrl ## Creates a carvel package containing the supply chains and copies it to the Image registry mentioned in the $PACKAGE_REPO env variable.

.PHONY: install-package
# TODO: Add commands here
install-package: package

# =====================================================================================
# Helpers
# =====================================================================================

.PHONY: require-%
require-%: ## Checks if the required command exists on the command line
	@if ! command -v $* 1> /dev/null 2>&1; then echo "$* CLI not installed or found in PATH"; exit 1; fi

help: ## Print help for each make target.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
