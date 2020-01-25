load("@k8s_deploy//:defaults.bzl", "k8s_deploy")
load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_deploy(
    name = "simplexds_deployment",
    kind = "deployment",
    template = ":simplexds_deployment.yaml",
    images = {
        "simplexds": "@simplexds//docker:simplexds",
    },
)

k8s_deploy(
    name = "simplexds_service",
    kind = "service",
    template = ":simplexds_service.yaml",
)

k8s_deploy(
    name = "simpleapp_deployment",
    kind = "deployment",
    template = ":simpleapp_deployment.yaml",
    images = {
        "echoapp": "//docker:echoapp",
        "envoy_image": "@gcr_envoy_container_v1_12_2_1//image",
    },
)

k8s_deploy(
    name = "simpleapp_configmap",
    kind = "configmap",
    template = ":simpleapp_configmap.yaml",
)

k8s_deploy(
    name = "gateway_deployment",
    kind = "deployment",
    template = ":gateway_deployment.yaml",
    images = {
        "envoy_image": "@gcr_envoy_container_v1_12_2_1//image",
    },
)

k8s_deploy(
    name = "gateway_configmap",
    kind = "configmap",
    template = ":gateway_configmap.yaml",
)

k8s_deploy(
    name = "gateway_service",
    kind = "service",
    template = ":gateway_service.yaml",
)

k8s_objects(
    name = "configs",
    objects = [
        ":simpleapp_configmap",
        ":gateway_configmap",
    ],
)

k8s_objects(
    name = "deployments",
    objects = [
        ":simplexds_deployment",
        ":simpleapp_deployment",
        ":gateway_deployment",
    ],
)

k8s_objects(
    name = "services",
    objects = [
        ":gateway_service",
        ":simplexds_service",
    ],
)

k8s_objects(
    name = "start_all",
    objects = [
        ":configs",
        ":deployments",
        ":services",
    ],
)
