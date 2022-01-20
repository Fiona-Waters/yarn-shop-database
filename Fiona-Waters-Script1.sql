-- Assignment 2 - Script 1 --
-- Student Name: Fiona Waters - Student Number: 20095357 --

-- creating database --

create database if not exists yarnshop;

use yarnshop;

-- creating tables and inserting records for each table --

create table staff(
staffId int not null,
fName varchar(20) not null,
lName varchar(20) not null,
gender varchar(6),
salary int unsigned not null,
dateOfBirth date,
ppsNo varchar(8) not null,
hoursWorked float not null,
supervisor int,
primary key (staffId),
constraint fk_supervisor foreign key (supervisor) references staff(staffId)
);

insert into staff (staffId, fName, lName, gender, salary, dateOfBirth, ppsNo, hoursWorked, supervisor) values
 (1, 'Fiona', 'Waters', 'female', 30000, '1984-01-09', '7619436b', 39, null),
 (2, 'Ann', 'Flynn', 'female', 25000, '1979-07-23', '3489654d', 35, 1);

create table customer(
customerId int not null,
fName varchar(20) not null,
lName varchar(20) not null,
street varchar (20) not null,
town varchar (20) not null,
county varchar (15) not null,
postcode varchar (8) not null,
contactNumber varchar (15),
emailAddress varchar (50) not null,
primary key (customerId)
);

insert into customer (customerId, fName, lName, street, town, county, postcode, contactNumber, emailAddress) values
(1, 'Amelie', 'Boyle', '1 Main Street', 'Fun Town', 'Waterford', 'X91YK7P', '0893426457', 'amelie@funtown.com'),
(2, 'Kevin', 'Finnegan', '2 Evergreen Terrace', 'Simpsonville', 'Wexford', 'A23RTY6', '0871234567', 'kevin@simpsonville.com'),
(3, 'Scarlette', 'Ray', '21 Jump Street', 'Somweheretown', 'Kilkenny', 'B45YUH7', '0863429846', 'scarlette@jumpstreet.com'),
(4, 'Yasser', 'Daugherty', '11 Elm Street', 'Movie Town', 'Meath', 'YH87I8O', '051236789', 'yasser@elmstreet.com'),
(5, 'Daisy-May', 'Mccann', '4 Baker Street', 'Sherlockville', 'Wicklow', 'HD6T6RF', '0863456734', 'daisy-may@bakerstreet.com'),
(6, 'Safwan', 'Talbot', '15 Paper Street', 'Fightland', 'Cork', 'KY87U9J', '0342563526', 'safwan@paperstreet.com'),
(7, 'Abbey', 'Becker', '7 Sesame Street', 'Muppetville', 'Kerry', 'K8YT97B', '0871236754', 'abbey@sesamestreet.com'),
(8, 'Ikrah', 'Dalton', '64 Wisteria Lane', 'Desperatetown', 'Mayo', 'M65TR6Y', '0231653456', 'ikrah@wisteria.com'),
(9, 'Rohaan', 'Cooke', '24 Coronation Street', 'Manchester', 'Leitrim', 'L82DT7Y', '01234567', 'rohaan@coronationstreet.com'),
(10, 'Jane', 'Allman', '17 Rainey Street', 'King of the Hill', 'Galway', 'K76GY54', '0853452345', 'jane@raineystreet.com'),
(11, 'Phillip', 'Mcfadden', '64 Avenue Q', 'Puppetland', 'Sligo', 'S89UY5R', '0213237679', 'phillip@avenueq.com'),
(12, 'Aedan', 'Knox', '123 Spooner Street', 'Familyville', 'Offaly', 'O76HF4R', '0867654321', 'aedan@spoonerstreet.com'),
(13, 'Bethan', 'Miranda', '18 Jurassic Park', 'Dinosaur Town', 'Meath', 'M26GH7Y', '02367586', 'bethan@jurassicpark.com'),
(14, 'Kaidan', 'Parks', '11 Skid Row', 'Little Shop Village', 'Westmeath', 'W84GK8D', '0858745376', 'kaidan@littleshop.com'),
(15, 'Danny', 'Carty', '16 Park Avenue', 'Waterloo', 'Tipperary', 'T62HJ8U', '0860102394', 'danny@waterloo.com');

