select so.entity_id as entity_id, so.increment_id as order_number, group_concat(sst.track_number SEPARATOR ',') as tracking_numbers, max(sst.created_at) as last_shipment_date
from sales_shipment_track sst
join sales_order so
on so.entity_id = sst.order_id
join ml_amazon_order mao
on mao.order_id = so.entity_id 
where so.status = 'complete'
group by so.increment_id ;