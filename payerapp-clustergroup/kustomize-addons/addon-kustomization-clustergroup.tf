# Create Tanzu Mission Control kustomization with attached set as default value.
resource "tanzu-mission-control_kustomization" "create_cluster_group_kustomization" {
  name = var.kustomization_name # Required

  namespace_name = var.kustomization_namespace #Required

  scope {
    cluster_group {
      name = var.kustomization_clustergroup # Required
    }
  }

  meta {
    description = "Cluster-addons-kustomization"
    labels      = { "type" : "addon" }
  }

  spec {
    path             = var.kustomization_start_path # Required
    prune            = var.kustomization_prune
    interval         = var.kustomization_sync_interval # Default: 5m
    target_namespace = var.kustomization_namespace
    source {
      name      = var.git_repo_name      # Required
      namespace = var.git_repo_namespace # Required
    }
  }
}