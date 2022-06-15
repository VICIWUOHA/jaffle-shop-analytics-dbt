with orders as (
    select * from {{ ref('stg_orders')}}
    
),

payments as (
    select * from {{ ref('stg_payments')}}
),

failed_order_payments as (
    select 
        order_id,
        status,
        sum(amount) as amount
    from payments
    where status = 'fail'
    group by 1,2
),

failed_orders_final as (
select
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    failed_order_payments.status,
    coalesce(failed_order_payments.amount,0) as amount
from orders
right join failed_order_payments using (order_id)
)

select * from failed_orders_final
order by 1