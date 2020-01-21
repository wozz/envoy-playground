package(default_visibility = ["//visibility:public"])

load(":def.bzl", "binary_location")

[binary_location(
    name = name,
    binary = "@{}//:binary".format(name),
) for name in [
    "jq",
    "kubectl",
    "yq",
]]
