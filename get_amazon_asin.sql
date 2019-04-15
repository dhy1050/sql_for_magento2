USE maggylondon;
set @row_number=0;
SELECT (@row_number := @row_number + 1) AS row_number, cpe.entity_id product_id, cpe.sku, map.asin, map.* 
FROM catalog_product_entity cpe
LEFT JOIN ml_amazon_product map ON cpe.entity_id = map.product_id 
-- WHERE map.asin in (
-- )
WHERE 
-- cpe.sku in(
left (cpe.sku,6) in (
'T1115M',      
'T4223M',         
'T4476M',     
'T4476M',   
'T4504M',       
'T4504M',     
'T4504P',
'T4223W',         
'T4476W',         
'T4504W',        
'T4417M',        
'T4494M',         
'T4556M',        
'T4417P',         
'T4556P',     
'T4494W',         
'T4556W',         
'T4479W',         
'T4434M',         
'T4498M',         
'T4499M',         
'T4434P',         
'T4499P',         
'T4434W',         
'T4499W',         
'T4475M',         
'T4475P'
)
-- order by field(cpe.sku,

-- )
;
