{{ config(materialized='table')}}

with kpi_share as (
select
    *,
    round(100.0*student_total/sum(student_total)over(),2) as student_share,
    round(100.0*student_female/student_total,2) as student_female_share,
    round(100.0*student_male/student_total,2) as student_male_share,
    round(100.0*student_unknown_gender/student_total,2) as student_unknown_gender_share,
    round(100.0*student_20_24/student_total,2) as student_20_24_share,
    round(100.0*student_25_29/student_total,2) as student_25_29_share,
    round(100.0*student_30_34/student_total,2) as student_30_34_share,
    round(100.0*student_35_39/student_total,2) as student_35_39_share,
    round(100.0*student_40_44/student_total,2) as student_40_44_share,
    round(100.0*student_45_49/student_total,2) as student_45_49_share,
    round(100.0*student_50_54/student_total,2) as student_50_54_share,
    round(100.0*student_55_59/student_total,2) as student_55_59_share,
    round(100.0*student_60_plus/student_total,2) as student_60_plus_share,
    round(100.0*population_total/sum(population_total)over(),2) as population_share,
    round(100.0*population_female/population_total,2) as population_female_share,
    round(100.0*population_male/population_total,2) as population_male_share,
    round(100.0*population_20_24/population_total,2) as population_20_24_share,
    round(100.0*population_25_29/population_total,2) as population_25_29_share,
    round(100.0*population_30_34/population_total,2) as population_30_34_share,
    round(100.0*population_35_39/population_total,2) as population_35_39_share,
    round(100.0*population_40_44/population_total,2) as population_40_44_share,
    round(100.0*population_45_49/population_total,2) as population_45_49_share,
    round(100.0*population_50_54/population_total,2) as population_50_54_share,
    round(100.0*population_55_59/population_total,2) as population_55_59_share,
    round(100.0*population_60_plus/population_total,2) as population_60_plus_share
from {{ref ('int_students_enriched')}}
)
select *,
    student_share-population_share as gap,
    student_female_share-population_female_share as female_gap,
    student_male_share-population_male_share as male_gap,
    student_20_24_share-population_20_24_share as group_20_24_gap,
    student_25_29_share-population_25_29_share as group_25_29_gap,
    student_30_34_share-population_30_34_share as group_30_34_gap,
    student_35_39_share-population_35_39_share as group_35_39_gap,
    student_40_44_share-population_40_44_share as group_40_44_gap,
    student_45_49_share-population_45_49_share as group_45_49_gap,
    student_50_54_share-population_50_54_share as group_50_54_gap,
    student_55_59_share-population_55_59_share as group_55_59_gap,
    student_60_plus_share-population_60_plus_share as group_60_plus_gap
from kpi_share