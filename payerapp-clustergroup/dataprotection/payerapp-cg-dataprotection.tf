resource "tanzu-mission-control_enable_data_protection" "cgdemo" {
  scope {
    cluster_group {
      cluster_group_name            = var.cluster_group
    }
  }

  spec {
    disable_restic                       = false
    enable_csi_snapshots                 = false
    enable_all_api_group_versions_backup = false

    selector {
        labelselector {
            matchexpressions {
                key      = ""
                operator = ""
                values   = []
            }
        }
    }
  }

  deletion_policy {
    delete_backups = false
    force = true
  }
}