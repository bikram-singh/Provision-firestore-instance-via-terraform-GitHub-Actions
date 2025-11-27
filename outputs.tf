# Project Information
output "project_id" {
  description = "The GCP project ID"
  value       = var.project_id
}

output "region" {
  description = "The GCP region"
  value       = var.region
}

# App Engine Information
output "app_engine_application_id" {
  description = "The App Engine application ID"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ? google_app_engine_application.app[0].app_id : null
}

output "app_engine_location" {
  description = "The App Engine application location"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ? google_app_engine_application.app[0].location_id : null
}

output "app_engine_url_dispatch_rule" {
  description = "The App Engine URL dispatch rule"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ? google_app_engine_application.app[0].url_dispatch_rule : null
}

# Firestore Database Information
output "firestore_database_name" {
  description = "The name of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].name : var.database_name
}

output "firestore_database_location" {
  description = "The location of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].location_id : var.database_location
}

output "firestore_database_type" {
  description = "The type of Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].type : var.database_type
}

output "firestore_database_uid" {
  description = "The unique identifier of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].uid : null
}

output "firestore_database_create_time" {
  description = "The creation time of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].create_time : null
}

output "firestore_database_update_time" {
  description = "The last update time of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].update_time : null
}

output "firestore_database_earliest_version_time" {
  description = "The earliest version time of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].earliest_version_time : null
}

output "firestore_database_version_retention_period" {
  description = "The version retention period of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].version_retention_period : null
}

output "firestore_database_etag" {
  description = "The etag of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].etag : null
}

output "firestore_database_key_prefix" {
  description = "The key prefix of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].key_prefix : null
}

# Firestore Indexes Information
output "firestore_indexes_created" {
  description = "List of created Firestore indexes"
  value = var.create_sample_indexes ? [
    {
      name       = google_firestore_index.user_status_index[0].name
      collection = google_firestore_index.user_status_index[0].collection
      fields     = google_firestore_index.user_status_index[0].fields
    },
    {
      name       = google_firestore_index.order_timestamp_index[0].name
      collection = google_firestore_index.order_timestamp_index[0].collection
      fields     = google_firestore_index.order_timestamp_index[0].fields
    }
  ] : []
}

# Connection Information
output "firestore_connection_info" {
  description = "Firestore connection information"
  value = {
    project_id    = var.project_id
    database      = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].name : var.database_name
    location      = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].location_id : var.database_location
    type          = var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].type : var.database_type
    endpoint      = "https://firestore.googleapis.com/"
    emulator_host = "localhost:8080"
  }
}

# SDK Configuration Examples
output "firestore_sdk_config" {
  description = "Configuration examples for different SDKs"
  value = {
    javascript = {
      firebase_config = {
        projectId = var.project_id
      }
    }
    admin_sdk = {
      project_id  = var.project_id
      database_url = "https://${var.project_id}.firebaseio.com"
    }
    python = {
      client_init = <<EOF
from google.cloud import firestore
db = firestore.Client(project="${var.project_id}")
EOF
    }
    java = {
      client_init = <<EOF
FirestoreOptions options = FirestoreOptions.newBuilder()
    .setProjectId("${var.project_id}")
    .build();
Firestore db = options.getService();
EOF
    }
    go = {
      client_init = <<EOF
client, err := firestore.NewClient(ctx, "${var.project_id}")
EOF
    }
  }
}


# Monitoring and Logging
output "firestore_monitoring_info" {
  description = "Monitoring and logging information"
  value = {
    cloud_console_url = "https://console.cloud.google.com/firestore/databases/${var.create_firestore_database && length(google_firestore_database.database) > 0 ? google_firestore_database.database[0].name : var.database_name}/data?project=${var.project_id}"
    metrics_url       = "https://console.cloud.google.com/monitoring/dashboards/resource;type=cloud_firestore_database;resource.database_id=${var.database_name}?project=${var.project_id}"
    logs_url          = "https://console.cloud.google.com/logs/query;query=resource.type%3D%22firestore_database%22?project=${var.project_id}"
  }
}
