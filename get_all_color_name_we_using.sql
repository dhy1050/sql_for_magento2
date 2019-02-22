USE maggylondon;
SELECT /*cpe2.sku style_number,*/ cpei.value, cpe1.sku upc, eapv.value
FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_entity_int cpei ON cpe1.entity_id =  cpei.entity_id
LEFT JOIN eav_attribute_option_value eapv ON cpei.value = eapv.option_id
#LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
#LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
WHERE cpei.attribute_id =138
group by eapv.value
;