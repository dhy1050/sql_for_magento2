use maggylondon;

-- update catalog_product_entity_varchar images
-- -- select cpe.entity_id, cpe.sku, images.attribute_id, images.value, cpemg.value
-- -- from catalog_product_entity_varchar images
-- join catalog_product_entity cpe
-- on cpe.entity_id = images.entity_id
-- and cpe.type_id = 'configurable'
-- join catalog_product_entity_media_gallery_value cpemgv
-- on cpemgv.entity_id = images.entity_id
-- and cpemgv.position = 0
-- join catalog_product_entity_media_gallery cpemg
-- on cpemg.value_id = cpemgv.value_id
-- set images.value = cpemg.value
-- where images.attribute_id IN (87, 88, 89)
-- and images.value = 'no_selection'
;

-- SET SQL_SAFE_UPDATES = 0;
-- update catalog_product_entity_varchar images
-- -- select cpe.entity_id, cpe.sku, images.attribute_id, images.value, cpemg.value
-- -- from catalog_product_entity_varchar images
-- join catalog_product_entity cpe
-- on cpe.entity_id = images.entity_id
-- and cpe.type_id = 'simple'
-- join catalog_product_entity_media_gallery_value cpemgv
-- on cpemgv.entity_id = images.entity_id
-- and cpemgv.position = 20
-- join catalog_product_entity_media_gallery cpemg
-- on cpemg.value_id = cpemgv.value_id
-- set images.value = cpemg.value
-- where images.attribute_id IN (133)
-- and images.value = 'no_selection'
-- ;



-- select *
-- from catalog_product_entity_varchar cpev2 
-- left join 
-- (
-- -- select cpemgv.*, cpem.*, cpev.*, cpe.sku, cpe.entity_id as product_id, cpe.type_id 
-- select cpe.entity_id, cpem.value
-- from  catalog_product_entity_media_gallery_value cpemgv
-- left join catalog_product_entity_media_gallery cpem on cpem.value_id = cpemgv.value_id 
-- left join catalog_product_entity cpe on cpemgv.entity_id = cpe.entity_id and cpe.type_id = "simple"
-- left join catalog_product_entity_varchar cpev on (cpev.entity_id = cpe.entity_id)
-- where cpev.value like "no_selection%"
-- and cpemgv.position = 20 and cpev.attribute_id = 133
-- order by cpemgv.entity_id
-- ) image
-- on image.entity_id = cpev2.entity_id
-- where cpev2.value = "no_selection"
-- ;

select *
from catalog_product_entity_varchar cpev
where cpev.value like "no_selection%"