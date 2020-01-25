workspace(name = "envoy_filter_example")


load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("//dev/minikube:binary.bzl", "minikube_binary")
load("//rules/external_binary:def.bzl", "external_binary")
load(":def.bzl", "project")

[external_binary(
    name = name,
    platforms = getattr(project, name).platforms,
) for name in [
    "jq",
    "kubectl",
    "yq",
]]

minikube_binary(
    name = "minikube",
    platforms = project.minikube.platforms,
    version = project.minikube.version,
)

http_archive(
    name = "bazel_skylib",
    sha256 = project.skylib.sha256,
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel_skylib-{version}.tar.gz".format(version = project.skylib.version),
)

http_archive(
    name = "io_bazel_rules_go",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.21.0/rules_go-v0.21.0.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.21.0/rules_go-v0.21.0.tar.gz",
    ],
    sha256 = "b27e55d2dcc9e6020e17614ae6e0374818a3e3ce6f2024036e688ada24110444",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()

# Download the rules_docker repository at release v0.14.1
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "dc97fccceacd4c6be14e800b2a00693d5e8d07f69ee187babfd04a80a9f8e250",
    strip_prefix = "rules_docker-0.14.1",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.14.1/rules_docker-v0.14.1.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

load("@io_bazel_rules_docker//container:pull.bzl", "container_pull")

container_pull(
    name = "alpine_linux_amd64",
    registry = "index.docker.io",
    repository = "frolvlad/alpine-glibc",
    tag = "alpine-3.10",
    digest = "sha256:83ddab910021257190027b837ba52c8a9d4d47c1d5aa01a307048619293d129c"
)

load("//:project.bzl", "PROJECT")
container_pull(
    name = "gcr_envoy_container_v1_12_2",
    registry = "gcr.io",
    repository = PROJECT + "/envoy",
    tag = "v1.12.2",
    digest = "sha256:d5e1e43c797542bd71b81b1e62ea96a5575ee7c6d1b773034e805f369d5c3f85",
)
container_pull(
    name = "gcr_envoy_container_v1_12_2_1",
    registry = "gcr.io",
    repository = PROJECT + "/envoy",
    tag = "v1.12.2-1.eds_patch",
    digest = "sha256:5f9ecea6157a1aecc2a3506bdd3f7f00293b3907d2e645a198bcb20da4f25554",
)
container_pull(
    name = "gcr_envoy_container_v1_13_0",
    registry = "gcr.io",
    repository = PROJECT + "/envoy",
    tag = "v1.13.0",
    digest = "sha256:1a56abdb28a135191e9da740f11f866c0b535411adca13f409455084ee4ee44d",
)

local_repository(
    name = "simplexds",
    path = "../simplexds",
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758",
    strip_prefix = "protobuf-09745575a923640154bcf307fba8aedff47f240a",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/09745575a923640154bcf307fba8aedff47f240a.tar.gz"],
)
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

load("@simplexds//:repositories.bzl", simplexds_repositories = "go_repositories")
simplexds_repositories()

# This requires rules_docker to be fully instantiated before
# it is pulled in.
# Download the rules_k8s repository at release v0.4
http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "d91aeb17bbc619e649f8d32b65d9a8327e5404f451be196990e13f5b7e2d17bb",
    strip_prefix = "rules_k8s-0.4",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/v0.4.tar.gz"],
)
load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")
k8s_repositories()
load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")
k8s_go_deps()

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults")
k8s_defaults(
    name = "k8s_deploy",
    image_chroot = "gcr.io/{PROJECT}/",
    context = "minikube",
)
