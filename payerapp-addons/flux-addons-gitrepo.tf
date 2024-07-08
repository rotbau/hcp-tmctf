# Create Tanzu Mission Control git repository with attached set as default value.
resource "tanzu-mission-control_git_repository" "create_cluster_group_git_repository" {
  name = var.git_repo_name # Required

  namespace_name = var.git_repo_namespace #Required

  scope {
    cluster_group {
      name = var.git_cluster_group # Required
    }
  }

  meta {
    description = "Git repository for cluster addons"
    labels      = { "type" : "addons" }
  }

  spec {
    url                = var.git_url # Required
    secret_ref         = var.git_secret_ref
    interval           = var.git_sync_interval    # Default: 5m
    git_implementation = "GO_GIT" # Default: GO_GIT
    ref {
      branch = var.git_branch
#      tag    = "testTag"
#      semver = "testSemver"
#      commit = "testCommit"
    }
  }
}