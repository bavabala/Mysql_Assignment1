  
  CREATE TABLE `sales_people` (
   `snum` int NOT NULL,
   `sname` varchar(45) DEFAULT NULL,
   `city` varchar(45) DEFAULT NULL,
   `comm` varchar(45) DEFAULT NULL,
   PRIMARY KEY (`snum`),
   UNIQUE KEY `sname_UNIQUE` (`sname`)
 );
 
 
INSERT INTO `app_store`.`sales_people` (`snum`, `sname`, `city`, `comm`) VALUES ('1002', 'Serres ', 'Sanjose ', '13');
INSERT INTO `app_store`.`sales_people` (`snum`, `sname`, `city`, `comm`) VALUES ('1004 ', 'Motika ', 'London ', '11');
INSERT INTO `app_store`.`sales_people` (`snum`, `sname`, `city`, `comm`) VALUES ('1007 ', 'Rifkin ', 'Barcelona ', '15');
INSERT INTO `app_store`.`sales_people` (`snum`, `sname`, `city`, `comm`) VALUES ('1003 ', 'Axelrod ', 'Newyork ', '10');


select * from app_store.sales_people;

show create table app_store.sales_people;
select * from customers;
show create table app_store.customers;
CREATE TABLE `customers` (
   `cnum` int NOT NULL,
   `cname` varchar(45) DEFAULT NULL,
   `city` varchar(45) NOT NULL,
   `snum` varchar(45) DEFAULT NULL,
   PRIMARY KEY (`cnum`),
   KEY `snum_idx` (`snum`),
   CONSTRAINT `snum` FOREIGN KEY (`snum`) REFERENCES `sales_people` (`sname`)
 );
select * from app_store.customers;


CREATE TABLE `orders` (
   `Onum` int NOT NULL,
   `Amt` varchar(45) DEFAULT NULL,
   `Odate` varchar(45) DEFAULT NULL,
   `Cnum` int DEFAULT NULL,
   `Snum` int DEFAULT NULL,
   PRIMARY KEY (`Onum`),
   KEY `sname_idx` (`Cnum`,`Snum`),
   KEY `fk_snum_idx` (`Snum`),
   CONSTRAINT `fk_cnum` FOREIGN KEY (`Cnum`) REFERENCES `customers` (`cnum`),
   CONSTRAINT `fk_snum` FOREIGN KEY (`Snum`) REFERENCES `sales_people` (`snum`)
 );
show create table app_store.orders;
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2001,'Hoffman','London',1001);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2002,'Giovanni ','Rome',1003);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2003,'Liu','Sanjose',1002);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2004,'Grass','Berlin',1002);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2006,'Clemens','London',1001);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2007,'Pereira ','Rome',1004);
INSERT INTO `` (`cnum`,`cname`,`city`,`snum`) VALUES (2008,'Cisneros','Sanjose',1007);




INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3001,'18.69 ','3-10-1990 ',2008,1007);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3002,'1900.10 ','3-10-1990',2007,1004);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3003,'767.19 ','3-10-1990',2001,1001);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3005,'5160.45 ','3-10-1990',2003,1002);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3006,'1098.16 ','3-10-1990',2008,1007);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3007,'75.75 ',' 4-10-1990',2004,1002);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3008,'4273.00','5-10-1990',2006,1001);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3009,'1713.23 ','4-10-1990',2002,1003);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3010,'1309.95 ','6-10-1990',2004,1002);
INSERT INTO `` (`Onum`,`Amt`,`Odate`,`Cnum`,`Snum`) VALUES (3011,'9891.88 ','6-10-1990',2006,1001);
USE app_store;

SELECT * FROM sales_people;
SELECT COUNT(DISTINCT city) AS sales_place FROM sales_people WHERE city like 'N%';
SELECT sales_place FROM sales_people;


SELECT count(*) as sales_name_starts_with_count FROM sales_people WHERE sname LIKE 'A%' or sname like 'a%';
SELECT sp.sname, o.amt from orders o join sales_people sp on o.snum=sp.snum where Amt > 2000;
SELECT * FROM sales_people where city='Newyork';
SELECT * FROM sales_people WHERE city in('London','Paris'); 

SELECT * from orders o join sales_people sp on o.snum=sp.snum;
-- (or)
SELECT sname, odate, sum(amt) as amount from orders o join sales_people sp on o.snum=sp.snum group by odate, sname;




