package datalake

import (
	"context"
	"github.com/Azure/azure-sdk-for-go/profiles/latest/datalake/analytics/mgmt/account"
	"github.com/cloudquery/cq-provider-azure/client"
	"github.com/cloudquery/cq-provider-azure/client/services"
	"github.com/cloudquery/cq-provider-azure/client/services/mocks"
	"github.com/cloudquery/faker/v3"
	"github.com/golang/mock/gomock"
	"testing"
)

func buildDatalakeAnalyticsAccounts(t *testing.T, ctrl *gomock.Controller) services.Services {
	ds := mocks.NewMockDataLakeAnalyticsAccountsClient(ctrl)

	faker.SetIgnoreInterface(true)

	dataLakeStoreAccountBasic := account.DataLakeAnalyticsAccountBasic{}
	if err := faker.FakeData(&dataLakeStoreAccountBasic); err != nil {
		t.Fatal(err)
	}
	id := client.FakeResourceGroup
	dataLakeStoreAccountBasic.ID = &id
	accounts := account.NewDataLakeAnalyticsAccountListResultPage(
		account.DataLakeAnalyticsAccountListResult{Value: &[]account.DataLakeAnalyticsAccountBasic{dataLakeStoreAccountBasic}},
		func(ctx context.Context, result account.DataLakeAnalyticsAccountListResult) (account.DataLakeAnalyticsAccountListResult, error) {
			return account.DataLakeAnalyticsAccountListResult{}, nil
		},
	)
	ds.EXPECT().List(gomock.Any(), gomock.Any(), gomock.Any(), gomock.Any(), gomock.Any(), gomock.Any(), gomock.Any()).Return(accounts, nil)

	dataLakeStoreAccount := account.DataLakeAnalyticsAccount{}
	if err := faker.FakeData(&dataLakeStoreAccount); err != nil {
		t.Fatal(err)
	}
	dataLakeStoreAccount.ID = &id

	ds.EXPECT().Get(gomock.Any(), gomock.Any(), gomock.Any()).Return(dataLakeStoreAccount, nil)

	return services.Services{
		DataLake: services.DataLakeClient{DataLakeAnalyticsAccounts: ds},
	}
}

func TestDatalakeAnalyticsAccounts(t *testing.T) {
	client.AzureMockTestHelper(t, DatalakeAnalyticsAccounts(), buildDatalakeAnalyticsAccounts, client.TestOptions{})
}
