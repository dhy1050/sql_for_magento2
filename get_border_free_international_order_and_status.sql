use magento;
select so.created_at, so.status, so.state, so.entity_id, so.increment_id
from ml_borderfree_ordercontrol mbo
join sales_order so
on so.entity_id = mbo.magento_order_id
-- where so.status not in ("processing")
order by so.created_at desc