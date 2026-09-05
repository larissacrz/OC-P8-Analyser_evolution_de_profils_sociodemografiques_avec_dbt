
select 
    s.*,
    i.population_total,
    i.population_female,
    i.population_male,
    i.ans_20_24 as population_20_24,
    i.ans_25_29 as population_25_29,
    i.ans_30_34 as population_30_34,
    i.ans_35_39 as population_35_39,
    i.ans_40_44 as population_40_44,
    i.ans_45_49 as population_45_49,
    i.ans_50_54 as population_50_54,
    i.ans_55_59 as population_55_59,
    i.ans_60_plus as population_60_plus

from {{ ref ('int_students_demographics')}} as s
left join {{ ref ('stg_insee')}} as i
on s.region=i.region
and s.year_path_started=i.year