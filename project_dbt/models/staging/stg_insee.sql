{{ config (materialized='view')}}

select 
    case when region = 'Centre-Val-de-Loire' then 'Centre-Val de Loire'
        when region = 'DOM' then 'DROM'
        else region end as region,
    annee as year,
    total_population as population_total,
    hommes as population_male,
    femmes as population_female,
    ans_20_24,
    ans_25_29,
    ans_30_34,
    ans_35_39,
    ans_40_44,
    ans_45_49,
    ans_50_54,
    ans_55_59,
    ans_60_plus
from {{ source('insee_demographics','insee')}}