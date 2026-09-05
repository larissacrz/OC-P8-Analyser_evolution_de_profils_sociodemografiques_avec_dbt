{{ config(materialized='view')}}

select 
    user_id,
    lower(path_category_name) as path_category_name,
    age_group,
    coalesce(gender, 'unknown') as gender,
    region,
    year_path_started
from {{ source('openclassrooms','students')}}
where year_path_started <= year(current_date)