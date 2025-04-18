select b.ISBN,w.title,p.publisher_name,b.edition,b.binding,b.copyright_year,count(*) AS stock_count
from volume v
join book b ON v.ISBN = b.ISBN
join work w ON b.work_numb = w.work_numb
join publisher p ON b.publisher_id = p.publisher_id
where v.sale_id IS NULL
group by b.ISBN, w.title, p.publisher_name, b.edition, b.binding, b.copyright_year
order by p.publisher_name asc;