select so.entity_id, so.increment_id, so.status, so.customer_email, sop.`method`, so.created_at, msa.created_at as shipment_export_at, aj.job_id, aj.type, aj.state
from sales_order so
left join sales_order_payment sop on sop.parent_id = so.entity_id
left join ml_simparel_amazonshipmentexport msa on msa.order_id = so.entity_id
left join 
(
select maj.entity_id as job_id, maje.object_id as increment_id, maj.`type`, maj.state
from ml_amazon_job_entity maje
left join ml_amazon_job maj on maj.entity_id = maje.job_id -- and maj.`type` = 'WAIT_FOR_ORDER_SHIPMENT'
) aj on aj.increment_id = so.increment_id
where sop.`method` = "coedition" and msa.created_at is NULL and aj.type = 'WAIT_FOR_ORDER_SHIPMENT' and aj.state = 'success'

order by so.created_at desc;

select *
from ml_amazon_job_entity maje
inner join ml_amazon_job maj on maj.entity_id = maje.job_id -- and maj.`type` = 'WAIT_FOR_ORDER_SHIPMENT'
where maje.object_id = '15844'
order by maj.created_at desc
;

select *
from ml_amazon_log
where job_id = 47869;