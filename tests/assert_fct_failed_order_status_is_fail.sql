with failed_orders as(
    select * from {{ ref('fct_failed_orders') }}
)

select order_id, status
from failed_orders
where status != 'fail'