use maggylondon;
SELECT 
    mal.entity_id,
    maj.entity_id AS job_id,
    maj.type,
    mal.message,
    mal.created_at
FROM
    ml_amazon_job_entity maje
        LEFT JOIN
    ml_amazon_job maj ON maje.job_id = maj.entity_id
        LEFT JOIN
    ml_amazon_log mal ON mal.job_id = maj.entity_id
WHERE
    maje.object_id = '1000035345'
ORDER BY mal.entity_id DESC