create table customerOrder(
orderId int not null,
customerId int,
orderCost decimal(5,2) not null,
shippingCost decimal(3,2),
dateTimeOfOrder datetime,
paymentDetails tinytext,
staffId int,
primary key (orderId),
constraint fk_staffId foreign key (staffId) references staff(staffId)
on update cascade on delete no action,
constraint fk_customerId foreign key (customerId) references customer(customerId)
on update cascade on delete no action
);

insert into customerOrder (orderId, customerId, orderCost, shippingCost, dateTimeOfOrder, paymentDetails, staffId) values
(1, 1, 25.00, 5.00, '2021-03-12 11:16:10', '4233-5678-3452-6172', 1),
(2, 2, 40.00, 6.50, '2021-03-14 10:45:15', '7865-0897-2356-8566', 1),
(3, 3, 12.00, 5.00, '2021-03-14 15:12:11', '1234-1234-4321-4321', 2),
(4, 4, 101.00, 9.00, '2021-03-17 09:57:59', '3748-7654-9090-7776', 1),
(5, 5, 25.00, 5.00, '2021-03-20 14:11:45', '3344-9878-0908-1234', 2),
(6, 6, 12.50, 5.00, '2021-03-20 09:50:50', '1124-9532-1998-1029', 2),
(7, 7, 27.00, 6.00, '2021-03-27 16:16:16', '7765-3434-2267-7778', 1),
(8, 8, 60.00, 9.00, '2021-03-28 12:56:34', '5555-0567-9978-4467', 1),
(9, 9, 12.00, 5.00, '2021-03-30 19:01:23', '6376-0787-6665-1020', 1),
(10, 10, 157.50, 9.00, '2021-04-02 21:12:12', '1111-4354-2365-8887', 2),
(11, 11, 45.00, 6.00, '2021-04-04 13:56:01', '2453-7555-3434-8539', 1),
(12, 2, 25.50, 6.00, '2021-04-06 11:11:11', '4233-5678-3452-6172', 2),
(13, 12, 10.00, null, '2021-04-06 17:23:45', '1111-4444-5555-6666', 1),
(14, 13, 52.50, 6.00, '2021-04-11 12:01:00', '3750-8886-9463-3387', 1),
(15, 14, 95.00, 9.00, '2021-04-12 08:37:10', '2748-9832-0999-8337', 2),
(16, 1, 60.00, 9.00, '2021-04-15 17:50:23', '4233-5678-3452-6172', 1),
(17, 15, 5.00, null, '2021-04-15 08:30:01', '6565-3787-6664-3728', 1),
(18, 7, 25.00, 6.00, '2021-04-20 12:17:08', '7765-3434-2267-7778', 2);

create table supplier(
supplierId int not null,
fName varchar(20) not null,
lName varchar(20) not null,
street varchar (20) not null,
town varchar (20) not null,
county varchar (15) not null,
postcode varchar (8) not null,
contactNumber varchar (15),
emailAddress varchar (50) not null,
primary key (supplierId)
);

insert into supplier (supplierId, fName, lName, street, town, county, postcode, contactNumber, emailAddress) values
(1, 'Ashley', 'Langley', '25 Michael Street', 'Ballydavid', 'Wexford', 'WYU76HY', '0873232645', 'ashley@supplier.com'),
(2, 'Edward', 'Roche', '101 Mount Street', 'Loughlinstown', 'Carlow', 'C27UH98', '0868743564', 'edward@supplier.com'),
(3, 'Jennifer', 'Rigley', 'The Bridge', 'Williamsville', 'Dublin', 'D87DDY4', '0852843675', 'jennifer@supplier.com'),
(4, 'Louise', 'Curtain', '47 John Street', 'Waterford City', 'Waterford', 'W8UU9OK', '0516457384', 'louise@supplier.com'),
(5, 'John', 'Ryan', '10 Rainbow Road', 'Johnstown', 'Kilkenny', 'KKYT65R', '0893434675', 'john@supplier.com'),
(6, 'Amanda', 'Duffy', '64 Raglan Road', 'Maryville', 'Offaly', 'O3ER56T', '0867658475', 'amanda@supplier.com'),
(7, 'Mark', 'Grant', '123 Bridge Street', 'Sandymount', 'Dublin', 'DD67YT6', '0871234567', 'mark@supplier.com'),
(8, 'John', 'Murphy', '10 The Rise', 'Collins Avenue', 'Waterford', 'WWX67GT', '0861828348', 'john2@supplier.com'),
(9, 'Martina', 'Black', '65 Griffith Place', 'Heartstown', 'Kildare', 'KYI78DF', '0853637685', 'martina@supplier.com'),
(10, 'Jack', 'Norman', 'Grantstown House', 'Grantstown', 'Kerry', 'K6TR54T', '0423574638', 'jack@supplier.com'),
(11, 'Grainne', 'Storm', '103 Love Lane', 'Lovelytown', 'Waterford', 'WW98YG6', '0882452980', 'grainne@supplier.com'),
(12, 'Duncan', 'Flynn', '26 Hilltop Avenue', 'Sallytown', 'Leitrim', 'L69UGR4', '034672833', 'duncan@supplier.com');

