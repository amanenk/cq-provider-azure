package client

// Provider Configuration

type Config struct {
	Subscriptions []string `hcl:"subscriptions,optional"`
}

func (c Config) Example() string {
	return `configuration {
		//  Optional. if you not specified, cloudquery tries to access all subscriptions available to tenant
		//  subscriptions = ["<YOU_SUBSCRIPTION_ID_HERE>"]
}`
}
