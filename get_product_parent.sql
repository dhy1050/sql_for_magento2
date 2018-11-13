USE maggylondon;
SELECT cpe1.sku child_sku, cpe2.sku parent_sku FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
WHERE cpe1.sku in (
606013224695,
606013224626,
606013224633,
606013224640,
606013224657,
606013424477,
606013224077,
606013224084
) 
order by parent_sku;
