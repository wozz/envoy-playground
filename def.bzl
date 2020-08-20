project = struct(
    deployment_name = "envoy-playground",
    namespace = "envoy-playground",
    envoy = struct(
        versions = struct(
            v1_12_2 = {
                "name": "gcr_envoy_container_v1_12_2",
                "tag": "v1.12.2",
                "digest": "sha256:d5e1e43c797542bd71b81b1e62ea96a5575ee7c6d1b773034e805f369d5c3f85",
            },
            v1_12_2_1 = {
                "name": "gcr_envoy_container_v1_12_2_1",
                "tag": "v1.12.2-1.eds_patch",
                "digest": "sha256:5f9ecea6157a1aecc2a3506bdd3f7f00293b3907d2e645a198bcb20da4f25554",
            },
            v1_13_0 =  {
                "name": "gcr_envoy_container_v1_13_0",
                "tag": "v1.13.0",
                "digest": "sha256:1a56abdb28a135191e9da740f11f866c0b535411adca13f409455084ee4ee44d",
            },
            v1_15_0 = {
                "name": "gcr_envoy_container_v1_15_0",
                "tag": "v1.15.0",
                "digest": "sha256:19645c917914b11dba57162110e3898b46c5d644d21c7bf2ff824a34c7de6221",
            },
        ),
    ),
    kubernetes = struct(
        version = "1.15.6",
    ),
    kubectl = struct(
        platforms = {
            "darwin": {
                "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.6/bin/darwin/amd64/kubectl",
                "sha256": "1b8e747984ae3f9aa5a199bd444823d703dcd4dbf0617347b3b3aea254ada7b1",
            },
            "linux": {
                "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.6/bin/linux/amd64/kubectl",
                "sha256": "522115e0f11d83c08435a05e76120c89ea320782ccaff8e301bd14588ec50145",
            },
            "windows": {
                "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.6/bin/windows/amd64/kubectl.exe",
                "sha256": "cd134c5746e39b985df979a944876c0d61ae88e79d954f8534a66bc84cd8a7fb",
            },
        },
    ),
    minikube = struct(
        version = "1.6.2",
        platforms = [
            {
                "platform": "linux",
                "sha256": "eabd027438953d29a4b0f7b810c801919cc13bef3ebe7aff08c9534ac2b091ab",
            },
            {
                "platform": "darwin",
                "sha256": "5ea5168a80597ee6221bf50a524429a24a37f0c0f36725e6b297dc5a7a6a2105",
            },
            {
                "platform": "windows",
                "sha256": "79d66c874cfe3497656e9ba191680cc95abd92d2f722b10de38f00b76ef82393",
            },
        ],
    ),
    skylib = struct(
        version = "0.9.0",
        sha256 = "1dde365491125a3db70731e25658dfdd3bc5dbdfd11b840b3e987ecf043c7ca0",
    ),
    jq = struct(
        platforms = {
            "darwin": {
                "url": "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64",
                "sha256": "5c0a0a3ea600f302ee458b30317425dd9632d1ad8882259fcaf4e9b868b2b1ef",
            },
            "linux": {
                "url": "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64",
                "sha256": "af986793a515d500ab2d35f8d2aecd656e764504b789b66d7e1a0b727a124c44",
            },
            "windows": {
                "url": "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-win64.exe",
                "sha256": "a51d36968dcbdeabb3142c6f5cf9b401a65dc3a095f3144bd0c118d5bb192753",
            },
        },
    ),
    yq = struct(
        platforms = {
            "darwin": {
                "url": "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_darwin_amd64",
                "sha256": "06732685917646c0bbba8cc17386cd2a39b214ad3cd128fb4b8b410ed069101c",
            },
            "linux": {
                "url": "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64",
                "sha256": "754c6e6a7ef92b00ef73b8b0bb1d76d651e04d26aa6c6625e272201afa889f8b",
            },
            "windows": {
                "url": "https://github.com/mikefarah/yq/releases/download/2.4.1/yq_windows_amd64.exe",
                "sha256": "bdfd2a00bab3d8171edf57aaf4e9a2f7d0395e7a36d42b07f0e35503c00292a3",
            },
        },
    ),
)
