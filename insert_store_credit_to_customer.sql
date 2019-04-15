use magento;
SELECT * FROM magento.mst_credit_transaction;

-- INSERT INTO mst_credit_transaction (balance_id, balance_amount, balance_delta, action, message, is_notified, created_at, updated_at)

select balance_id, (amount + 25) as balance_amount, 25 as balance_delta, 'manual' as action, 'your gift' as message, 1 as is_notified, now() as created_at, now() as updated_at
from mst_credit_balance where balance_id = 1;
;
update mst_credit_balance
set amount = (amount + 25)
where customer_id = 3;

SELECT * FROM magento.mst_credit_transaction order by transaction_id desc;


describe mst_credit_transaction;

select * from mst_credit_balance;