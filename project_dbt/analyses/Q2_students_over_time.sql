-- Distribution dans le temps
--Comment le nombre d'étudiants évolue-t-il entre 2022 et 2025?

select year_path_started,
sum(student_total) as total_students,
round(100.0*sum(student_total)/sum(sum(student_total))over(),2) as student_pct,
sum(population_total) as total_population,
round(100.0*sum(population_total)/sum(sum(population_total))over(),2) as population_pct,
round((sum(student_total)/sum(sum(student_total)) over() - sum(population_total)/sum(sum(population_total)) over()),2) as gap,
round((sum(student_total)-lag(sum(student_total))over(order by year_path_started))/lag(sum(student_total))over(order by year_path_started),2) as s_growth_rate,
round(100.0*(sum(population_total)-lag(sum(population_total))over(order by year_path_started))/lag(sum(population_total))over(order by year_path_started),2) as p_growth_rate
from {{ ref ('mart_demographics_comparison')}}
group by year_path_started
order by year_path_started asc;

/*
2022 est l’année qui compte le plus d’étudiants inscrits, avec 1 696 étudiants 
suivi par une forte decroissance dans les années suivantes et legère hausse en 2025
*/
