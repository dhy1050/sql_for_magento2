use magento;

 SELECT  distinct so.entity_id as order_id, so.increment_id, so.state, so.status, soi.sku, soi.qty_ordered, so.created_at, so.updated_at
      FROM  sales_order_item soi
      JOIN  sales_order so
        ON  so.entity_id = soi.order_id
     WHERE 
    --  soi.product_id = 2265
     --   AND  
       so.state NOT IN ('complete', 'canceled', 'processing', 'closed')
     --   and 
       -- so.state in ('holded');

;
select entity_id, increment_id order_number, created_at from sales_order
where status = "pending"