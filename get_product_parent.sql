USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number, cpe2.entity_id parent_id, map_parent.asin as parent_asin, 
cpe2.sku parent_sku, cpe1.sku child_sku, cpe1.entity_id child_id, map.asin as child_asin, map.is_fba as child_isFBA
FROM catalog_product_entity cpe1
LEFT JOIN catalog_product_super_link cpsl ON cpe1.entity_id = cpsl.product_id
LEFT JOIN catalog_product_entity cpe2 ON cpsl.parent_id = cpe2.entity_id
LEFT JOIN ml_amazon_product map ON cpe1.entity_id = map.product_id
LEFT JOIN ml_amazon_product map_parent ON cpe2.entity_id = map_parent.product_id
WHERE cpe1.sku in (
'641224054327',
'641224054389',
'641224054334',
'641224054419',
'641224054402',
'641224054396',
'641224054365',
'641224054358',
'641224054341',
'641224054518',
'641224054501',
'641224054495',
'641224054488',
'641224054426',
'641224054464',
'641224054457',
'641224054440',
'641224054433',
'641224053252',
'641224053245',
'641224053184',
'641224069611',
'641224069604',
'641224069598',
'641224069581',
'641224069666',
'641224069659',
'641224069642',
'641224069635',
'641224069574',
'641224053221',
'641224053214',
'641224053207',
'641224053191',
'641224053276',
'641224053269'
) 
-- group by parent_sku
-- and map.asin is NULL
order by parent_sku;
