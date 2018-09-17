

    -- inspect orders prior to updating, remove any
    -- that have already been captured
          SELECT  so.increment_id,
                  spt.*
            FROM  sales_order so
            JOIN  sales_payment_transaction spt
              ON  spt.order_id = so.entity_id
           WHERE  so.increment_id IN (
                    '7000016175'
                  ) ;

    -- create void transactions for
    -- specified order increments
     INSERT INTO  sales_payment_transaction (
                    parent_id,
                    order_id,
                    payment_id,
                    txn_id,
                    parent_txn_id,
                    txn_type,
                    is_closed,
                    additional_information
                  )
          SELECT  spt.transaction_id AS parent_id,
                  spt.order_id,
                  spt.payment_id,
                  CONCAT(spt.txn_id, '-void') AS txn_id,
                  spt.txn_id AS parent_txn_id,
                  'void' AS txn_type,
                  1 AS is_closed,
                  'null' AS additional_information
            FROM  sales_order so
            JOIN  sales_payment_transaction spt
              ON  spt.order_id = so.entity_id
           WHERE  so.increment_id IN (
                    '7000016175'
                  ) ;

    -- inspect rows that will be affected by
    -- the next update
      SELECT  spt2.*
        FROM  sales_payment_transaction spt
        JOIN  sales_payment_transaction spt2
          ON  spt2.txn_id = spt.parent_txn_id
       WHERE  spt.txn_type = 'void'
         AND  spt2.is_closed = 0

    -- mark related authorized transactions
    -- as closed if they aren't already
      UPDATE  sales_payment_transaction
         SET  is_closed = 1
       WHERE  transaction_id IN (
                SELECT  *
                  FROM  (
                          SELECT  spt2.transaction_id
                            FROM  sales_payment_transaction spt
                            JOIN  sales_payment_transaction spt2
                              ON  spt2.txn_id = spt.parent_txn_id
                           WHERE  spt.txn_type = 'void'
                             AND  spt2.is_closed = 0
                        ) tmp
              )

			  
	-- Check and Update order status to "cancled" in admin and frontend
	SELECT * FROM sales_order WHERE increment_id IN ('7000022427');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000022427');
	
	UPDATE sales_order SET state = "canceled", status = "canceled" WHERE increment_id in ('7000022427');
	UPDATE sales_order_grid SET status = "canceled" WHERE increment_id in ('7000022427');
					  
	SELECT * FROM sales_order WHERE increment_id IN ('7000022427');
	SELECT * FROM sales_order_grid WHERE increment_id IN ('7000022427');