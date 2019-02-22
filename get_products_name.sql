use maggylondon;
select cpe1.entity_id parent_id, cpe1.sku parent_sku,cpe2.entity_id child_id, cpe2.sku child_sku, cpev.attribute_id, cpev.value, cpev.store_id from catalog_product_entity cpe1
right JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.parent_id
right JOIN catalog_product_entity cpe2 ON cpsl.product_id = cpe2.entity_id
right join catalog_product_entity_varchar cpev on cpe1.entity_id = cpev.entity_id 
where cpe1.sku = "T3786M-DNFL" and attribute_id in (84,73) 
group by child_sku
order by child_sku
;