service          = "azure"
output_directory = "."
add_generate     = true

description_modifier "remove_read_only" {
  words = ["READ-ONLY; "]
}

description_modifier "remove_field_name" {
  regex = ".+- "
}

resource "azure" "servicebus" "namespaces" {
  path = "github.com/Azure/azure-sdk-for-go/services/preview/servicebus/mgmt/2021-06-01-preview/servicebus.SBNamespace"

  userDefinedColumn "subscription_id" {
    type        = "string"
    description = "Azure subscription id"
    resolver "resolveAzureSubscription" {
      path = "github.com/cloudquery/cq-provider-azure/client.ResolveAzureSubscription"
    }
  }

  multiplex "AzureSubscription" {
    path = "github.com/cloudquery/cq-provider-azure/client.SubscriptionMultiplex"
  }
  deleteFilter "AzureSubscription" {
    path = "github.com/cloudquery/cq-provider-azure/client.DeleteSubscriptionFilter"
  }

  options {
    primary_keys = ["subscription_id", "id"]
  }

  column "s_b_namespace_properties" {
    skip_prefix = true
  }

  column "system_data" {
    type = "json"
  }

  column "encryption" {
    skip_prefix = true
  }

  column "key_vault_properties" {
    type = "json"
  }


  relation "azure" "servicebus" "private_endpoint_connections" {
    column "private_endpoint_connection_properties" {
      skip_prefix = true
    }

    column "private_link_service_connection_state" {
      skip_prefix = true
    }

    column "description" {
      rename = "status_description"
    }

  }

  user_relation "azure" "servicebus" "topics" {
    path = "github.com/Azure/azure-sdk-for-go/services/preview/servicebus/mgmt/2021-06-01-preview/servicebus.SBTopic"

    column "s_b_topic_properties" {
      skip_prefix = true
    }

    //todo check if auto_delete_on_idle can be timestamp
  }
}
