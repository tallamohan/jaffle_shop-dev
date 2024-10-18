with stores as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_locations') }}

),

cast_string_to_timestamp as (
    select id as location_id
        ,"name" as location_name
        ,tax_rate
        ,cast(substr(opened_at,1,10) AS date format 'yyyy-mm-dd') as opened_date
    from stores
)

select * from cast_string_to_timestamp
