use magento;
-- Check and Update order status to "canceled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('1000045638');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('1000045638');
-- job status, canceled,  complete
   UPDATE sales_order SET state = "complete", status = "complete" WHERE increment_id in ('1000045638');
   UPDATE sales_order_grid SET status = "complete" WHERE increment_id in ('1000045638');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('1000045638');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('1000045638');
/*    
    update sales_payment_transaction 
    set is_closed = 1
    where order_id=19525;
    */