USE maggylondon;

select cpe.entity_id, sku, option_id, attribute_code, eaov.value 
from catalog_product_entity cpe
left join catalog_product_entity_int cpet on cpe.entity_id = cpet.entity_id
left join eav_attribute ea on ea.attribute_id = cpet.attribute_id
left join eav_attribute_option_value eaov on cpet.value = eaov.option_id
where cpet.attribute_id = 136
and cpe.sku in (
606013450568,
606013450575,
606013450582,
606013450599,
606013450605,
606013450612,
606013450629,
606013450636,
606013450643,
606013450650,
606013449951,
606013449968,
606013449975,
606013449982,
606013449999,
606013450001,
606013450018,
606013450025,
606013450032,
606013450049
)
;