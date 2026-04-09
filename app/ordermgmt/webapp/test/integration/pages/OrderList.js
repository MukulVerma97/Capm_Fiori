sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.order.managment.ordermgmt',
            componentId: 'OrderList',
            contextPath: '/Order'
        },
        CustomPageDefinitions
    );
});