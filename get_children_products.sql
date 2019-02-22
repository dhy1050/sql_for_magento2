USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number,cpe1.entity_id parent_id, cpe1.sku parent_sku, cpe2.sku child_sku, cpe2.entity_id child_id FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.parent_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.product_id = cpe2.entity_id
WHERE /*left (cpe1.sku,6)*/ cpe1.sku in (
'GSM41M-001'
) 
-- group by parent_sku
order by parent_sku;