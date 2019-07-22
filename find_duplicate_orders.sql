select so.increment_id, so.customer_email, so.customer_firstname, so.customer_lastname, soic.item_numbers, son.order_duplicate_numbers
from sales_order so
left join (
	select so.increment_id, soi.order_id, if(count(soi.item_id) > 1, count(soi.item_id)/2, count(soi.item_id)) as item_numbers
	from sales_order_item soi left join sales_order so on so.entity_id = soi.order_id group by soi.order_id
) soic on soic.order_id = so.entity_id
left join (
	select so.entity_id, so.increment_id, so.customer_email, so.base_subtotal, count(so.entity_id) as order_duplicate_numbers, so.store_id
	from sales_order so
	where so.created_at > "2019-07-18" -- and customer_email = "justinecasper@yahoo.com"
	group by customer_email, so.base_subtotal, so.store_id
) son on son.customer_email = so.customer_email and son.store_id = so.store_id and son.base_subtotal = so.base_subtotal
where so.created_at > "2019-07-18" and son.order_duplicate_numbers > 1
;


select so.increment_id, soi.order_id, count(soi.item_id) 
from sales_order_item soi left join sales_order so on so.entity_id = soi.order_id group by soi.order_id
;

select so.increment_id,soi.*
from sales_order_item soi left join sales_order so on so.entity_id = soi.order_id
where order_id = 98;

select so.entity_id, so.increment_id, so.customer_email, count(so.entity_id) as order_duplicate_numbers, so.store_id, so.base_subtotal
from sales_order so
where so.created_at > "2019-07-18" -- and customer_email = "justinecasper@yahoo.com"
group by customer_email, so.base_subtotal, so.store_id




