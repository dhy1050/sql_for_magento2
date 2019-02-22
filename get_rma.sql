USE magento;
SELECT mrr.entity_id, mrr.return_id, mrr.provider_id, mnr.tracking_number, mnr.api_response
FROM ml_returns_rma mrr
LEFT JOIN ml_newgistics_rma mnr on mnr.rma_id = mrr.entity_id
WHERE left(mrr.return_id,10) in 
(
'1000035132',
'1000034555',
'1000035090',
'1000035410',
'1000035421',
'7000034267',
'7000034128',
'7000034395',
'7000034289',
'7000034198',
'1000035154',
'1000035238',
'1000035247',
'1000035396',
'1000035343',
'1000035417',
'1000035189',
'7000033886',
'7000034182',
'7000034247',
'7000034308',
'7000034268',
'7000033200',
'7000033926',
'7000034182',
'7000033751',
'7000033277',
'7000033231',
'7000032595',
'7000034245',
'7000033067',
'7000033939',
'7000034115',
'7000033789'
)
order by return_id
;

SELECT mrr.entity_id, mrr.return_id, mrr.provider_id, mnr.tracking_number
FROM ml_returns_rma mrr
LEFT JOIN ml_newgistics_rma mnr on mnr.rma_id = mrr.entity_id
where mrr.return_id like '%7000033789%';