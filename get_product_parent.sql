USE maggylondon;
SELECT cpe2.entity_id parent_id, cpe2.sku parent_sku, cpe1.sku child_sku, cpe1.entity_id child_id
FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
WHERE cpe1.sku in (
'606013626673',
'606013626680',
'606013626697',
'606013626703',
'606013626710',
'606013626734',
'606013626741',
'606013626758',
'606013626765'
) 
-- group by parent_sku
order by parent_sku;
