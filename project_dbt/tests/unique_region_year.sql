select
    region,
    year_path_started
from {{ ref('int_students_enriched') }}
group by
    region,
    year_path_started
having count(*) > 1