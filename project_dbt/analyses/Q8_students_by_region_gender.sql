--Répartition des étudiants par genre par région et poids démographique

with gender_per_region as(
select 
    region,
    round(100.0*sum(student_female)/sum(student_total),2) as student_female_pct,
    round(100.0*sum(population_female)/sum(population_total),2) as population_female_pct,
    round(100.0*sum(student_male)/sum(student_total),2) as student_male_pct,
    round(100.0*sum(population_male)/sum(population_total),2) as population_male_pct,
    round(100.0*sum(student_unknown_gender)/sum(student_total),2) as student_unknown_pct
from {{ ref ('mart_demographics_comparison')}}
group by region
)
select *,
    student_female_pct-population_female_pct as female_gap,
    student_male_pct-population_male_pct as male_gap
from gender_per_region