sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.order.managment.ordermgmt',
            componentId: 'OrderItemsObjectPage',
            contextPath: '/Order/items'
        },
        CustomPageDefinitions
    );
});