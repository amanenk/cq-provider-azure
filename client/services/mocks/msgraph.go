// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/cloudquery/cq-provider-azure/client/services (interfaces: GraphClient)

// Package mocks is a generated GoMock package.
package mocks

import (
	reflect "reflect"

	gomock "github.com/golang/mock/gomock"
	msgraph "github.com/open-networks/go-msgraph"
)

// MockGraphClient is a mock of GraphClient interface.
type MockGraphClient struct {
	ctrl     *gomock.Controller
	recorder *MockGraphClientMockRecorder
}

// MockGraphClientMockRecorder is the mock recorder for MockGraphClient.
type MockGraphClientMockRecorder struct {
	mock *MockGraphClient
}

// NewMockGraphClient creates a new mock instance.
func NewMockGraphClient(ctrl *gomock.Controller) *MockGraphClient {
	mock := &MockGraphClient{ctrl: ctrl}
	mock.recorder = &MockGraphClientMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockGraphClient) EXPECT() *MockGraphClientMockRecorder {
	return m.recorder
}

// ListGroups mocks base method.
func (m *MockGraphClient) ListGroups(arg0 ...msgraph.ListQueryOption) (msgraph.Groups, error) {
	m.ctrl.T.Helper()
	varargs := []interface{}{}
	for _, a := range arg0 {
		varargs = append(varargs, a)
	}
	ret := m.ctrl.Call(m, "ListGroups", varargs...)
	ret0, _ := ret[0].(msgraph.Groups)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListGroups indicates an expected call of ListGroups.
func (mr *MockGraphClientMockRecorder) ListGroups(arg0 ...interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListGroups", reflect.TypeOf((*MockGraphClient)(nil).ListGroups), arg0...)
}
