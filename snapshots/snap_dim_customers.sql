{% snapshot snap_dim_customers %}

{{
    config(
      target_database='dbt-bigquery-357013',
      target_schema='snapshots',
      strategy='check',
      unique_key='customer_id',
      check_cols=['last_name']
    )
}}

select * from {{ ref('dim_customers') }}

{% endsnapshot %}