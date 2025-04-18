-- Problem 5
-- Generate a sales report showing the daily sales for all book 
-- sales in the year 2021, with subtotals for month and year.
-- Hint: Here's last rows from the answer, there is more rows returned but hopefully this helps
-- What we want to see is on each day of the year what were the sales
-- To get each column separated you need to parse out the year, month and day our of the date using whatever functions you use.
-- The most challenging in this problem is to think about is how do you group by and rollup correctly to get the answers rolled up by year and month? 

select s.sale_date,sum(v.selling_price) AS total_sold
from sale s
join volume v ON s.sale_id = v.sale_id
group by s.sale_date
order by s.sale_date asc;
