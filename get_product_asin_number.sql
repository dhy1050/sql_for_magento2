USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number, cpe.entity_id, cpe.sku, map.asin
FROM catalog_product_entity cpe
LEFT JOIN ml_amazon_product map ON cpe.entity_id = map.product_id 
WHERE
cpe.sku in(
606013243740,
606013243757,
606013243764,
606013243771,
606013243788,
606013243795,
606013243801,
606013243818,
606013243825,
606013243832
)

-- or
-- map.asin in 
-- (
-- 'B008I6I1JK',
-- 'B07KMLBC5F',
-- 'B008I6I1OK',
-- 'B008I6I244',
-- 'B008I6I28K',
-- 'B008I6I2BW'
-- )

#and asin is null
group by cpe.entity_id
;