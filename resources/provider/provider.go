package provider

import (
	"github.com/cloudquery/cq-provider-azure/client"
	"github.com/cloudquery/cq-provider-azure/resources/services/ad"
	"github.com/cloudquery/cq-provider-azure/resources/services/authorization"
	"github.com/cloudquery/cq-provider-azure/resources/services/compute"
	"github.com/cloudquery/cq-provider-azure/resources/services/container"
	"github.com/cloudquery/cq-provider-azure/resources/services/keyvault"
	"github.com/cloudquery/cq-provider-azure/resources/services/monitor"
	"github.com/cloudquery/cq-provider-azure/resources/services/mysql"
	"github.com/cloudquery/cq-provider-azure/resources/services/network"
	"github.com/cloudquery/cq-provider-azure/resources/services/postgresql"
	resources2 "github.com/cloudquery/cq-provider-azure/resources/services/resources"
	"github.com/cloudquery/cq-provider-azure/resources/services/security"
	"github.com/cloudquery/cq-provider-azure/resources/services/sql"
	"github.com/cloudquery/cq-provider-azure/resources/services/storage"
	"github.com/cloudquery/cq-provider-azure/resources/services/subscription"
	"github.com/cloudquery/cq-provider-azure/resources/services/web"
	"github.com/cloudquery/cq-provider-sdk/provider"
	"github.com/cloudquery/cq-provider-sdk/provider/schema"
)

var (
	Version = "Development"
)

func Provider() *provider.Provider {
	return &provider.Provider{
		Version:   Version,
		Name:      "azure",
		Configure: client.Configure,
		ResourceMap: map[string]*schema.Table{
			"ad.applications":                     ad.Applications(),
			"ad.groups":                           ad.Groups(),
			"ad.service_principals":               ad.ServicePrincipals(),
			"ad.users":                            ad.Users(),
			"authorization.role_assignments":      authorization.AuthorizationRoleAssignments(),
			"authorization.role_definitions":      authorization.AuthorizationRoleDefinitions(),
			"compute.disks":                       compute.ComputeDisks(),
			"compute.virtual_machines":            compute.ComputeVirtualMachines(),
			"container.managed_clusters":          container.ContainerManagedClusters(),
			"keyvault.vaults":                     keyvault.KeyvaultVaults(),
			"monitor.log_profiles":                monitor.MonitorLogProfiles(),
			"monitor.diagnostic_settings":         monitor.MonitorDiagnosticSettings(),
			"monitor.activity_logs":               monitor.MonitorActivityLogs(),
			"monitor.activity_log_alerts":         monitor.MonitorActivityLogAlerts(),
			"mysql.servers":                       mysql.MySQLServers(),
			"network.virtual_networks":            network.NetworkVirtualNetworks(),
			"network.security_groups":             network.NetworkSecurityGroups(),
			"network.public_ip_addresses":         network.NetworkPublicIPAddresses(),
			"network.watchers":                    network.NetworkWatchers(),
			"postgresql.servers":                  postgresql.PostgresqlServers(),
			"resources.groups":                    resources2.ResourcesGroups(),
			"resources.policy_assignments":        resources2.ResourcesPolicyAssignments(),
			"security.auto_provisioning_settings": security.SecurityAutoProvisioningSettings(),
			"security.contacts":                   security.SecurityContacts(),
			"security.pricings":                   security.SecurityPricings(),
			"security.settings":                   security.SecuritySettings(),
			"sql.servers":                         sql.SQLServers(),
			"storage.accounts":                    storage.StorageAccounts(),
			"subscription.subscriptions":          subscription.SubscriptionSubscriptions(),
			"web.apps":                            web.WebApps(),
		},
		Config: func() provider.Config {
			return &client.Config{}
		},
	}
}
