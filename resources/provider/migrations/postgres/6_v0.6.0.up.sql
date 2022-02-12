ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "windows_configuration_patch_settings_assessment_mode" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "linux_configuration_patch_settings_assessment_mode" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "network_profile_network_api_version" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "network_profile_network_interface_configurations" jsonb;
ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "scheduled_events_profile" jsonb;
ALTER TABLE IF EXISTS azure_compute_virtual_machines
    ADD COLUMN "user_data" text;


ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    DROP COLUMN "virtual_machine_extension_properties";
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "force_update_tag" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "publisher" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "type_handler_version" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "auto_upgrade_minor_version" boolean;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "enable_automatic_upgrade" boolean;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "settings" jsonb;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "protected_settings" jsonb;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "provisioning_state" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "extension_type" text;
ALTER TABLE IF EXISTS azure_compute_virtual_machine_resources
    ADD COLUMN "instance_view" jsonb;

--it was duplicated as a json column of virtual machine
DROP TABLE IF EXISTS "azure_compute_virtual_machine_network_interfaces";

-- Resource: security.jit_network_access_policies
CREATE TABLE IF NOT EXISTS "azure_security_jit_network_access_policies"
(
    "cq_id"              uuid NOT NULL,
    "cq_meta"            jsonb,
    "subscription_id"    text,
    "id"                 text,
    "name"               text,
    "type"               text,
    "kind"               text,
    "location"           text,
    "provisioning_state" text,
    CONSTRAINT azure_security_jit_network_access_policies_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_security_jit_network_access_policy_virtual_machines"
(
    "cq_id"                           uuid NOT NULL,
    "cq_meta"                         jsonb,
    "jit_network_access_policy_cq_id" uuid,
    "id"                              text,
    "ports"                           jsonb,
    "public_ip_address"               inet,
    CONSTRAINT azure_security_jit_network_access_policy_virtual_machines_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (jit_network_access_policy_cq_id) REFERENCES azure_security_jit_network_access_policies (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_security_jit_network_access_policy_requests"
(
    "cq_id"                           uuid NOT NULL,
    "cq_meta"                         jsonb,
    "jit_network_access_policy_cq_id" uuid,
    "virtual_machines"                text[],
    "start_time_utc"                  timestamp without time zone,
    "requestor"                       text,
    "justification"                   text,
    CONSTRAINT azure_security_jit_network_access_policy_requests_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (jit_network_access_policy_cq_id) REFERENCES azure_security_jit_network_access_policies (cq_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS "azure_compute_virtual_machine_network_interfaces";

CREATE TABLE IF NOT EXISTS "azure_resources_links" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"id" text,
	"name" text,
	"type" text,
	"source_id" text,
	"target_id" text,
	"notes" text,
	CONSTRAINT azure_resources_links_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);



-- Resource: sql.managed_instances
CREATE TABLE IF NOT EXISTS "azure_sql_managed_instances"
(
    "cq_id"                        uuid NOT NULL,
    "cq_meta"                      jsonb,
    "subscription_id"              text,
    "identity_principal_id"        uuid,
    "identity_type"                text,
    "identity_tenant_id"           uuid,
    "sku_name"                     text,
    "sku_tier"                     text,
    "sku_size"                     text,
    "sku_family"                   text,
    "sku_capacity"                 integer,
    "provisioning_state"           text,
    "managed_instance_create_mode" text,
    "fully_qualified_domain_name"  text,
    "administrator_login"          text,
    "administrator_login_password" text,
    "subnet_id"                    text,
    "state"                        text,
    "license_type"                 text,
    "v_cores"                      integer,
    "storage_size_in_gb"           integer,
    "collation"                    text,
    "dns_zone"                     text,
    "dns_zone_partner"             text,
    "public_data_endpoint_enabled" boolean,
    "source_managed_instance_id"   text,
    "restore_point_in_time"        timestamp without time zone,
    "proxy_override"               text,
    "timezone_id"                  text,
    "instance_pool_id"             text,
    "maintenance_configuration_id" text,
    "minimal_tls_version"          text,
    "storage_account_type"         text,
    "zone_redundant"               boolean,
    "location"                     text,
    "tags"                         jsonb,
    "id"                           text,
    "name"                         text,
    "type"                         text,
    CONSTRAINT azure_sql_managed_instances_pk PRIMARY KEY (subscription_id, id),
    UNIQUE (cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_databases"
(
    "cq_id"                                  uuid NOT NULL,
    "cq_meta"                                jsonb,
    "collation"                              text,
    "status"                                 text,
    "creation_date_time"                     timestamp without time zone,
    "earliest_restore_point_time"            timestamp without time zone,
    "restore_point_in_time"                  timestamp without time zone,
    "default_secondary_location"             text,
    "catalog_collation"                      text,
    "create_mode"                            text,
    "storage_container_uri"                  text,
    "source_database_id"                     text,
    "restorable_dropped_database_id"         text,
    "storage_container_sas_token"            text,
    "failover_group_id"                      text,
    "recoverable_database_id"                text,
    "long_term_retention_backup_resource_id" text,
    "auto_complete_restore"                  boolean,
    "last_backup_name"                       text,
    "location"                               text,
    "tags"                                   jsonb,
    "id"                                     text,
    "name"                                   text,
    "type"                                   text,
    CONSTRAINT azure_sql_managed_databases_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_database_vulnerability_assessments"
(
    "cq_id"                                     uuid NOT NULL,
    "cq_meta"                                   jsonb,
    "managed_database_cq_id"                    uuid,
    "storage_container_path"                    text,
    "storage_container_sas_key"                 text,
    "storage_account_access_key"                text,
    "recurring_scans_is_enabled"                boolean,
    "recurring_scans_email_subscription_admins" boolean,
    "recurring_scans_emails"                    text[],
    "id"                                        text,
    "name"                                      text,
    "type"                                      text,
    CONSTRAINT azure_sql_managed_database_vulnerability_assessments_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (managed_database_cq_id) REFERENCES azure_sql_managed_databases (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_database_vulnerability_assessment_scans"
(
    "cq_id"                            uuid NOT NULL,
    "cq_meta"                          jsonb,
    "managed_database_cq_id"           uuid,
    "scan_id"                          text,
    "trigger_type"                     text,
    "state"                            text,
    "start_time"                       timestamp without time zone,
    "end_time"                         timestamp without time zone,
    "errors"                           jsonb,
    "storage_container_path"           text,
    "number_of_failed_security_checks" integer,
    "id"                               text,
    "name"                             text,
    "type"                             text,
    CONSTRAINT azure_sql_managed_database_vulnerability_assessment_scans_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (managed_database_cq_id) REFERENCES azure_sql_managed_databases (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_instance_private_endpoint_connections"
(
    "cq_id"                                                  uuid NOT NULL,
    "cq_meta"                                                jsonb,
    "managed_instance_cq_id"                                 uuid,
    "id"                                                     text,
    "private_endpoint_id"                                    text,
    "private_link_service_connection_state_status"           text,
    "private_link_service_connection_state_description"      text,
    "private_link_service_connection_state_actions_required" text,
    "provisioning_state"                                     text,
    CONSTRAINT azure_sql_managed_instance_private_endpoint_connections_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (managed_instance_cq_id) REFERENCES azure_sql_managed_instances (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_instance_vulnerability_assessments"
(
    "cq_id"                                     uuid NOT NULL,
    "cq_meta"                                   jsonb,
    "managed_instance_cq_id"                    uuid,
    "storage_container_path"                    text,
    "storage_container_sas_key"                 text,
    "storage_account_access_key"                text,
    "recurring_scans_is_enabled"                boolean,
    "recurring_scans_email_subscription_admins" boolean,
    "recurring_scans_emails"                    text[],
    "id"                                        text,
    "name"                                      text,
    "type"                                      text,
    CONSTRAINT azure_sql_managed_instance_vulnerability_assessments_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (managed_instance_cq_id) REFERENCES azure_sql_managed_instances (cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_sql_managed_instance_encryption_protectors"
(
    "cq_id"                  uuid NOT NULL,
    "cq_meta"                jsonb,
    "managed_instance_cq_id" uuid,
    "kind"                   text,
    "server_key_name"        text,
    "server_key_type"        text,
    "uri"                    text,
    "thumbprint"             text,
    "id"                     text,
    "name"                   text,
    "type"                   text,
    CONSTRAINT azure_sql_managed_instance_encryption_protectors_pk PRIMARY KEY (cq_id),
    UNIQUE (cq_id),
    FOREIGN KEY (managed_instance_cq_id) REFERENCES azure_sql_managed_instances (cq_id) ON DELETE CASCADE
);

