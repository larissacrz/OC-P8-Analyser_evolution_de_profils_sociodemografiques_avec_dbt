WITH user_deduplicate AS(
select 
    row_number()over(partition by user_id order by year_path_started asc) as rnb,
    *
from {{ ref ('stg_students')}}
)
select 
    user_id,
    path_category_name,
    age_group,
    gender,
    region,
    year_path_started
from user_deduplicate
where rnb = 1