select *
from {{ ref('stg_students') }}
where year_path_started < 1900
   or year_path_started > year(current_date)