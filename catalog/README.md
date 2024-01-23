## Tanzu Supply Chains

This repo contains manifests for supplychains, components, rbac and required tekton resources for installing the supplychain package.

### Package details:
```
group: supplychain.tanzu
description: All my supplychains for my TAP clusters
```

## Install the Supply Chains on the cluster
```
make install
```

## Package up the Supplychains
```
PACKAGE_REPO={YOUR-REGISTRY-URL} make package
```
