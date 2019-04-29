

USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number, cpe2.entity_id parent_id, map_parent.asin as parent_asin, cpe2.sku parent_sku, cpe1.sku child_sku, cpe1.entity_id child_id, map.asin as child_asin,
concat('https://www.maggylondon.com', '/', cpev.value) as product_url, cpi.value as status
FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
LEFT JOIN ml_amazon_product map ON cpe1.entity_id = map.product_id
LEFT JOIN ml_amazon_product map_parent ON cpe2.entity_id = map_parent.product_id
left join catalog_product_entity_varchar cpev on cpev.entity_id = cpe2.entity_id and cpev.attribute_id = 119
left join catalog_product_entity_int cpi on cpi.entity_id = cpe2.entity_id and cpi.attribute_id = 97 and cpi.store_id = 0
WHERE cpe1.sku in (
606013583242,
793055337473,
793055337480,
793055337497,
793055337503,
793055337510,
793055337534,
606013132242,
606013243788,
606013243795,
606013243801,
606013243818,
721547002219,
721547005074,
721547341530,
721547589925,
721547589970,
721547590044,
721547598712,
721547598729,
721547598736,
721547599917,
721547599924,
721547600187,
721547600200,
721547602259,
721547602273,
721547694971,
721547851817,
721547854375,
721547854399,
793055007611,
793055337527,
793055401150,
721547366366,
606013243832,
606013155425,
606013619552,
606013619569,
606013619576,
606013619583,
606013619606,
606013619613,
606013619620,
606013619637,
606013758640,
606013511412,
606013511429,
606013510484,
606013244259,
606013244273,
606013244280,
606013244297
) 
-- group by parent_sku
order by parent_sku;

