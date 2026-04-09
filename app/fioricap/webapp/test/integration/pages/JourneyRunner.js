sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/app/listreport/fioricap/test/integration/pages/ProductsList",
	"com/app/listreport/fioricap/test/integration/pages/ProductsObjectPage"
], function (JourneyRunner, ProductsList, ProductsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/app/listreport/fioricap') + '/test/flp.html#app-preview',
        pages: {
			onTheProductsList: ProductsList,
			onTheProductsObjectPage: ProductsObjectPage
        },
        async: true
    });

    return runner;
});

