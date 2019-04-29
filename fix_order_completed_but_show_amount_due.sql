use maggylondon;
select *
from sales_order
where 
-- status = 'complete'
increment_id in
(
1000042011,
1000042022,
1000038567 
);
SET SQL_SAFE_UPDATES = 0;
update sales_order
set base_discount_invoiced = 0, base_shipping_invoiced = 0, base_subtotal_invoiced = 234, base_tax_invoiced = 0, base_total_invoiced = 234, base_total_invoiced_cost=0, discount_canceled=0, discount_invoiced=0,
base_total_paid = 234, shipping_invoiced=0, subtotal_invoiced=234, tax_invoiced=0, total_invoiced=234, total_paid = 234, base_total_due = 0, total_due = 0, discount_tax_compensation_invoiced=0,
base_discount_tax_compensation_invoiced = 0
where increment_id = 1000038567;