use maggylondon;
select cpe.sku as upc, map.asin, concat(eaov_brand.value, " women's ", cpev.value," ", eaov_size.value, " ", eaov_color.value) as product_title, 
eaov_brand.value as brand_name, eaov_size.value as size, eaov_color.value as color, 
if(eaov_brand.value = "London Times", concat("https://londontimes.maggylondon.com/", cpev_url.value), concat("https://www.maggylondon.com/", cpev_url.value)) as manufactured_url
from catalog_product_entity cpe
left join ml_amazon_product map on map.product_id = cpe.entity_id -- get ASIN
-- GET brand name
left join catalog_product_entity_int cpet on cpe.entity_id = cpet.entity_id and cpet.attribute_id = 136
left join eav_attribute_option_value eaov_brand on cpet.value = eaov_brand.option_id
-- Get product size
left join catalog_product_entity_int cpei on cpei.entity_id = cpe.entity_id and cpei.attribute_id = 157
left join eav_attribute_option_value eaov_size on eaov_size.option_id = cpei.value
-- Get Color
LEFT JOIN catalog_product_entity_int cpei_color ON cpe.entity_id = cpei_color.entity_id and cpei_color.attribute_id = 138
LEFT JOIN eav_attribute_option_value eaov_color ON cpei_color.value = eaov_color.option_id
-- Get product name
left join catalog_product_entity_varchar cpev on  cpev.entity_id = cpe.entity_id and cpev.attribute_id = 73
-- Get product URL
LEFT JOIN catalog_product_super_link cpsl ON cpe.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe_parent ON cpsl.parent_id = cpe_parent.entity_id
left join catalog_product_entity_varchar cpev_url on cpev_url.entity_id = cpe_parent.entity_id and cpev_url.attribute_id = 119

where cpe.sku in 
(
606013681825
)
