use magento;
-- Check and Update order status to "cancled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('7000028556');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000028556');
	
--    UPDATE sales_order SET state = "complete", status = "complete" WHERE increment_id in ('7000028556');
--    UPDATE sales_order_grid SET status = "complete" WHERE increment_id in ('7000028556');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('7000028556');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000028556');
/*    
    update sales_payment_transaction 
    set is_closed = 1
    where order_id=19525;
    */