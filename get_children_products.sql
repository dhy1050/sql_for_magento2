USE maggylondon;
SELECT cpe1.sku parent_sku, cpe2.sku child_sku FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.parent_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.product_id = cpe2.entity_id
WHERE cpe1.sku in (
'T4403M'
) 

order by parent_sku;