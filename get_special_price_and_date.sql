use maggylondon;
SELECT * FROM maggylondon.eav_attribute where attribute_code like "special%";
select * from catalog_product_entity_decimal where attribute_id = 78 and entity_id >=12472 and entity_id<=12487 and store_id !=0;
select * from catalog_product_entity_datetime 
where 
(attribute_id in (79,80) and store_id != 0)
and 
(entity_id >=12472 and entity_id<=12487) 
;