create table product(
productId int not null,
productType varchar(10) not null,
quantity int unsigned not null,
price decimal (5,2) not null,
primary key (productId)
);

insert into product (productId, productType, quantity, price) values
(1, 'yarn', 25, 12.50),
(2, 'yarn', 30, 5.00), 
(3, 'yarn', 25, 10.50),
(4, 'yarn', 40, 3.50),
(5, 'yarn', 20, 21.00),
(6, 'yarn', 50, 14.00),
(7, 'yarn', 12, 12.50),
(8, 'yarn', 31, 10.00),
(9, 'yarn', 24, 21.00),
(10, 'yarn', 40, 12.50),
(11, 'yarn', 47, 4.50),
(12, 'yarn', 10, 14.50),
(13, 'book', 5, 12.50),
(14, 'book', 2, 19.50),
(15, 'book', 1, 14.50),
(16, 'book', 3, 12.00),
(17, 'book', 3, 30.00),
(18, 'book', 2, 15.00),
(19, 'book', 4, 11.00),
(20, 'book', 5, 25.00),
(21, 'book', 1, 15.00),
(22, 'book', 3, 12.00),
(23, 'book', 4, 5.00),
(24, 'book', 6, 20.00),
(25, 'book', 2, 17.50),
(26, 'accessory', 15, 6.50),
(27, 'accessory', 10, 12.50),
(28, 'accessory', 18, 4.50),
(29, 'accessory', 7, 79.00),
(30, 'accessory', 15, 22.50),
(31, 'accessory', 20, 1.00),
(32, 'accessory', 31, 2.00),
(33, 'accessory', 29, 3.50),
(34, 'accessory', 18, 5.00),
(35, 'accessory', 15, 15.00),
(36, 'accessory', 10, 12.50),
(37, 'accessory', 5, 5.00),
(38, 'accessory', 17, 6.50),
(39, 'accessory', 23, 9.00);

create table yarn(
productId int not null,
brand varchar(20) not null,
colourway varchar (40) not null,
dyeLot tinytext,
weight varchar (10) not null,
fibreContent varchar(50) not null,
primary key (productId),
constraint fk_productId foreign key (productId) references product(productId)
on update cascade on delete no action
);

insert into yarn (productId, brand, colourway, dyeLot, weight, fibreContent) values
(1, 'Drops', 'Green Grass', 'G2020', '300g', '100% Wool'),
(2, 'Drops', 'Purple Haze', 'G2025', '100g', '100% Wool'),
(3, 'Drops', 'Red Rose', 'G2027', '250g', '100% Wool'),
(4, 'Drops', 'Blue Sky', 'G2028', '50g', '100% Wool'),
(5, 'Drops', 'Orange Sunset', 'G2022', '1000g', '100% Wool'),
(6, 'Sirdar', 'Caterpillar', '6710', '200g', '100% Wool'),
(7, 'Sirdar', 'Cerise', '6711', '150g', '100% Wool'),
(8, 'Sirdar', 'Lilac', '6712', '150g', '100% Wool'),
(9, 'Green Elephant', 'Green Grass', 'G2020', '100g', '100% Wool'),
(10, 'Green Elephant', 'Green Grass', 'G2020', '100g', '100% Wool'),
(11, 'Green Elephant', 'Green Grass', 'G2020', '20g', '100% Wool'),
(12, 'Green Elephant', 'Green Grass', 'G2020', '75g', '100% Wool');

