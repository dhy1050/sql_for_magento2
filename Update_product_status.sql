select cpe.sku, eaov.value as size, cpei2.*
from catalog_product_entity cpe
inner join catalog_product_entity_int cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
inner join eav_attribute_option_value eaov on eaov.option_id =  cpei.value and (eaov.value like 'XXS%' OR eaov.value like 'XXL%') 
left join catalog_product_entity_int cpei2 on cpei2.entity_id = cpe.entity_id and cpei2.attribute_id = 97
;

update catalog_product_entity_int cpei2
-- select cpe.sku, eaov.value as size, cpei2.*
-- from catalog_product_entity_int cpei2
join catalog_product_entity cpe on cpei2.entity_id = cpe.entity_id and cpei2.attribute_id = 97
join catalog_product_entity_int cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
join eav_attribute_option_value eaov on eaov.option_id =  cpei.value and (eaov.value like 'XXS%' OR eaov.value like 'XXL%')
set cpei2.value = 2;


select * from eav_attribute ea where ea.attribute_code like "%status%";

select * from catalog_product_entity_int where attribute_id = 97 and entity_id = 3982
;

select * from eav_attribute