-- Problem 2
-- Show the total book sales for each condition description and
-- order the result by the highest sales first.


select c.condition_description,sum(volume.selling_price) as total_sales
from volume 
join condition_codes c on volume.condition_code = c.condition_code
where volume.sale_id IS NOT NULL
group by  c.condition_description
order by  total_sales desc;
