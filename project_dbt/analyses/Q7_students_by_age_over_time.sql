-- Répartition des étudiants par groupe d'âge dans le temps et poids démographique

with students_per_age_group as (
select
    year_path_started,
    '20-24 ans' as age_group,
    round(100.0*sum(student_20_24)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select
    year_path_started,
    '25-29 ans' as age_group,
    round(100.0*sum(student_25_29)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '30-34 ans' as age_group,
    round(100.0*sum(student_30_34)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '35-39 ans' as age_group,
    round(100.0*sum(student_35_39)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '40-44 ans' as age_group,
    round(100.0*sum(student_40_44)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '45-49 ans' as age_group,
    round(100.0*sum(student_45_49)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '50-54 ans' as age_group,
    round(100.0*sum(student_50_54)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '55-59 ans' as group_age,
    round(100.0*sum(student_55_59)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '60 ans et plus' as age_group,
    round(100.0*sum(student_60_plus)/sum(student_total),2) as student_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
),
population_per_age_group as(
select 
    year_path_started,
    '20-24 ans' as age_group,
    round(100.0*sum(population_20_24)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '25-29 ans' as age_group,
    round(100.0*sum(population_25_29)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '30-34 ans' as age_group,
    round(100.0*sum(population_30_34)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '35-39 ans' as age_group,
    round(100.0*sum(population_35_39)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '40-44 ans' as age_group,
    round(100.0*sum(population_40_44)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '45-49 ans' as age_group,
    round(100.0*sum(population_45_49)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '50-54 ans' as age_group,
    round(100.0*sum(population_50_54)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '55-59 ans' as age_group,
    round(100.0*sum(population_55_59)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
union all
select 
    year_path_started,
    '60 ans et plus' as age_group,
    round(100.0*sum(population_60_plus)/sum(population_total),2) as population_pct
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
)
select
    s.year_path_started,
    s.age_group,
    s.student_pct,
    p.population_pct,
    s.student_pct-p.population_pct as gap
from students_per_age_group s
join population_per_age_group p 
    on s.age_group=p.age_group
    and s.year_path_started=p.year_path_started
order by year_path_started,age_group;
