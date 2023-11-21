
local_resource(
    "cluster",
    "make gcp-up",
    # allow_parallel=True,
    trigger_mode=TRIGGER_MODE_AUTO
)

local_resource(
    "install-tap",
    "./scripts/install-tap.sh",
    trigger_mode=TRIGGER_MODE_AUTO,
    resource_deps=['cluster']
)

watch_catalog_resources = [
  "catalog",
   "scripts"
]

watch_workloads = [
  "workloads"
]

local_resource(
    "install-catalog",
    "./scripts/install-catalog.sh",
    trigger_mode=TRIGGER_MODE_AUTO,
    resource_deps=['cluster', 'install-tap'],
    deps=watch_catalog_resources
)

local_resource(
    "stream-ng-logs",
    serve_cmd="KUBECONFIG=almsc-kubeconfig.yaml stern -n cartographer-ng-system . --since=5m",
    trigger_mode=TRIGGER_MODE_AUTO,
    resource_deps=['cluster', 'install-tap']
)

local_resource(
    "stream-mrc-logs",
    serve_cmd="KUBECONFIG=almsc-kubeconfig.yaml stern -n managed-resource-controller . --since=5m",
    trigger_mode=TRIGGER_MODE_AUTO,
    resource_deps=['cluster', 'install-tap']
)

local_resource(
    "create-workloads",
    "./scripts/create-workloads.sh",
    trigger_mode=TRIGGER_MODE_MANUAL,
    auto_init=False,
    resource_deps=['cluster', 'install-tap'],
    deps=watch_workloads
)