USE maggylondon;
   SELECT  mrr.entity_id,
              mrr.return_id,
              mrr.is_canceled,
              mrr.is_ignored,
              mrr.created_at
        FROM  ml_returns_rma mrr
   LEFT JOIN  ml_simparel_rmaexport msr
          ON  msr.rma_id = mrr.entity_id
       WHERE  msr.export_id IS NULL
         AND  mrr.is_canceled = 0 
         AND  mrr.is_ignored = 0;