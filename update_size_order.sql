

select eaov.value as size, eao.*
from eav_attribute_option eao
left join eav_attribute_option_value eaov on eao.option_id = eaov.option_id
where eao.attribute_id = 157
order by sort_order 
;

select * FROM
eav_attribute_option
where attribute_id = 157