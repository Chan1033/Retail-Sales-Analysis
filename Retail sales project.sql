
use retail_sales;

select * from orders;
-- change the data types --

alter table brands modify brand_id varchar(100) ;
alter table categories modify category_id varchar(100); 
alter table customers modify customer_id varchar(100);
alter table order_items5 modify column item_id varchar (100);
show tables;
alter table order_items5 modify column product_id varchar (100);
alter table order_items modify  column order_id varchar(50);
alter table orders2 modify column order_id varchar(100);
alter table orders2 modify column customer_id varchar(100),modify column store_id varchar(100),modify column staff_id varchar(100);
alter table products5 modify product_id varchar (100);
alter table products5 modify column brand_id varchar(100),modify column category_id varchar(100);
alter table stocks2 modify column store_id varchar(100),modify column product_id varchar (100);
alter table staffs2 modify staff_id varchar (100),modify column store_id varchar(100);
alter table stores modify store_id varchar(100);



-- rename--

alter table `products5` rename to products;
alter table `order_items5` rename to order_items;
alter table `orders2` rename to orders;
alter table `staffs2` rename to staffs;
alter table `stocks2` rename to stocks;

select count(customer_id)from customer_segments;
-- primary key--

alter table brands add constraint c_constraint primary key (brand_id);
alter table categories add constraint c_categories primary key (category_id);
alter table customers add constraint c_customers primary key (customer_id);
alter table orders add constraint c_orders primary key (order_id);
alter table products add constraint c_constraint primary key (product_id);
alter table staffs add constraint c_constraint primary key (staff_id);
alter table stores add constraint c_constraint primary key (store_id);

-- foreign key --

alter table order_items add constraint fk_constraint foreign key (order_id) references orders (order_id);
alter table order_items add constraint fka_constraint foreign key (product_id) references products (product_id);
alter table orders add constraint fkb_constraint foreign key (customer_id) references customers (customer_id);
alter table orders add constraint fkc_constraint foreign key (store_id) references stores (store_id);
alter table orders add constraint fkd_constraint foreign key (staff_id) references staffs (staff_id);
alter table products add constraint fke_constraint foreign key (brand_id) references brands (brand_id);
alter table products add constraint fkf_constrainr foreign key (category_id) references categories (category_id);
alter table staffs add constraint fkg_constraint foreign key (store_id) references stores (store_id);
alter table stocks add constraint fkh_constraint foreign key (store_id) references stores (store_id);
alter table stocks add constraint fki_constraint foreign key (product_id) references products (product_id);

-- task 3--

Select o.order_id,o.order_date,p.product_id,p.product_name,ot.quantity,ot.list_price from orders as o inner join
 order_items as ot on o.order_id = ot.order_id inner join products as p on p.product_id = p.product_id;
 
 -- task 4--
 
 select store_id,sum(quantity*list_price) as total_sales from orders as o inner join order_items as ot on o.order_id =ot.order_id group by store_id ;

-- task 5--

select product_id,sum(quantity) as top_sales from order_items group by product_id order by top_sales desc limit 5 ;

-- task 6--

select o.customer_id,count(ot.order_id) as total_orderplaced ,sum(ot.quantity) as total_itemspurchused ,sum(ot.quantity*ot.list_price) as total_revenew from orders as o inner join order_items as ot
on o.order_id=ot.order_id group by customer_id; 

select * from products ;

-- task 7--
 
select o.customer_id,sum(ot.quantity*ot.list_price) as total_spend,case when sum(ot.quantity*ot.list_price)<5000 then "low"
when sum(ot.quantity*ot.list_price)between 5000 and 8000 then "medium" 
else "high" end as category from orders as o inner join order_items as ot on o.order_id=ot.order_id group by customer_id; 

select* from orders;
-- task 8-- 

select o.staff_id,sum(ot.quantity*list_price) as total_revenew from orders as o inner join order_items as ot on o.order_id=ot.order_id group by staff_id;

-- task 9--
select s.store_id,s.product_id,p.product_name,s.quantity from stocks as s inner join products as p on s.product_id = p.product_id where quantity<10 ;

select s.store_id,s.product_id,s.quantity,p.product_name from  stocks as s inner join products as p on s.product_id=p.product_id
where quantity<10;

-- task 10-- 
select* from customer_segments;