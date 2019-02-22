USE maggylondon;

select cpe.entity_id, sku, option_id, attribute_code, eaov.value 
from catalog_product_entity cpe
left join catalog_product_entity_int cpet on cpe.entity_id = cpet.entity_id
left join eav_attribute ea on ea.attribute_id = cpet.attribute_id
left join eav_attribute_option_value eaov on cpet.value = eaov.option_id
where cpet.attribute_id = 136
and (cpe.sku in (
'T3601M-OTPI',
'T3602M-NAPI',
'T4436M-WHCB',
'T4437M-ROYA'
)
or cpe.sku in (
SELECT cpe2.sku FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.parent_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.product_id = cpe2.entity_id
WHERE cpe1.sku in (
'T3601M-OTPI',
'T3602M-NAPI',
'T4436M-WHCB',
'T4437M-ROYA'
) 
)
)
;