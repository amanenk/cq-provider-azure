-- Autogenerated by migration tool on 2022-02-16 09:54:57
-- CHANGEME: Verify or edit this file before proceeding

-- Resource: cosmosdb.accounts
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_accounts"
(
    "cq_id"                                        uuid NOT NULL,
    "cq_meta"                                      jsonb,
    "subscription_id"                              text,
    "provisioning_state"                           text,
    "document_endpoint"                            text,
    "database_account_offer_type"                  text,
    "ip_rules"                                     text[],
    "capabilities"                                 text[],
    "is_virtual_network_filter_enabled"            boolean,
    "enable_automatic_failover"                    boolean,
    "consistency_policy_default_consistency_level" text,
    "consistency_policy_max_staleness_prefix"      bigint,
    "consistency_policy_max_interval_in_seconds"   integer,
    "virtual_network_rules"                        jsonb,
    "enable_multiple_write_locations"              boolean,
    "enable_cassandra_connector"                   boolean,
    "connector_offer"                              text,
    "disable_key_based_metadata_write_access"      boolean,
    "key_vault_key_uri"                            text,
    "public_network_access"                        text,
    "enable_free_tier"                             boolean,
    "api_properties_server_version"                text,
    "enable_analytical_storage"                    boolean,
    "id"                                           text,
    "name"                                         text,
    "type"                                         text,
    "location"                                     text,
    "tags"                                         jsonb,
    CONSTRAINT azure_cosmosdb_accounts_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_write_locations"
(
    "cq_id"              uuid NOT NULL,
    "cq_meta"            jsonb,
    "account_cq_id"      uuid,
    "id"                 text,
    "location_name"      text,
    "document_endpoint"  text,
    "provisioning_state" text,
    "failover_priority"  integer,
    "is_zone_redundant"  boolean,
    CONSTRAINT azure_cosmosdb_account_write_locations_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_read_locations"
(
    "cq_id"              uuid NOT NULL,
    "cq_meta"            jsonb,
    "account_cq_id"      uuid,
    "id"                 text,
    "location_name"      text,
    "document_endpoint"  text,
    "provisioning_state" text,
    "failover_priority"  integer,
    "is_zone_redundant"  boolean,
    CONSTRAINT azure_cosmosdb_account_read_locations_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_locations"
(
    "cq_id"              uuid NOT NULL,
    "cq_meta"            jsonb,
    "account_cq_id"      uuid,
    "id"                 text,
    "location_name"      text,
    "document_endpoint"  text,
    "provisioning_state" text,
    "failover_priority"  integer,
    "is_zone_redundant"  boolean,
    CONSTRAINT azure_cosmosdb_account_locations_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_failover_policies"
(
    "cq_id"             uuid NOT NULL,
    "cq_meta"           jsonb,
    "account_cq_id"     uuid,
    "id"                text,
    "location_name"     text,
    "failover_priority" integer,
    CONSTRAINT azure_cosmosdb_account_failover_policies_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_private_endpoint_connections"
(
    "cq_id"               uuid NOT NULL,
    "cq_meta"             jsonb,
    "account_cq_id"       uuid,
    "private_endpoint_id" text,
    "status"              text,
    "actions_required"    text,
    "description"         text,
    "group_id"            text,
    "provisioning_state"  text,
    "id"                  text,
    "name"                text,
    "type"                text,
    CONSTRAINT azure_cosmosdb_account_private_endpoint_connections_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_account_cors"
(
    "cq_id"              uuid NOT NULL,
    "cq_meta"            jsonb,
    "account_cq_id"      uuid,
    "allowed_origins"    text,
    "allowed_methods"    text,
    "allowed_headers"    text,
    "exposed_headers"    text,
    "max_age_in_seconds" bigint,
    CONSTRAINT azure_cosmosdb_account_cors_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (account_cq_id) REFERENCES azure_cosmosdb_accounts (cq_id) ON DELETE CASCADE
);

-- Resource: cosmosdb.mongodb_databases
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_mongodb_databases"
(
    "cq_id"                             uuid NOT NULL,
    "cq_meta"                           jsonb,
    "subscription_id"                   text,
    "database_id"                       text,
    "database_rid"                      text,
    "database_ts"                       float,
    "database_etag"                     text,
    "throughput"                        integer,
    "autoscale_settings_max_throughput" integer,
    "id"                                text,
    "name"                              text,
    "type"                              text,
    "location"                          text,
    "tags"                              jsonb,
    CONSTRAINT azure_cosmosdb_mongodb_databases_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);

-- Resource: cosmosdb.sql_databases
CREATE TABLE IF NOT EXISTS "azure_cosmosdb_sql_databases"
(
    "cq_id"                                  uuid NOT NULL,
    "cq_meta"                                jsonb,
    "subscription_id"                        text,
    "database_id"                            text,
    "database_rid"                           text,
    "database_ts"                            float,
    "database_etag"                          text,
    "database_colls"                         text,
    "database_users"                         text,
    "sql_database_get_properties_throughput" integer,
    "autoscale_settings_max_throughput"      integer,
    "id"                                     text,
    "name"                                   text,
    "type"                                   text,
    "location"                               text,
    "tags"                                   jsonb,
    CONSTRAINT azure_cosmosdb_sql_databases_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);

-- Resource: eventhub.namespaces
CREATE TABLE IF NOT EXISTS "azure_eventhub_namespaces"
(
    "cq_id"                    uuid NOT NULL,
    "cq_meta"                  jsonb,
    "subscription_id"          text,
    "sku_name"                 text,
    "sku_tier"                 text,
    "sku_capacity"             integer,
    "identity_principal_id"    text,
    "identity_tenant_id"       text,
    "identity_type"            text,
    "provisioning_state"       text,
    "created_at_time"          timestamp without time zone,
    "updated_at_time"          timestamp without time zone,
    "service_bus_endpoint"     text,
    "cluster_arm_id"           text,
    "metric_id"                text,
    "is_auto_inflate_enabled"  boolean,
    "maximum_throughput_units" integer,
    "kafka_enabled"            boolean,
    "zone_redundant"           boolean,
    "encryption_key_source"    text,
    "location"                 text,
    "tags"                     jsonb,
    "id"                       text,
    "name"                     text,
    "type"                     text,
    CONSTRAINT azure_eventhub_namespaces_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_eventhub_namespace_encryption_key_vault_properties"
(
    "cq_id"           uuid NOT NULL,
    "cq_meta"         jsonb,
    "namespace_cq_id" uuid,
    "key_name"        text,
    "key_vault_uri"   text,
    "key_version"     text,
    CONSTRAINT azure_eventhub_namespace_encryption_key_vault_properties_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (namespace_cq_id) REFERENCES azure_eventhub_namespaces (cq_id) ON DELETE CASCADE
);
