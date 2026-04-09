namespace strange.db;


using {cuid,managed} from'@sap/cds/common';

entity Products :cuid{
    
    name:String(50) @mandatory; 
    description: String(100);
    price: Decimal(9,2) @mandatory; 
    discount: Integer @mandatory @assert.format : '^(?:[5-9]|[1-6][0-9]|70)$'; 
    stock:Integer;
    image: LargeBinary @Core.MediaType: 'image/jpeg'
}

entity Orders : cuid,managed {
    customerName : String(30);
    CustomerMobile : String(10);
    storeName : String(20);
    netPrice : Decimal(9,2);
    items: Composition of many OrderItems on items.order=$self // Navigation property help to get other depended propery(Unmanaged )
   //items: Association to many OrderItems on items.orderID = ID

}

entity OrderItems : cuid {
    order : Association to Orders; //managed assocation, there will be no new orderID will create and navigation field and becomes order_Id and takes order_id from Orders tabel
   product : Association to Products;
   quantity :Integer;
   unitPrice : Decimal(9,2);
   discount : Integer;
   totalPrice : Decimal(9,2)

    
}