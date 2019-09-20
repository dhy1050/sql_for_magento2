SELECT  q.entity_id,
            mlbp.quote_id,
            mlbo.magento_order_id,
            q.customer_email,
            count(mlbp.entity_id) as attempts
      FROM  ml_borderfree_placementattempt mlbp
 LEFT JOIN  ml_borderfree_quote mlbq
        ON  mlbq.entity_id = mlbp.quote_id
 LEFT JOIN  quote q
        ON  q.entity_id = mlbq.quote_id
 LEFT JOIN  ml_borderfree_ordercontrol mlbo
        ON  mlbo.placement_attempt_id = mlbp.entity_id
     WHERE  mlbp.created_at >= '2019-08-26'
       AND  mlbp.created_at < '2019-09-20'
       AND  mlbp.api_response like '%INV_DAT_BAD_CHECKSUM%'
  GROUP BY  q.entity_id 
  ;


