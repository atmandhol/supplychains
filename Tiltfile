
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

local_resource(
    "install-catalog",
    "./scripts/install-catalog.sh",
    trigger_mode=TRIGGER_MODE_MANUAL,
    auto_init=False,
    resource_deps=['cluster', 'install-tap']
)

local_resource(
    "create-workloads",
    "./scripts/create-workloads.sh",
    trigger_mode=TRIGGER_MODE_MANUAL,
    auto_init=False,
    resource_deps=['cluster', 'install-tap']
)