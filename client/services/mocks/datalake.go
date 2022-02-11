// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/cloudquery/cq-provider-azure/client/services (interfaces: DataLakeStorageAccountsClient)

// Package mocks is a generated GoMock package.
package mocks

import (
	context "context"
	reflect "reflect"

	account "github.com/Azure/azure-sdk-for-go/services/datalake/store/mgmt/2016-11-01/account"
	gomock "github.com/golang/mock/gomock"
)

// MockDataLakeStorageAccountsClient is a mock of DataLakeStorageAccountsClient interface.
type MockDataLakeStorageAccountsClient struct {
	ctrl     *gomock.Controller
	recorder *MockDataLakeStorageAccountsClientMockRecorder
}

// MockDataLakeStorageAccountsClientMockRecorder is the mock recorder for MockDataLakeStorageAccountsClient.
type MockDataLakeStorageAccountsClientMockRecorder struct {
	mock *MockDataLakeStorageAccountsClient
}

// NewMockDataLakeStorageAccountsClient creates a new mock instance.
func NewMockDataLakeStorageAccountsClient(ctrl *gomock.Controller) *MockDataLakeStorageAccountsClient {
	mock := &MockDataLakeStorageAccountsClient{ctrl: ctrl}
	mock.recorder = &MockDataLakeStorageAccountsClientMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockDataLakeStorageAccountsClient) EXPECT() *MockDataLakeStorageAccountsClientMockRecorder {
	return m.recorder
}

// Get mocks base method.
func (m *MockDataLakeStorageAccountsClient) Get(arg0 context.Context, arg1, arg2 string) (account.DataLakeStoreAccount, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "Get", arg0, arg1, arg2)
	ret0, _ := ret[0].(account.DataLakeStoreAccount)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// Get indicates an expected call of Get.
func (mr *MockDataLakeStorageAccountsClientMockRecorder) Get(arg0, arg1, arg2 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "Get", reflect.TypeOf((*MockDataLakeStorageAccountsClient)(nil).Get), arg0, arg1, arg2)
}

// List mocks base method.
func (m *MockDataLakeStorageAccountsClient) List(arg0 context.Context, arg1 string, arg2, arg3 *int32, arg4, arg5 string, arg6 *bool) (account.DataLakeStoreAccountListResultPage, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "List", arg0, arg1, arg2, arg3, arg4, arg5, arg6)
	ret0, _ := ret[0].(account.DataLakeStoreAccountListResultPage)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// List indicates an expected call of List.
func (mr *MockDataLakeStorageAccountsClientMockRecorder) List(arg0, arg1, arg2, arg3, arg4, arg5, arg6 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "List", reflect.TypeOf((*MockDataLakeStorageAccountsClient)(nil).List), arg0, arg1, arg2, arg3, arg4, arg5, arg6)
}
