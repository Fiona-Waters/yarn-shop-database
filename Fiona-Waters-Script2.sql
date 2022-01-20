-- Assignment 2 - Script 2 --
-- Student Name: Fiona Waters - Student Number: 20095357 --

use yarnshop;

-- select statements --
select * from customerOrder;

select * from book;

select * from classes;

select productId, quantity from productOrder;

select title, author from book;

select title from book where craftType='Knitting';

select colourway from yarn where brand='Drops';

select concat (fName, ' ', lName) as 'Teacher Name', emailAddress from teacher;

select orderId, concat (orderCost + shippingCost) as 'Total Cost'  from customerOrder;

-- use of Order By --
select title, craftType from book
order by craftType;

select brand, colourway, dyelot, weight from yarn where brand='Green Elephant'
order by weight desc;

select classDate, theme, capacity from classes where venueName='Local Library'
order by classDate asc;

-- use of distinct -- 
select distinct craftType from book;
select distinct brand from yarn;
select distinct craftType from accessory;

-- use of where and between --
select brand, colourway from yarn 
where colourway like 'Gr%';

select title, author from book
where author like 'C%';

select title, price from book 
join product on book.productId = product.productId
where price between 20 and 40;

select orderId, orderCost from customerOrder
where orderCost between 10 and 50;

select * from customerOrder 
join productOrder where productOrder.orderId = customerOrder.orderId 
order by customerOrder.orderId;

select concat (fName, ' ', lName) as 'Customer Name', county from customer
where county in ('Dublin', 'Offaly')
order by lName;

select orderId, customerId from customerOrder where shippingCost is null; 

-- use of aggregate functions and group by function --
select round(avg(price)) as 'Average Price' from product;
select round(avg(shippingCost)) as 'Average Shipping Cost' from customerOrder;
select min(price) as 'Lowest Price' from product;
select max(price) as 'Highest Price' from product;
select sum(price) as 'Total Product Cost' from product; 

select county, count(customer.customerId) as 'Number of Orders'
from customer
join customerOrder on customer.customerId = customerOrder.customerId
group by county
order by county;

select brand, colourway, count(orderId) as 'Number of Orders'
from product 
join productOrder on product.productId = productOrder.productId
join yarn on productOrder.productId = yarn.productId
where brand = 'Drops'
group by colourway
order by colourway;

-- use of having and group by --
select customerOrder.orderId, orderCost from productOrder
join customerOrder on productOrder.orderId = customerOrder.orderId
group by orderId
having orderCost > 20;

select productId, price from product
group by price
having price < 10;

-- use of sub queries --
-- show productId and price of cheapest product --
select productId, price from product
where price <=ALL
(select price from product);

-- show customerId and orderCost of most expensive order --
select customerId, orderCost from customerOrder
where orderCost >=ALL
(select orderCost from customerOrder);

-- show customer name where county is Waterford --
select concat(fName, ' ', lName) as 'CustomerName'
from customer
where county in (select county from customer where county = 'Waterford');

-- use of joins --

select concat(fName, ' ', lName) as 'Staff Name', orderId from staff
join customerOrder on staff.staffId = customerOrder.staffId;

select product.productId, productType, brand, colourway from product
join yarn on product.productId = yarn.productId;

-- multi table joins --
select teacher.teacherId, concat(fName, ' ', lName), venue.venueName, location, classDate, theme
from teacher
join classes on teacher.teacherId = classes.teacherId
join venue on classes.venueName = venue.venueName;

select concat(fName, ' ', lName) as 'Supplier Name', contactNumber, product.productId, productType
from supplier
join supplies on supplier.supplierId = supplies.supplierId
join product on supplies.productId = product.productId
order by productType;

-- left and right joins --

select concat(fName, ' ', lName)as 'Customer Name', orderCost, shippingCost, staffId
from customer
right join customerOrder
on customer.customerId = customerOrder.customerId;

select concat(fName, ' ', lName) as 'Customer Name', classId
from customer
left join attends
on customer.customerId = attends.customerId;

-- creating users --

create user manager identified by 'manager';
create user emp1 identified by 'emp1';

-- granting privileges --

grant all on yarnshop.* to manager with grant option;

grant insert, update, select on customer to emp1;
grant insert, update, select on customerOrder to emp1;
grant insert, update, select on productOrder to emp1;
grant insert, update, select on product to emp1;
grant insert, update, select on yarn to emp1;
grant insert, update, select on book to emp1;
grant insert, update, select on accessory to emp1;




