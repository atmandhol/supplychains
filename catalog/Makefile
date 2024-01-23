
GO ?= $(shell which go)
ARCH := $(shell $(GO) env GOARCH)
OS := $(shell $(GO) env GOOS)

SHELL := /usr/bin/env bash

.DEFAULT_GOAL := install

.PHONY: install
install: require-kapp
	kapp deploy -a supplychain.tanzu -f components -f supplychains -y --dangerous-allow-empty-list-of-resources

.PHONY: package
# TODO: Add commands here
package: require-kctrl

.PHONY: install-package
# TODO: Add commands here
install-package: package

.PHONY: require-%
require-%: ## Checks if the required command exists on the command line
	@if ! command -v $* 1> /dev/null 2>&1; then echo "$* CLI not installed or found in PATH"; exit 1; fi