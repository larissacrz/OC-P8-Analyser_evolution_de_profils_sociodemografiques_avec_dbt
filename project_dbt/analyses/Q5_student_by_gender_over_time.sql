--Répartition des étudiants par genre dans le temps et poids démographique

with students_gender as (
select 
    year_path_started,
    'female' as gender,
    round(100.0*sum(student_female)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    'male' as gender,
    round(100.0*sum(student_male)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    'unknown' as gender,
    round(100.0*sum(student_unknown_gender)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
),
population_gender as(
select 
    year_path_started,
    'female' as gender,
    round(100.0*sum(population_female)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    'male' as gender,
    round(100.0*sum(population_male)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
)
select 
    s.year_path_started,
    s.gender, 
    student_pct,
    population_pct,
    student_pct-population_pct as gap
from students_gender s
full outer join population_gender p 
    on s.gender=p.gender
    and s.year_path_started=p.year_path_started
order by year_path_started, gender;