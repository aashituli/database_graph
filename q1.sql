-- Problem 1
-- Show the count of books currently in stock for each 
-- condition description (i.e., Poor, Good, Fine, etc.).
-- Hint: For this problem you need to find books that have Volumes that do Not have sales!
-- Expected results

select cc.condition_description,count(*) as count
from volume v
join condition_codes cc ON v.condition_code = cc.condition_code
left join  
    sale s on v.sale_id = s.sale_id
where 
    v.sale_id is null 
group by 
    cc.condition_description;
