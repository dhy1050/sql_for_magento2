use maggylondon;
SELECT mrr.entity_id, mrr.return_id, mrr.provider_id, mnr.tracking_number, mnr.api_response
FROM ml_returns_rma mrr
LEFT JOIN ml_newgistics_rma mnr on mnr.rma_id = mrr.entity_id
WHERE left(mrr.return_id,10) in 
(
'1000035655',
'1000035655',
'7000032522',
'1000030275',
'1000035254',
'1000035993',
'7000033243',
'7000034600',
'7000034430',
'7000034403',
'7000033081'
)
order by return_id
;