use maggylondon;
-- Check and Update order status to "canceled" or "complete" or "processing"in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('7000056043');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000056043');
	
    UPDATE sales_order SET state = "cancled", status = "cancled" WHERE increment_id in ('7000056043');
	UPDATE sales_order_grid SET status = "cancled" WHERE increment_id in ('7000056043');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('7000055321');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000055321');
    
/*    
    update sales_payment_transaction 
    set is_closed = 1
    where order_id=19525;
*/