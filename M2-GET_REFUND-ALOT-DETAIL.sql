SELECT 
	concat(REPLACE(REPLACE(soab.firstname, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.lastname, '\r', ''), '\n', '')) customer_name,
    soab.email as customer_email,
    sc.increment_id refund_id,
    so.increment_id order_number,
    YEAR(so.created_at) as order_year,
    DATE_FORMAT(DATE_SUB(so.created_at, INTERVAL 5 HOUR),'%M') as order_month,
    so.created_at order_date,
    sc.created_at return_date,
    sci.sku,
    eaov.value as size,
    sci.qty,
    sci.base_row_total as base_row_total,
    IFNULL(sci.base_tax_amount, '') base_row_tax_amount,
    sci.base_row_total_incl_tax base_row_total_include_tax,
	sc.base_subtotal,
	sc.base_tax_amount,
	sc.base_subtotal_incl_tax,
    sc.base_shipping_amount,
    sc.base_shipping_tax_amount,
    sc.base_shipping_incl_tax,
    sc.base_discount_amount,
    sc.base_adjustment_positive adjustment_refund,
    sc.base_adjustment_negative adjustment_fee,
    sc.base_adjustment,
    sc.base_grand_total base_grand_total,
    IF(so.base_total_offline_refunded = sc.base_grand_total,
        1,
        0) is_offline,
    sc.transaction_id,
    concat(REPLACE(REPLACE(soas.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soas.region is null, '', soas.region), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soas.postcode is null, '', soas.postcode), '\r', ''), '\n', '')) shipto,
-- 	concat(REPLACE(REPLACE(soab.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soab.region is null, '', soab.region), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soab.postcode is null, '', soab.postcode), '\r', ''), '\n', '')) billto,
	soab.region as bill_to_state,
	soas.region as ship_to_state,
	soas.postcode as zip_code
From
    sales_creditmemo sc
LEFT JOIN sales_order so ON sc.order_id = so.entity_id
LEFT JOIN sales_order_address soab ON soab.entity_id = sc.billing_address_id
left join sales_order_address soas on soas.entity_id = sc.shipping_address_id
LEFT JOIN sales_creditmemo_item sci ON sci.parent_id = sc.entity_id and sci.base_price > 0
left join catalog_product_entity cpe on cpe.sku = sci.sku
left join catalog_product_entity_int cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
left join eav_attribute_option_value eaov on eaov.option_id =  cpei.value
where 
soas.region like '%New York%'
-- sc.created_at >= '2016-06-01'
-- and
-- so.increment_id like "2%"
ORDER BY refund_id, order_number



