USE maggylondon;
SELECT * FROM catalog_product_entity_int
WHERE attribute_id = 136 AND entity_id in 
(
SELECT entity_id 
FROM catalog_product_entity
WHERE sku in
(
'606013289984',
'606013289991',
'606013290003',
'606013290010',
'606013290027',
'606013290034',
'606013290041',
'606013290058',
'606013290065',
'606013290072',
'T4274M-SFUH'
)
);

