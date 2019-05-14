use magento;
-- Check and Update order status to "canceled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('1000041287');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('1000041287');
	
   UPDATE sales_order SET state = "canceled", status = "canceled" WHERE increment_id in ('1000041287');
   UPDATE sales_order_grid SET status = "canceled" WHERE increment_id in ('1000041287');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('1000041287');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('1000041287');
/*    
    update sales_payment_transaction 
    set is_closed = 1
    where order_id=19525;
    */