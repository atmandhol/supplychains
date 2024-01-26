# Supplychains

Supplychain (Carto v2) components, pipelines and chains.

## Setup

### Step 1: Make sure you have the following tools installed by running `make check`
* kind
* tilt
* kubectl
* tanzu
* kapp
* jq

You can install the missing tools in macOS as follows:
```bash
# Install kind
brew install kind

# Install tilt
brew install tilt-dev/tap/tilt

# Install Tanzu CLI and TAP plugins
brew install vmware-tanzu/tanzu/tanzu-cli
tanzu plugin install --group vmware-tap/default:v1.6.2

# kapp
brew tap vmware-tanzu/carvel
brew install kapp
```

### Step 2: Set required Environment variable
Update the `.envrc` file and set the GCP details.

Source the file using:
```bash
source .envrc
```
or use a utility like [direnv](https://direnv.net/) to do this automatically for you.

### Step 3: Set required credentials
Copy the `sample-values.yaml` to `values.yaml` (which is .gitignored) and fill it with Tanzu Network, TAP and Git details.


## Getting started
To run the setup, 
```bash
make dev-up
```

To cleanup
```bash
make clean
```