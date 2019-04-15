use maggylondon;
    SELECT  maj.entity_id,
            maj.type,
            maj.state,
            mal.level,
            mal.message
      FROM  ml_amazon_job maj
      JOIN  ml_amazon_log mal
        ON  mal.job_id = maj.entity_id
     WHERE  `type` = 'SHIP_ORDER'
       AND  state = 'failure'
  ORDER BY  maj.created_at desc