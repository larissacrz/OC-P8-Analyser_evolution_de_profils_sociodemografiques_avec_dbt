-- Taille de l'échantillon
-- Q1. Combien d'étudiants avons-nous?

select sum(student_total) as total_students,
    round(100.0*sum(student_total)/sum(population_total),4) as ratio
from {{ ref ('mart_demographics_comparison')}}

-- l'échantillon contient 4010 étudiants et correspond à 0.0015% de la population
