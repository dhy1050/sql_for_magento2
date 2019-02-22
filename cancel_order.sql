use maggylondon;
-- Check and Update order status to "cancled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('1000036732');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('1000036732');
	
#    UPDATE sales_order SET state = "canceled", status = "complete" WHERE increment_id in ('7000032526');
#	UPDATE sales_order_grid SET status = "canceled" WHERE increment_id in ('7000032526');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('7000032526');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000032526');
    
/*    
    update sales_payment_transaction 
    set is_closed = 1
    where order_id=19525;
*/