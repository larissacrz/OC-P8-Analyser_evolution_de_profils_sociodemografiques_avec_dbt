select 
    region,
    year_path_started,
    count(user_id) as student_total,
    count(case when gender='F' then user_id end) as student_female,
    count(case when gender='M' then user_id end) as student_male,
    count(case when gender='unknown' then user_id end) as student_unknown_gender,
    count(case when age_group='20-24 ans' then user_id end) as student_20_24,
    count(case when age_group='25-29 ans' then user_id end) as student_25_29,
    count(case when age_group='30-34 ans' then user_id end) as student_30_34,
    count(case when age_group='35-39 ans' then user_id end) as student_35_39,
    count(case when age_group='40-44 ans' then user_id end) as student_40_44,
    count(case when age_group='45-49 ans' then user_id end) as student_45_49,
    count(case when age_group='50-54 ans' then user_id end) as student_50_54,
    count(case when age_group='55-59 ans' then user_id end) as student_55_59,
    count(case when age_group='60 ans ou plus' then user_id end) as student_60_plus
from {{ ref ('int_students_deduplicated')}}
group by region, year_path_started
order by year_path_started asc, region asc

/*
int_students_demographics long

select 
    region,
    year_path_started,
    gender,
    age_group,
    count(*) as student_total
from {{ ref ('int_students_deduplicated')}}
group by 
    region, 
    year_path_started,
    gender,
    age_group
order by year_path_started, region
*/