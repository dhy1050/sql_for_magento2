select cpe.sku as upc, 
map.asin, 
concat(eaov_brand.value, " women's ", cpev.value," ", eaov_size.value, " ", eaov_color.value) as product_title, 
eaov_brand.value as brand_name, 
"women" as category,
eaov_size.value as size, 
eaov_color.value as color, 
if(eaov_brand.value = "London Times", concat("https://londontimes.maggylondon.com/", cpev_url.value), concat("https://www.maggylondon.com/", cpev_url.value)) as manufactured_url,
cpetd.value as description,
concat("https://static.maggylondon.com/media/catalog/product/cache/7d52e0d1cdababac8b1cda1ea0223add", pimage.value) as image
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
-- Get product description
left join catalog_product_entity_text cpetd on cpetd.entity_id = cpe_parent.entity_id and cpetd.attribute_id = 75
-- Get product image
left join 
(
select cmve.value_id, cmve.entity_id, cpem.value 
from catalog_product_entity_media_gallery_value_to_entity cmve
left join catalog_product_entity_media_gallery cpem on cpem.value_id = cmve.value_id 
where cpem.value like "%main%"
) pimage on pimage.entity_id = cpe_parent.entity_id
where cpe.sku in 
(
641224122316,
641224122293,
641224122309,
606013694382
)


