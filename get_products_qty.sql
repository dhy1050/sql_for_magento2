use magento;
select cpe.entity_id, cpe.sku, csi.qty, csi.min_qty from cataloginventory_stock_item csi
left join catalog_product_entity cpe on cpe.entity_id = csi.product_id
;
