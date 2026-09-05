-- Répartition des étudiants par région dans le temps et poids démographique

select 
    region,
    year_path_started,
    student_total,
    student_share,
    population_total,
    population_share,
    gap
from {{ ref ('mart_demographics_comparison')}}
--order by gap desc;