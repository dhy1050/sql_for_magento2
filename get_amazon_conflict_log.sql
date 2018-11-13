USE maggylondon;
SELECT distinct cp.entity_id, cp.sku, asin
FROM catalog_product_entity cp
LEFT JOIN ml_amazon_product on cp.entity_id = product_id
WHERE asin is null;

select * 
from ml_amazon_product;

SELECT * FROM catalog_product_super_link;

SELECT cp.entity_id, sku, cpsl.parent_id, maje.entity_id job_entity, mal.message, myta.message parent_massage
FROM catalog_product_entity cp
LEFT JOIN ml_amazon_product map on cp.entity_id = map.product_id
LEFT JOIN ml_amazon_job_entity maje ON cp.entity_id = maje.object_id
LEFT JOIN ml_amazon_log mal ON maje.entity_id = mal.job_entity_id
LEFT JOIN catalog_product_super_link cpsl ON cp.entity_id = cpsl.product_id 
LEFT JOIN 
(
	SELECT aje.object_id, al.message FROM ml_amazon_job_entity aje 
    LEFT JOIN ml_amazon_log al ON aje.entity_id = al.job_entity_id
) myta
ON myta.object_id = cpsl.parent_id
WHERE map.asin IS NULL AND (mal.message LIKE "%different%" OR myta.message LIKE "%different%")
AND mal.created_at >= "2018-11-12"
GROUP BY sku
;