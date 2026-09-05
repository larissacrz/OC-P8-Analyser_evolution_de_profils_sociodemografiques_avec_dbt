--Distribution par région et comparaison avec population

select region,
sum(student_total) as total_students,
round(100.0*sum(student_total)/sum(sum(student_total)) over(),2) as student_pct,
sum(population_total) as total_population,
round(100.0*sum(population_total)/sum(sum(population_total)) over(),2) as population_pct,
round(100.0*sum(student_total)/sum(sum(student_total)) over()-100.0*sum(population_total)/sum(sum(population_total)) over(),2) as gap
from {{ ref ('mart_demographics_comparison')}}
group by region
order by gap desc;

-- L’Île-de-France concentre le plus grand nombre d’étudiants et est fortement surreprésentée par rapport à son poids démographique. 
