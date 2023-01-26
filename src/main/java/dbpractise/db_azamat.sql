select * from customer
where country = 'Canada';

select country from customer;

select count(*) from orders;

select max(total_amount) from orders;

select sum(total_amount) from orders;

select sum(total_amount) from orders
WHERE order_date >= '2014-01-01'::date
  AND order_date < ('2014-12-31'::date + '1 day'::interval);

select avg(total_amount) from orders;

select customer.first_name, avg(orders.total_amount)
from orders
         join customer on customer.id = orders.customer_id
group by customer.first_name;

select first_name,country from customer
where country in ('Brazil','Spain');

select * from orders
WHERE order_date >= '2013-01-01'::date
  AND order_date < ('2014-12-31'::date + '1 day'::interval)
and total_amount < 100.00;

select  * from customer
where country in ('Spain','Italy','Germany','France')
group by country;

select customer.first_name,customer.country,supplier.country,supplier.company_name
from customer
         join orders  on customer.id = orders.customer_id
         join order_item on orders.id = order_item.order_id
         join product on product.id = order_item.product_id
         join supplier on product.supplier_id = supplier.id
where customer.country = supplier.country;

select first_name from customer
where first_name like 'Jo%';

select first_name from customer
where first_name like '___a';

select country , count(first_name) as customers_count
from customer
group by country;

select country , count(first_name) as customers_count
from customer
group by country
order by country desc;

select customer.first_name, sum(orders.total_amount),count(orders.customer_id)
from orders
         join customer on customer.id = orders.customer_id
group by first_name
order by sum(orders.total_amount);

select customer.first_name, sum(orders.total_amount),count(orders.customer_id)
from orders
         join customer on customer.id = orders.customer_id
group by first_name
having count(orders.customer_id)>20;

