--use maggylondon;

select
concat(REPLACE(REPLACE(soas.firstname, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.lastname, '\r', ''), '\n', '')) customer_name,
so.customer_email,
so.increment_id as order_number,
so.created_at as order_date,
soi.sku,
eaov.value as size,
soi.qty_ordered as qty,
soi.base_row_total as row_total,
so.base_subtotal as subtotal,
concat(REPLACE(REPLACE(soas.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soas.region is null, '', soas.region), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soas.postcode is null, '', soas.postcode), '\r', ''), '\n', '')) shipto,
concat(REPLACE(REPLACE(soab.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soab.region is null, '', soab.region), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soab.postcode is null, '', soab.postcode), '\r', ''), '\n', '')) billto
from sales_order so
left join sales_order_address soas on soas.entity_id = so.shipping_address_id
left join sales_order_address soab on soab.entity_id = so.billing_address_id
left join sales_order_item soi on soi.order_id = so.entity_id and soi.parent_item_id is null
left join catalog_product_entity cpe on cpe.sku = soi.sku
left join catalog_product_entity_int cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
left join eav_attribute_option_value eaov on eaov.option_id =  cpei.value
order by so.increment_id

