-- Check and Update order status to "cancled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('7000022427');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000022427');
	
	UPDATE sales_order SET state = "canceled", status = "canceled" WHERE increment_id in ('7000022427');
	UPDATE sales_order_grid SET status = "canceled" WHERE increment_id in ('7000022427');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('7000022427');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000022427');