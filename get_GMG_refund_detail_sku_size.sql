USE magento;
SELECT 
	concat(REPLACE(REPLACE(soab.firstname, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.lastname, '\r', ''), '\n', '')) customer_name,
    soab.email as customer_email,
    so.increment_id order_number,
    sc.increment_id refound_id,
    so.created_at order_date,
    sc.created_at return_date,
    sci.sku,
    eaov.value as size,
    sci.qty,
    sci.base_row_total as amount_without_tax,
    IFNULL(sci.base_tax_amount, '') base_tax_amount,
    sci.base_row_total_incl_tax amount_with_tax,
    IFNULL(sci.discount_amount,'') discount_amount,
    IF(sci.discount_amount IS NOT NULL,
        sci.base_row_total - sci.discount_amount,
        sci.base_row_total_incl_tax) item_price_after_discount,
    sc.base_shipping_amount,
    sc.base_grand_total refund_amount,
    IF(so.base_total_offline_refunded = sc.base_grand_total,
        1,
        0) is_offline,
    sc.transaction_id,
    concat(REPLACE(REPLACE(soas.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soas.region is not null, soas.region, ''), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soas.postcode is not null, soas.postcode, ''), '\r', ''), '\n', '')) shipto,
	concat(REPLACE(REPLACE(soab.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(if(soab.region is not null, soab.region, ''), '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(if(soab.postcode is not null, soab.postcode, ''), '\r', ''), '\n', '')) billto
    
FROM
    sales_creditmemo sc
        LEFT JOIN
    sales_order so ON sc.order_id = so.entity_id
        LEFT JOIN
    sales_order_address soab ON soab.entity_id = sc.billing_address_id    -- for billing address info
		left join 
    sales_order_address soas on soas.entity_id = sc.shipping_address_id  -- for shipping address info
        LEFT JOIN
    sales_creditmemo_item sci ON sci.parent_id = sc.entity_id and sci.base_price > 0
    left join catalog_product_entity cpe on cpe.sku = sci.sku
	left join catalog_product_entity_varchar cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
	left join eav_attribute_option_value eaov on eaov.option_id =  cpei.value

WHERE so.created_at >= '2018-04-18'     
ORDER BY order_id , refound_id

;
