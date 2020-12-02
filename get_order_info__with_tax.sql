select 
sog.entity_id,
sog.created_at,
sog.increment_id AS OrderID,
sog.status AS Order_Status,
sog.payment_method AS payment_method,
sog.base_grand_total AS pmt,
sog.base_grand_total AS charged,
sot.code AS tax_code, 
TRUNCATE(sot.percent,3) AS taxrate,
sot.amount AS taxamount,
sog.shipping_and_handling AS shipping_invoice,
sog.grand_total AS total_invoice,
soa.firstname,
soa.lastname,
soa.city,
soa.region,
soa.postcode,
so.base_discount_invoiced,
so.coupon_code AS Coupon,
spt.txn_id
from sales_order_grid sog 
left join sales_order_address soa on soa.parent_id = sog.entity_id 
left join sales_order so on so.increment_id = sog.increment_id 
left join sales_order_tax sot on sot.order_id = so.entity_id
left join sales_payment_transaction spt on spt.order_id = sog.entity_id 
where sog.created_at >= '2020-10-01' and sog.created_at < '2020-11-01 00:00:00'
group by sog.entity_id 
