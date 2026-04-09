using { strange.db as db } from '../db/schema';


service ProductsMgmtService {

@odata.draft.enabled
entity Products as projection on db.Products{
    *,
    case 
     when stock =0
     then 'Out of Stock'
     when stock <20
     then 'Low Stock'
    else 'IN Stock'

    end as status : String(20),

     case 
     when stock =0
     then '1'
     when stock <20
     then '2'
    else '3'

    end as statusCrticality :String  // it should be string only other will get error
}

entity Orders as projection on db.Orders; 
entity OrderItems as projection on db.OrderItems;
    

}