create table book(
productId int not null,
title varchar(50) not null,
author varchar(40) not null,
craftType varchar (20) not null,
primary key (productId),
constraint fk_productIdBook foreign key (productId) references product(productId)
on update cascade on delete no action
);

insert into book (productId, title, author, craftType) values
(13, 'Japanese Knitting Stiches', 'Hitomi Shida', 'Knitting'),
(14, 'Ultimate Sweater Book', 'Amy Herzog', 'Knitting'),
(15, 'Gradient Knits', 'Carol Feller', 'Knitting'),
(16, 'Kids Knit', 'Kerry Kimber', 'Knitting'),
(17, 'Simply Shetland Lace', 'Brooke Nico', 'Knitting'),
(18, 'How to Crochet', 'Emma Varnham', 'Crochet'),
(19, 'Crochet Yourself Calm', 'Carmen Heffernan', 'Crochet'),
(20, 'Boho Crochet', 'Marinke Slump', 'Crochet'),
(21, 'Kids Learn to Crochet', 'Lucinda Guy & Francois Hall', 'Crochet'),
(22, 'Macrame', 'Jim Gentry', 'Macrame'),
(23, 'Love at First Stitch', 'Tilly Walnes', 'Sewing'),
(24, 'Stretch', 'Tilly Walnes', 'Sewing'),
(25, 'The Hand Stitched Flower Garden', 'Yuki Sugashima', 'Embroidery');

create table accessory(
productId int not null,
productType varchar(40) not null,
craftType varchar (20) not null,
primary key (productId),
constraint fk_productIdAccessory foreign key (productId) references product(productId)
on update cascade on delete no action
);

insert into accessory (productId, productType, craftType) values
(26, 'Hiya Hiya Circular Needle 2.5mm', 'Knitting'),
(27, 'Hiya Hiya Circular Needle 3.5mm', 'Knitting'),
(28, 'Hiya Hiya Circular Needle 4.5mm', 'Knitting'),
(29, 'Hiya Hiya Circular Needle Set', 'Knitting'),
(30, 'Hiya Hiya Accessories Set', 'Knitting'),
(31, 'Button Daisy Light Pink', 'Miscellaneous'),
(32, 'Button Daisy Red 2 Pack', 'Miscellaneous'),
(33, 'Clover Soft Touch Hook 3mm', 'Crochet'),
(34, 'Clover Soft Touch Hook 4mm', 'Crochet'),
(35, 'Clover Hook Set', 'Crochet'),
(36, 'Drawstring Knitting Bag', 'Knitting'),
(37, 'Pom Pom Maker', 'Miscellaneous'),
(38, 'Rico Sock Stop', 'Knitting'),
(39, 'Cable Needle 3 Pack', 'Knitting');

create table storageFacility(
storeName varchar (40) not null,
location varchar (40) not null,
capacity varchar (20) not null,
primary key(storeName)
);

insert into storageFacility (storeName, location, capacity) values
('Super Max Storage Facility', '1 Park Lane, Dublin, DD45FTR', '2000 sqft');

create table teacher(
teacherId int not null,
fName varchar(20) not null,
lName varchar(20) not null,
contactNumber varchar (15),
emailAddress varchar (50) not null,
primary key (teacherId)
);

insert into teacher (teacherId, fName, lName, contactNumber, emailAddress) values
(1, 'Lauren', 'Smith', 0874182098, 'lauren@teacher.com'),
(2, 'Annette', 'White', 0872367490, 'annette@teacher.com'),
(3, 'Siobhan', 'Morrissey', 018237465, 'siobhan@teacher.com'),
(4, 'Martin', 'Flynn', 0893434345, 'martin@teacher.com'),
(5, 'Sam', 'Mullins', 0860860865, 'sam@teacher.com'),
(6, 'Lorraine', 'Morrissey', 0231256347, 'lorraine@teacher.com'),
(7, 'Mary', 'Dunne', 0857658493, 'mary@teacher.com');

