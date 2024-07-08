terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "tanzu-mission-control" {
}

resource "tanzu-mission-control_akscluster" "demo_AKS_cluster" {
  credential_name = var.credential_name
  subscription_id = var.azure_subscription_id
  resource_group  = var.resource_group
  name            = var.aks_clustername
  meta {
    description = "aks test cluster"
    labels      = { "key1" : "value1" }
  }
  spec {
    config {
      location           = "eastus"
      kubernetes_version = "1.25.11"
      network_config {
        dns_prefix = "dns-tf-test"
      }
    }
    nodepool {
      name = "systemnp"
      spec {
        count   = 1
        mode    = "SYSTEM"
        vm_size = "Standard_DS2_v2"
      }
    }
  }
}