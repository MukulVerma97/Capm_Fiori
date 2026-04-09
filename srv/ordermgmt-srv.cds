using { strange.db as db } from '../db/schema';

service OrderMgmtService {

    @odata.draft.enabled
    entity Order as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;
    entity Products as projection on db.Products;

}

