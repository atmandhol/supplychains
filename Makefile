GO ?= $(shell which go)
ARCH := $(shell $(GO) env GOARCH)
OS := $(shell $(GO) env GOOS)

SHELL := /usr/bin/env bash

ldflags:
	@echo $(LDFLAGS)

.DEFAULT_GOAL := all
.PHONY: all
all: dev-up

.PHONY: check
check: require-jq require-gcloud require-tilt require-kubectl require-kapp require-stern
	@echo "You got all the stuff!"

.PHONY: dev-up
dev-up: check
	tilt up --legacy

.PHONY: clean
clean: check gcp-down
	tilt down
	rm kubeconfig.yaml

.PHONY: gcp-up
gcp-up: require-gcloud
	KUBECONFIG=kubeconfig.yaml gcloud beta container clusters create --project ${GCP_PROJECT} "downstream-${USER}" --zone ${GCP_REGION} \
        --no-enable-basic-auth --cluster-version "1.27" --release-channel "stable" --machine-type "e2-standard-8" \
        --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true \
        --scopes "https://www.googleapis.com/auth/cloud-platform" --num-nodes "3" \
        --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --no-enable-intra-node-visibility \
        --default-max-pods-per-node "110" --no-enable-master-authorized-networks \
        --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --no-enable-managed-prometheus \
        --no-enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes \
        --node-locations "us-central1-c" --labels=used_by=${USER} || true

.PHONY: gcp-down
gcp-down: require-gcloud
	gcloud container clusters delete "downstream-${USER}" --zone ${GCP_REGION} --project ${GCP_PROJECT} -q || true

.PHONY: require-%
require-%: ## Checks if the required command exists on the command line
	@if ! command -v $* 1> /dev/null 2>&1; then echo "$* CLI not installed or found in PATH"; exit 1; fi
