USE fashion_store;

select* from sales;


-- getting the list of products greter than 2000
   select * from products
   where price > 2000
   order by price desc;


-- find total no of customers 
   select 	count(*)  from customers;

-- finding no of products available
   select count(no_products)
   from (select  distinct(product_name) as no_products
   from products) t;

-- Upper Syntax can be used with where in order to find a count of a specefic column.
-- finding all diffrent product category
   select distinct(product_name) from products;

-- finding all the products under accessory category 
   select distinct (product_name) from products
   where category = 'Accessories';

-----------------------------------------------------------------------------------------------------------------------------------------

-- finding total sales countery wise
   select country, sum(total_amount) as sum_of_sales
   from sales
   group by country
   order by sum_of_sales desc;


-- avarage product price by category 
   select category, avg(price) as avg_price
   from products
   group by category
   order by avg_price desc;


-- list top 5 most expensive products in each category using window function
   select * 
		from (
			select *,
		row_number() over (partition by category order by price desc) as price_rnk
	from products 
    )t
   where price_rnk <= 5;

-- qty sold per product
   select p.product_id,p.product_name,
   sum(si.quantity) as total_qty
   from salesitems si
   join products p
   on si.product_id = p.product_id
   group by p.product_name,p.product_id
   order by total_qty desc;
   
   
   -- customer wise total spending 
	  select 
      c.customer_id,
      concat(c.first_name,' ', c.last_name) as customer_name,
      sum(s.total_amount) as total_purchase
      from customers c
	  join sales s
      on c.customer_id = s.customer_id
      group by c.customer_id,customer_name
      order by total_purchase desc
      limit 5;
    
    -- totl salse pre channel
       select c.channel_name,
       sum(s.total_amount) as total_sale
       from sales s
       join channels c
       on s.channel= c.channel_name
       group by s.channel
    order by total_sale desc;
    
    
    -- find products stock less than 50
       select p.product_name,p.product_id,
       s.stock_quantity
       from products p
       join stock s
       on p.product_id =  s.product_id
       where 
       s.stock_quantity < 50
       order by s.stock_quantity desc;
    
    
    ----------------------------------------------------------------------------------------------------------------------------------------
    
    -- get customer names with their total spending 
    
    select c.customer_id,
    concat(c.first_name,' ',last_name) as customer_name,
    sum(s.total_amount) as total_spending
    from customers c
    join sales s
    on c.customer_id = s.customer_id
    group by customer_id;
    
    
    
    
    -- Find revinue genrated by each product
    
    select p.product_id,
    p.product_name,
    sum(s.item_total) as total_revenue
    from products p
    join salesitems s
    on p.product_id = s.product_id 
    group by product_id, Product_name
    order by total_revenue desc;
    
    
    -- show customer, purchas qty and product inn one table
    
    select c.customer_id,
    concat(c.first_name,' ', c.last_name) as first_name,
    p.product_name, si.quantity
    from salesitems si
    join sales s
    on si.sale_id = s.sale_id
    join customers c
    on c.customer_id = s.customer_id
    join products p
    on p.product_id = si.product_id
    order by c.customer_id;
    
   
    
    -- find 2nd highest spending coustomer
    -- using window function
    select * 
    from 
    (select
    c.customer_id,
	concat(c.first_name,' ',c.last_name) as full_name,
    sum(s.total_amount) as total_spending,
    dense_rank() over (order by sum(s.total_amount) desc) as rnk
    from customers c
    join sales s
    on c.customer_id = s.customer_id
      group by c.customer_id,c.first_name,c.last_name
    ) t
    where rnk =2;
    
    
    
    -- using where and group by
    
    select 
    c.customer_id,
    concat(c.first_name,' ',c.last_name) as full_name,
    sum(s.total_amount) as total_spending
    from customers c
    join sales s
    on c.customer_id = s.customer_id
    group by c.customer_id,c.first_name,c.last_name
    order by total_spending desc
    limit 1 offset 1;
    
    -- both the method gives diffrent result as group by and where dosn't care about ties
    -- where as dense rank give same rank to the ties so we get actual 2nd highest spending customer from
    -- window function method
    
    select*from sales;
    
    -- get top selling products from each category
    
    select * from  
    ( select 
    category,
    product_name,
    total_sold,
    dense_rank() over (partition by category order by total_sold desc)as rnk
    from 
    (select
    p.category,
    p.product_name,
    sum(si.quantity) as total_sold
    from
    salesitems si
    join products p
    on p.product_id = si.product_id
    group by p.category,p.product_name
    )t1
    )t2
    where rnk =1 ;
