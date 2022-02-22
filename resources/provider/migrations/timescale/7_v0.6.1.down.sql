-- Autogenerated by migration tool on 2022-02-16 09:54:48
-- CHANGEME: Verify or edit this file before proceeding

-- Resource: cosmosdb.accounts
DROP TABLE IF EXISTS azure_cosmosdb_account_write_locations;
DROP TABLE IF EXISTS azure_cosmosdb_account_read_locations;
DROP TABLE IF EXISTS azure_cosmosdb_account_locations;
DROP TABLE IF EXISTS azure_cosmosdb_account_failover_policies;
DROP TABLE IF EXISTS azure_cosmosdb_account_private_endpoint_connections;
DROP TABLE IF EXISTS azure_cosmosdb_account_cors;
DROP TABLE IF EXISTS azure_cosmosdb_accounts;

-- Resource: cosmosdb.mongodb_databases
DROP TABLE IF EXISTS azure_cosmosdb_mongodb_databases;

-- Resource: cosmosdb.sql_databases
DROP TABLE IF EXISTS azure_cosmosdb_sql_databases;

-- Resource: eventhub.namespaces
DROP TABLE IF EXISTS azure_eventhub_namespace_encryption_key_vault_properties;
DROP TABLE IF EXISTS azure_eventhub_namespaces;

-- Resource: sql.managed_instances
DROP TABLE IF EXISTS azure_sql_managed_database_vulnerability_assessments;
DROP TABLE IF EXISTS azure_sql_managed_database_vulnerability_assessment_scans;
DROP TABLE IF EXISTS azure_sql_managed_databases;
DROP TABLE IF EXISTS azure_sql_managed_instance_private_endpoint_connections;
DROP TABLE IF EXISTS azure_sql_managed_instance_vulnerability_assessments;
DROP TABLE IF EXISTS azure_sql_managed_instance_encryption_protectors;
DROP TABLE IF EXISTS azure_sql_managed_instances;

-- Resource: compute.virtual_machine_scale_sets
DROP TABLE IF EXISTS azure_compute_virtual_machine_scale_set_os_profile_secrets;
DROP TABLE IF EXISTS azure_compute_virtual_machine_scale_set_extensions;
DROP TABLE IF EXISTS azure_compute_virtual_machine_scale_sets;

-- Resource: datalake.analytics_accounts
DROP TABLE IF EXISTS azure_datalake_analytics_account_data_lake_store_accounts;
DROP TABLE IF EXISTS azure_datalake_analytics_account_storage_accounts;
DROP TABLE IF EXISTS azure_datalake_analytics_account_compute_policies;
DROP TABLE IF EXISTS azure_datalake_analytics_account_firewall_rules;
DROP TABLE IF EXISTS azure_datalake_analytics_accounts;

-- Resource: datalake.storage_accounts
DROP TABLE IF EXISTS azure_datalake_storage_account_firewall_rules;
DROP TABLE IF EXISTS azure_datalake_storage_account_virtual_network_rules;
DROP TABLE IF EXISTS azure_datalake_storage_account_trusted_id_providers;
DROP TABLE IF EXISTS azure_datalake_storage_accounts;


-- Resource: sql.servers
DROP TABLE IF EXISTS azure_sql_database_db_vulnerability_assessment_scans;

-- Resource: mariadb.servers
DROP TABLE IF EXISTS azure_mariadb_server_private_endpoint_connections;
DROP TABLE IF EXISTS azure_mariadb_server_configurations;
DROP TABLE IF EXISTS azure_mariadb_servers;

-- Resource: container.registies
DROP TABLE IF EXISTS azure_container_registry_network_rule_set_virtual_network_rules;
DROP TABLE IF EXISTS azure_container_registry_network_rule_set_ip_rules;
DROP TABLE IF EXISTS azure_container_registry_replications;
DROP TABLE IF EXISTS azure_container_registries;

