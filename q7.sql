-- Problem 7
-- Generate the best seller list for July, 2021
-- Along with author and title, give the number of copies sold
-- and the total sales amount for each book.  Order the
-- result by copies sold in descending order.
-- Hint: You might try writing the query for copies sold first

select a.author_last_first as author,w.title,count(*) as copies_sold,sum(v.selling_price) as total_sales_amount
from volume v
join book b on v.ISBN = b.ISBN
join work w on b.work_numb = w.work_numb
join author a on w.author_numb = a.author_numb
join sale s on v.sale_id = s.sale_id
where s.sale_date between '2021-07-01' and '2021-07-31'
group by a.author_last_first, w.title
order by copies_sold DESC;
