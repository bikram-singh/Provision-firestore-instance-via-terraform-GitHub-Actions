# Project information
output "project_id" {
  description = "The GCP project ID"
  value       = var.project_id
}

output "region" {
  description = "The region"
  value       = var.region
}

# App Engine information
output "app_engine_application_id" {
  description = "The App Engine application ID"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ?
                google_app_engine_application.app[0].app_id : null
}

output "app_engine_location" {
  description = "The App Engine application region"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ?
                google_app_engine_application.app[0].location_id : null
}

output "app_engine_url_dispatch" {
  description = "App Engine URL dispatch rule"
  value       = var.create_app_engine && length(google_app_engine_application.app) > 0 ?
                google_app_engine_application.app[0].url_dispatch_rule : null
}

# Firestore database information
output "firestore_database_name" {
  description = "Name of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].name : var.database_name
}

output "firestore_database_location" {
  description = "The location of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].location_id : var.database_location
}

output "firestore_database_type" {
  description = "The Firestore database type"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].type : var.database_type
}

output "firestore_database_uid" {
  description = "Firestore database unique ID"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].uid : null
}

output "firestore_database_create_time" {
  description = "Creation time of the database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].create_time : null
}

output "firestore_database_update_time" {
  description = "Last update time of the database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].update_time : null
}

output "firestore_database_earliest_version_time" {
  description = "Earliest version time of the Firestore DB"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].earliest_version_time : null
}

output "firestore_database_version_retention_period" {
  description = "Version retention period"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].version_retention_period : null
}

output "firestore_database_etag" {
  description = "ETag of the Firestore database"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].etag : null
}

output "firestore_database_key_prefix" {
  description = "Database key prefix"
  value       = var.create_firestore_database && length(google_firestore_database.database) > 0 ?
                google_firestore_database.database[0].key_prefix : null
}

# Firestore indexes
output "firestore_indexes_created" {
  description = "List of created Firestore indexes"
  value       = var.create_sample_indexes ? [
                  google_firestore_index.user_status_index[*].id,
                  google_firestore_index.order_timestamp_index[*].id
                ] : []
}

# Connection info for SDK
output "firestore_connection_info" {
  description = "Connection information for Firestore SDK"
  value = {
    project_id = var.project_id
    database   = var.database_name
    location   = var.database_location
    type       = var.database_type
    emulator_host = "localhost:8080"
  }
}

# SDK example config
output "firestore_sdk_config" {
  description = "Example SDK configuration"
  value = {
    javascript = {
      projectId = var.project_id
      database  = var.database_name
    }
    python = {
      import_code = "from google.cloud import firestore\nclient = firestore.Client(project=\"${var.project_id}\")"
    }
  }
}
