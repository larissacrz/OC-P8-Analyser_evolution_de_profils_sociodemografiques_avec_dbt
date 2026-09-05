select *
from {{ ref('stg_insee') }}
where population_total < 0
   or population_male < 0
   or population_female < 0
   or ans_20_24 < 0
   or ans_25_29 < 0
   or ans_30_34 < 0
   or ans_35_39 < 0
   or ans_40_44 < 0
   or ans_45_49 < 0
   or ans_50_54 < 0
   or ans_55_59 < 0
   or ans_60_plus < 0