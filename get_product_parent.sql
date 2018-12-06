USE maggylondon;
SELECT cpe1.sku child_sku, cpe2.sku parent_sku FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
WHERE cpe1.sku in (
793055780705
) 
group by parent_sku
order by parent_sku;
