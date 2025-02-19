with age_group_data as (
   SELECT   
    start_age_days,
    end_age_days,
    CASE
        WHEN start_age_days >= 0 AND end_age_days <= 365 THEN '0 - < 1yr'
        WHEN start_age_days >= 366 AND end_age_days <= 730 THEN '1 - < 2yrs'
        WHEN start_age_days >= 731 AND end_age_days <= 1825 THEN '2 - < 5yrs'
        WHEN start_age_days >= 1826 AND end_age_days <= 6205 THEN '5 - 17yrs'
        WHEN start_age_days >= 6206 AND end_age_days <= 18250 THEN '18 - 50yrs'
        WHEN start_age_days >= 18251 THEN '51+ yrs'
     
    END AS age_group_category
FROM
    (VALUES
        (0, 365),   -- 0 - < 1yr (365 included)
        (366, 730), -- 1 - < 2yrs (Starts from 366)
        (731, 1825), -- 2 - < 5yrs
        (1826, 6205), -- 5 - 17yrs
        (6206, 18250), -- 18 - 50yrs
        (18251, 25000) -- 51+ yrs
    ) AS age_group(start_age_days, end_age_days)	

),
final_data as (
    select 
        {{ dbt_utils.surrogate_key( ['age_group_data.age_group_category']) }} as age_group_key,
        start_age_days,
        end_age_days,
        age_group_category
    from age_group_data 

    union 

    select 
    'unset' as age_group_key,
    -999 as start_age_days,
    -999 as end_age_days,
    'unset' as age_group_category  
)
select 
    final_data.*,
    cast(current_date as date) as load_date
from final_data 