--Quelle est la répartition par sexe et proportion? Et leur poids démographique?

with students_gender as (
select 'female' as gender,
    round(100.0*sum(student_female)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
union all
select 'male' as gender,
    round(100.0*sum(student_male)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
union all
select 'unknown' as gender,
    round(100.0*sum(student_unknown_gender)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
),
population_gender as(
select 'female' as gender,
    round(100.0*sum(population_female)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
union all
select 'male' as gender,
    round(100.0*sum(population_male)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
)
select 
    s.gender, 
    student_pct,
    population_pct,
    student_pct-population_pct as gap
from students_gender s
full outer join population_gender p on s.gender=p.gender