USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number, cpe2.entity_id parent_id, map_parent.asin as parent_asin, cpe2.sku parent_sku, cpe1.sku child_sku, cpe1.entity_id child_id, map.asin as child_asin
FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
LEFT JOIN ml_amazon_product map ON cpe1.entity_id = map.product_id
LEFT JOIN ml_amazon_product map_parent ON cpe2.entity_id = map_parent.product_id
WHERE cpe1.sku in (
606013703015,
606013702995,
606013702988,
606013702971,
606013702964,
606013703039,
606013703022
) 
-- group by parent_sku
order by parent_sku;
