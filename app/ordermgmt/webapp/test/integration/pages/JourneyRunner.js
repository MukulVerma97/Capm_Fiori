sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/order/managment/ordermgmt/test/integration/pages/OrderList",
	"com/order/managment/ordermgmt/test/integration/pages/OrderObjectPage",
	"com/order/managment/ordermgmt/test/integration/pages/OrderItemsObjectPage"
], function (JourneyRunner, OrderList, OrderObjectPage, OrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/order/managment/ordermgmt') + '/test/flp.html#app-preview',
        pages: {
			onTheOrderList: OrderList,
			onTheOrderObjectPage: OrderObjectPage,
			onTheOrderItemsObjectPage: OrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

