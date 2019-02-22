USE maggylondon;
SELECT 
    so.increment_id order_id,
    sc.increment_id refound_id,
    sci.sku,
    sci.base_row_total,
    IFNULL(sci.base_tax_amount, '') base_tax_amount,
    sci.base_row_total_incl_tax item_price_include_tax,
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
    concat(REPLACE(REPLACE(soab.firstname, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soab.lastname, '\r', ''), '\n', '')) billing_name,
    concat(REPLACE(REPLACE(soas.street, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.city, '\r', ''), '\n', ''),' ',REPLACE(REPLACE(soas.region, '\r', ''), '\n', ''), ' ', REPLACE(REPLACE(soas.postcode, '\r', ''), '\n', '')) shipping_address,
    sc.created_at
FROM
    sales_creditmemo sc
        LEFT JOIN
    sales_order so ON sc.order_id = so.entity_id
        LEFT JOIN
    sales_order_address soab ON soab.entity_id = sc.billing_address_id    -- for billing address info
		left join 
    sales_order_address soas on soas.entity_id = sc.shipping_address_id  -- for shipping address info
        LEFT JOIN
    sales_creditmemo_item sci ON sci.parent_id = sc.entity_id
WHERE
    sci.base_price > 0 
ORDER BY order_id , refound_id
;

