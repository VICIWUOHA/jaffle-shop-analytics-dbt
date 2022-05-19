with payments as(
    select * from {{ ref('stg_payments') }}
)

select order_id, sum(amount) as total_order_amount
from payments
group by order_id
having total_order_amount < 0