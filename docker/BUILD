load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_image(
    name = "echoapp",
    embed = ["//echoapp:go_default_library"],
    goarch = "amd64",
    goos = "linux",
    pure = "on",
    visibility = ["//k8s:__pkg__"],
)