create table venue(
venueName varchar(40) not null,
capacity int unsigned not null,
location varchar (40) not null,
primary key (venueName)
);

insert into venue (venueName, capacity, location) values
('Local Library', 25, '1 Main Street, Dublin, DD6T78Y'),
('Community Hall', 20, '2 Main Street, Dublin, DD6T78Y');

create table classes(
classId int not null,
classDate datetime not null,
theme varchar(20) not null,
durationWeeks int not null,
capacity int unsigned not null,
teacherId int not null,
venueName varchar(40) not null,
primary key (classId),
constraint fk_teacherId foreign key (teacherId) references teacher(teacherId)
on update cascade on delete no action,
constraint fk_venueName foreign key (venueName) references venue(venueName)
);

insert into classes (classId, classDate, theme, durationWeeks, capacity, teacherId, venueName) values
(1, '2022-01-20 18:30:00', 'Beginners Knitting', 6, 25, 1, 'Local Library'),
(2, '2022-01-20 18:30:00', 'Beginners Crochet', 6, 20, 2, 'Community Hall'),
(3, '2022-03-01 12:00:00', 'Sweater Knitting 101', 10, 20, 3, 'Community Hall'),
(4, '2022-03-01 18:00:00', 'Advanced Crochet', 6, 25, 4, 'Local Library'),
(5, '2022-03-01 20:00:00', 'Colourwork Knitting', 8, 25, 5, 'Local Library'),
(6, '2022-03-10 15:30:00', 'Knitting for Kids', 6, 20, 6, 'Community Hall'),
(7, '2021-12-01 12:00:00', 'Knitting for Kids', 6, 20, 7, 'Community Hall'),
(8, '2021-12-01 18:00:00', 'Advanced Knitting', 6, 25, 3, 'Local Library'),
(9, '2021-11-28 10:00:00', 'Amigurumi Crochet', 8, 25, 4, 'Local Library'),
(10, '2021-11-28 12:30:00', 'Macrame', 6, 20, 5, 'Community Hall'),
(11, '2022-01-08 18:00:00', 'Embroidery', 6, 20, 1, 'Community Hall'),
(12, '2022-01-08 12:00:00', 'Sock Knitting', 8, 20, 5, 'Community Hall'),
(13, '2020-02-01 12:00:00', 'Beginners Knitting', 6, 25, 1, 'Local Library'),
(14, '2020-02-01 14:00:00', 'Beginners Knitting', 6, 25, 1, 'Local Library'),
(15, '2020-03-01 18:00:00', 'Beginners Crochet', 6, 20, 2, 'Community Hall');

create table productOrder(
orderId int not null,
productId int not null,
quantity int unsigned not null,
primary key (orderId, productId),
constraint fk_productIdOrder foreign key (productId) references product(productId)
on update cascade on delete no action,
constraint fk_OrderIdOrder foreign key (orderId) references customerOrder(orderId)
on update cascade on delete no action
);

insert into productOrder (orderId, productId, quantity) values
(1, 1, 2),
(2, 5, 1),
(2, 13, 1),
(2, 26, 1),
(3, 16, 1),
(4, 29, 1),
(4, 16, 1),
(4, 8, 1),
(5, 20, 1),
(6, 27, 1),
(7, 12, 1),
(7, 13, 1),
(8, 5, 2),
(8, 18, 1),
(8, 31, 1),
(8, 32, 1),
(9, 22, 1),
(10, 9, 5),
(10, 13, 1),
(10, 35, 2),
(10, 8, 1),
(11, 20, 1),
(11, 8, 2),
(12, 3, 1),
(12, 18, 1),
(13, 8, 1),
(14, 2, 8),
(14, 27, 1),
(15, 30, 1),
(15, 24, 1),
(15, 10, 3),
(15, 35, 1),
(16, 8, 6),
(17, 37, 1),
(18, 20, 1);

create table supplies(
supplierId int not null,
productId int not null,
primary key (supplierId, productId),
constraint fk_supplierId foreign key (supplierId) references supplier(supplierId)
on update cascade on delete no action,
constraint fk_productIdSupplies foreign key (productId) references product(productId)
on update cascade on delete no action
);

