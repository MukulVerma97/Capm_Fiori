using OrderMgmtService as service from '../../srv/ordermgmt-srv';
annotate service.Order with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
       
        },
        {
            $Type : 'UI.DataField',
            Value : customerName,
        },
        {
            $Type : 'UI.DataField',
            Value : storeName,
          
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
            Label : 'Net Price'
           
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
             Label : 'Created By'
        },
    ],
    UI.SelectionFields : [
        ID,
        customerName,
        storeName,
        CustomerMobile,
    ],
    UI.HeaderInfo : {
        TypeNamePlural : 'Orders',
        TypeName : 'Order',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
        TypeImageUrl : 'sap-icon://my-sales-order',
    },
    UI.DataPoint #storeName : {
        $Type : 'UI.DataPointType',
        Value : storeName,
        Title : 'Store Name',
    },
    UI.DataPoint #customerName : {
        $Type : 'UI.DataPointType',
        Value : customerName,
        Title : 'Customer Name',
    },
    UI.DataPoint #createdBy : {
        $Type : 'UI.DataPointType',
        Value : createdBy,
        Title : 'Created By',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeName',
            Target : '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'customerName',
            Target : '@UI.DataPoint#customerName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'createdBy',
            Target : '@UI.DataPoint#createdBy',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order details',
            ID : 'Orderdetails',
            Target : '@UI.FieldGroup#Orderdetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Items',
            ID : 'OrderItems',
            Target : 'items/@UI.LineItem#OrderItems',
        },
    ],
    UI.FieldGroup #Orderdetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerMobile,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
     
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
        ],
    },
);

annotate service.Order with {
    ID @(
        Common.Label : 'ID',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Order',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'customerName',
                },
            ],
            Label : 'orders',
        },
        Common.ValueListWithFixedValues : false,
    );
    customerName @Common.Label : 'Custome Name';
     storeName @Common.Label : 'Store Name';
     
    CustomerMobile @Common.Label : 'Customer Mobile';
    netPrice @Common.Label : 'Net Price';
};



annotate service.OrderItems with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : order.items.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.order_ID,
            Label : 'Order Id',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.product_ID,
            Label : 'Product ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.unitPrice,
            Label : 'UnitPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : order.items.totalPrice,
            Label : 'Total Price',
        },
    ]
);

annotate service.OrderItems with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'stock',
                },
            ],
            Label : 'productsentit',
        },
        Common.ValueListWithFixedValues : false,

     
)}

annotate service.Products with{
       price @Common.Label : 'Price';
     discount @Common.Label : 'Discount';
     stock @Common.Label : 'Stock';
     description @Common.Label : 'Description';
     name @Common.Label : 'Name';
};

annotate service.OrderItems with {
    order @Common.FieldControl : #ReadOnly
};

