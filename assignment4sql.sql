

--Generate a report including product IDs and discount effects on whether the increase in the 
--discount rate positively impacts the number of orders for the products.

--In this assignment, you are expected to generate a solution using SQL with a logical approach. 

use SampleRetail;



select order_status, count(a.order_id)
from sale.order_item a, sale.orders b
where a.order_id=b.order_id 
group by order_status                   -- 4 means order got delivered

select discount, count(product_id)
from sale.order_item 
group by discount                       -- 4 kinds of discounts



select product_id, discount, sum(quantity) count_product
from sale.order_item a
group by product_id, discount
order by product_id, discount            -- count per product



select product_id, discount, sum(quantity) count_product
from sale.order_item 
where discount=0.05
group by product_id, discount
order by product_id, discount              -- count of 5


select product_id, discount, sum(quantity) count_product
from sale.order_item 
where discount=0.07
group by product_id, discount
order by product_id, discount              -- count of 7


select product_id, discount, sum(quantity) count_product
from sale.order_item 
where discount=0.10
group by product_id, discount
order by product_id, discount              -- count of 10


select product_id, discount, sum(quantity) count_product
from sale.order_item 
where discount=0.20
group by product_id, discount
order by product_id, discount              -- count of 20



select *, (count_bes+count_yedi) summe
from (
	select product_id, discount, sum(quantity) count_bes
	from sale.order_item 
	where discount=0.05
	group by product_id, discount) a
join (
	select product_id, discount, sum(quantity) count_yedi
	from sale.order_item 
	where discount=0.07
	group by product_id, discount) b
on  a.product_id=b.product_id                  --------- 0,07 ile 0,05 toplami


select *, (count_on+count_yirmi) summe
from (
	select product_id, discount, sum(quantity) count_on
	from sale.order_item
	where discount=0.10
	group by product_id, discount) a
join (
	select product_id, discount, sum(quantity) count_yirmi
	from sale.order_item
	where discount=0.20
	group by product_id, discount) b
on  a.product_id=b.product_id                  --------- 0,10 ile 0,20 toplami         


select  distinct  a.product_id, 
CASE
    WHEN (c.summe10_20-b.summe5_7) < 0 THEN 'Negative'
    WHEN (c.summe10_20-b.summe5_7) > 0 THEN 'Positive'
    ELSE 'Neutral'
END as Discount_Effect
from sale.order_item a
join (	select a.product_id, (count_bes+count_yedi) summe5_7
		from (
			select product_id, discount, sum(quantity) count_bes
			from sale.order_item 
			where discount=0.05
			group by product_id, discount) a
		join (
			select product_id, discount, sum(quantity) count_yedi
			from sale.order_item 
			where discount=0.07
			group by product_id, discount) b
		on  a.product_id=b.product_id ) b
on a.product_id=b.product_id
join(	select a.product_id, (count_on+count_yirmi) summe10_20
		from (
			select product_id, discount, sum(quantity) count_on
			from sale.order_item 
			where discount=0.10
			group by product_id, discount) a
		join (
			select product_id, discount, sum(quantity) count_yirmi
			from sale.order_item 
			where discount=0.20
			group by product_id, discount) b
		on  a.product_id=b.product_id ) c
on a.product_id=c.product_id
order by a.product_id