insert into supplies (supplierId, productId) values
(1, 1),
(1, 2),
(1, 26),
(1, 27),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(4, 28),
(4, 29),
(5, 10),
(5, 11),
(5, 12),
(6, 13),
(6, 14),
(7, 15),
(7, 30),
(7, 31),
(7, 32),
(7, 33),
(8, 16),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(11, 23),
(12, 24),
(12, 25);

create table stores(
storeName varchar (40) not null default 'Super Max Storage Facility',
productId int not null,
primary key (storeName, productId),
constraint fk_name foreign key (storeName) references storageFacility(storeName)
on update cascade on delete no action,
constraint fk_productIdStores foreign key (productId) references product(productId)
on update cascade on delete no action
);

insert into stores (storeName, productId) values
('Super Max Storage Facility', 1),
('Super Max Storage Facility', 2),
('Super Max Storage Facility', 3),
('Super Max Storage Facility', 4),
('Super Max Storage Facility', 5),
('Super Max Storage Facility', 6),
('Super Max Storage Facility', 7),
('Super Max Storage Facility', 8),
('Super Max Storage Facility', 9),
('Super Max Storage Facility', 10),
('Super Max Storage Facility', 11),
('Super Max Storage Facility', 12),
('Super Max Storage Facility', 13),
('Super Max Storage Facility', 14),
('Super Max Storage Facility', 15),
('Super Max Storage Facility', 16),
('Super Max Storage Facility', 17),
('Super Max Storage Facility', 18),
('Super Max Storage Facility', 19),
('Super Max Storage Facility', 20),
('Super Max Storage Facility', 21),
('Super Max Storage Facility', 22),
('Super Max Storage Facility', 23),
('Super Max Storage Facility', 24),
('Super Max Storage Facility', 25),
('Super Max Storage Facility', 26),
('Super Max Storage Facility', 27),
('Super Max Storage Facility', 28),
('Super Max Storage Facility', 29),
('Super Max Storage Facility', 30),
('Super Max Storage Facility', 31),
('Super Max Storage Facility', 32),
('Super Max Storage Facility', 33),
('Super Max Storage Facility', 34),
('Super Max Storage Facility', 35),
('Super Max Storage Facility', 36),
('Super Max Storage Facility', 37),
('Super Max Storage Facility', 38),
('Super Max Storage Facility', 39);

create table attends(
customerId int not null,
classId int not null,
noOfClasses int,
primary key (customerId, classId),
constraint fk_customerIdAttends foreign key (customerId) references customer (customerId)
on update cascade on delete no action,
constraint fk_classIdAttends foreign key (classId) references classes (classId)
on update cascade on delete no action
);

insert into attends (customerId, classId, noOfClasses) values
(5, 7, 6),
(1, 9, 8),
(10, 15, 6),
(9, 13, 6),
(2, 4, 6),
(11, 1, 6),
(12, 1, 6),
(6, 1, 6),
(7, 4, 6),
(7, 14, 6),
(12, 15, 6);

-- Triggers --
-- Trigger that takes away from the quantity field once an item is ordered --
delimiter $$
create trigger after_product_bought
	after insert on productOrder
    for each row
begin
	update product
	set quantity = quantity - (select quantity from productOrder where orderId=(select max(orderId) from productOrder))
    where productId = NEW.productId;
end $$
DELIMITER ; 

-- Use the following to test after_product_bought trigger --
insert into customer (customerId, fName, lName, street, town, county, postcode, contactNumber, emailAddress) values
(19, 'Ramelie', 'Doyle', '1 Other Street', 'Other Town', 'Waterford', 'X91YK7P', '0873426457', 'Ramelie@funtown.com');

insert into customerOrder (orderId, customerId, orderCost, shippingCost, dateTimeOfOrder, paymentDetails, staffId) values
(19, 19, 25.00, 5.00, '2021-04-12 11:16:10', '4256-5678-3452-6172', 1);

insert into productOrder (orderId, productId, quantity) values 
(19, 1, 2);

-- second option to test same trigger --
insert into customer values (20, 'John', 'Doe', '2 Main Street', 'Main Town', 'Dublin', 'DDGHEJK', '0873526374', 'john@maintown.com');
insert into customerOrder values (20, 20, 25.00, 5.00, '2021-05-12 12:00:00', '1234-1224-1234-1234', 2);
insert into productOrder values (20, 1, 2);

