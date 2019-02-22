use maggylondon;
SELECT cpe.entity_id, cpe.sku, cpem.value
FROM catalog_product_entity cpe 
left join catalog_product_entity_media_gallery_value_to_entity cmve on cmve.entity_id=cpe.entity_id
left join catalog_product_entity_media_gallery cpem on cpem.value_id = cmve.value_id 
where cpe.sku in 
(
'G3631M-NISK',
'G3631W-NISK',
'G3680P-NVYY',
'G3760P-ITBL',
'G3793M-VROS',
'G3803M-NSLA',
'G3803P-NSLA',
'G3803W-NSLA',
'G3812M-AMAR',
'G3816P-BUNT',
'G3822P-IVOB',
'G3823P-001',
'T3400M-BASS',
'T3408M-BLOE',
'T3504M-WRTQ',
'T3749M-CKAL',
'T3749P-CKAL',
'T3777M-CKWB',
'T3777P-CKWB',
'T3778M-DMYW',
'T3778M-NVBL',
'T3778P-NVBL',
'T3791M-CKSW',
'T3791P-CKSW',
'T3957M-BSFW',
'T3957W-BSFW'
)
group by cpe.sku
;