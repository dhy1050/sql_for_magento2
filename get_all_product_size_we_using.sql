use maggylondon;
select * from eav_attribute where attribute_code like "%ml_size%";


select * from catalog_product_entity_int cpei 
left join eav_attribute_option_value eaov on eaov.option_id = cpei.value 
where attribute_id = 157
group by eaov.value
order by eaov.value
;
