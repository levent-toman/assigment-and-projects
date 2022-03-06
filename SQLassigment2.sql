
select A.customer_id, A.first_name, A.last_name
from sale.customer A
inner join sale.orders B on A.customer_id = B.customer_id
inner join sale.order_item C on C.order_id = B.order_id
inner join product.product D on D.product_id = C.product_id
where D.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
order by A.customer_id asc

select distinct A.customer_id,D.product_name as first_product
from sale.customer A
inner join sale.orders B on A.customer_id = B.customer_id
inner join sale.order_item C on C.order_id = B.order_id
inner join product.product D on D.product_id = C.product_id
where D.product_name = 'Polk Audio - 50 W Woofer - Black'
order by A.customer_id asc

select distinct A.customer_id,D.product_name as second_product
from sale.customer A
inner join sale.orders B on A.customer_id = B.customer_id
inner join sale.order_item C on C.order_id = B.order_id
inner join product.product D on D.product_id = C.product_id
where D.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)'

select distinct A.customer_id,D.product_name as third_product
from sale.customer A
inner join sale.orders B on A.customer_id = B.customer_id
inner join sale.order_item C on C.order_id = B.order_id
inner join product.product D on D.product_id = C.product_id
where D.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)'
order by A.customer_id asc

select 
	distinct A.customer_id, 
	A.first_name, 
	A.last_name,
	replace(isnull(nullif('Polk Audio - 50 W Woofer - Black', e.product_name), 'yes'), 
	'Polk Audio - 50 W Woofer - Black', 'no') first_product,
	replace(isnull(nullif('SB-2000 12 500W Subwoofer (Piano Gloss Black)', f.product_name), 'yes'), 
	'SB-2000 12 500W Subwoofer (Piano Gloss Black)', 'no') second_product,
	replace(isnull(nullif('Virtually Invisible 891 In-Wall Speakers (Pair)', g.product_name), 'yes'), 
	'Virtually Invisible 891 In-Wall Speakers (Pair)', 'no') third_product
from sale.customer A
inner join sale.orders B 
on A.customer_id = B.customer_id
inner join sale.order_item C 
on C.order_id = B.order_id
inner join product.product D 
on D.product_id = C.product_id
left join (
	select 
		distinct A.customer_id,
		D.product_name
	from sale.customer A
	inner join sale.orders B 
	on A.customer_id = B.customer_id
	inner join sale.order_item C 
	on C.order_id = B.order_id
	inner join product.product D 
	on D.product_id = C.product_id
	where d.product_name = 'Polk Audio - 50 W Woofer - Black' ) E
on a.customer_id=e.customer_id
left join (
	select 
		distinct A.customer_id,
		D.product_name
	from sale.customer A
	inner join sale.orders B 
	on A.customer_id = B.customer_id
	inner join sale.order_item C 
	on C.order_id = B.order_id
	inner join product.product D 
	on D.product_id = C.product_id
	where d.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)') F
on a.customer_id = f.customer_id
left join (
	select 
		distinct A.customer_id,
		D.product_name
	from sale.customer A
	inner join sale.orders B 
	on A.customer_id = B.customer_id
	inner join sale.order_item C 
	on C.order_id = B.order_id
	inner join product.product D 
	on D.product_id = C.product_id
	where d.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)') G
on a.customer_id = g.customer_id
where D.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
order by customer_id