-- Trigger that removes product listing from stores table when quantity reaches 0 i.e. product is out of stock --
DELIMITER $$ 
create trigger when_product_quantity_zero
	after update on product
    for each row
	if new.quantity <= 0 then
    delete from stores where productId=(select productId from product where quantity=0);
    end if $$
DELIMITER ; 

-- Use the following to test when_product_quantity_zero trigger --
insert into customer values 
(21, 'Barry', 'Doe', '3 Main Street', 'Main Town', 'Dublin', 'DDGHEJK', '0873525574', 'barry@maintown.com');
insert into customerOrder values 
(21, 21, 14.50, 5.00, '2021-06-12 18:00:00', '1134-1224-1234-1234', 2);
insert into productOrder (orderId, productId, quantity) values
(21, 15, 1);
 -- product with productId = 15 has been removed from the stores table --
select * from stores;

-- Trigger that adds details to stores table when a new product is added --
 delimiter $$
 create trigger when_product_added
 after insert on product
 for each row
 begin
 if NEW.quantity >= 1 then
 insert into stores values ('Super Max Storage Facility', new.productId);
 end if; 
 end $$ 
 delimiter ;
 
 -- Use the following to test when_product_added trigger --
insert into product values 
(40, 'accessory', 5, 10.00);
select * from stores;
-- Record has been added to stores table to show storage of new product in storage facility --


-- indexes --

create index staffFirstNameInd on staff(fName);
create index custFirstNameInd on customer(fName);
create index supplierFirstNameInd on supplier(fName);
create index productTypeInd on product(productType);
create index bookCraftInd on book(craftType);
create index yarnBrandInd on yarn(brand);
create index accessoryCraftInd on accessory(craftType);
create index teacherFirstNameInd on teacher(fName);
create index classThemeInd on classes(theme);
create index classTeacherInd on classes(teacherId);

show index from classes;

-- views --

-- allowing a view of details of an order --
create view orderDetails as
select concat (fName, ' ', lName) as name, orderCost, shippingCost, concat (orderCost + shippingCost) as totalCost, productId, quantity
from customer
join customerOrder on customer.customerId = customerOrder.customerId
join productOrder on customerOrder.orderId = productOrder.orderId
where customer.customerId is not null;

select * from orderDetails;

-- allowing a view of order/customer shipping details --
create view shippingDetails as
select concat (fName, ' ', lname) as name, street, town, county, postcode, shippingCost as 'Postage Cost'
from customer
join customerOrder on customer.customerId = customerOrder.customerId;

select * from shippingDetails;

-- allowing a view of customers signed up for classes --
create view classList as
select classes.classId, classDate, theme, concat (fName, ' ', lName) as 'Customer Name'
from classes
join attends on classes.classId = attends.classId
join customer on attends.customerId = customer.customerId
order by theme;

select * from classList;

-- allowing views of products supplied by each supplier ordered by product type (yarn, book, accessory) --

-- allowing a view of yarn products and suppliers --
create view supplierYarnProducts as
select concat (fName, ' ', lName) as supplierName, productType, brand, colourway, dyelot, quantity as 'In Stock'
from supplier
join supplies on supplier.supplierId = supplies.supplierId
join product on supplies.productId = product.productId
join yarn on product.productId = yarn.productId;

select * from supplierYarnProducts;

-- allowing a view of book products and suppliers --
create view supplierBookProducts as
select concat (fName, ' ', lName) as supplierName, productType, title, author, craftType
from supplier
join supplies on supplier.supplierId = supplies.supplierId
join product on supplies.productId = product.productId
join book on product.productId = book.productId;

select * from supplierBookProducts;

-- allowing a view of accessory products and suppliers --
create view supplierAccessoryProducts as
select concat (fName, ' ', lName) as supplierName, product.productType, accessory.productType as accessoryType, craftType
from supplier
join supplies on supplier.supplierId = supplies.supplierId
join product on supplies.productId = product.productId
join accessory on product.productId = accessory.productId;

select * from supplierAccessoryProducts;

