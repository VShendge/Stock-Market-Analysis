create table `Bajaj Auto`(
`Date` text not null,
 `Open Price` double not NULL,
 `High Price` double  not NULL,
 `Low Price` double  not NULL,
 `Close Price` double not NULL,
 `WAP` double  not null,
 `No.of Shares` int not NULL,
 `No.of Trades` int   not NULL,
 `Total Turnover (Rs.)` double  not NULL,
 `Deliverable Quantity` double  not NULL,
 `% Deli. Qty to Traded Qty`double not NULL,
 `Spread High-Low` double  not NULL,
 `Spread close-open` double not NULL
 );
load data infile 'E:\Assignment\\Bajaj Auto.csv'ignore   #as the complete data is copied to E drive.
into table `Bajaj Auto`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%d-%M-%Y');
select*
from `Bajaj Auto`;

# creating table for other companies

create table `Eicher Motors` like `Bajaj Auto`;
load data infile 'E:\Assignment\\Eicher Motors.csv'ignore
into table `Eicher Motors`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%D-%M-%Y');
select *
from `Eicher Motors`;

create table `Hero Motocorp` like `Bajaj Auto`;
load data infile 'E:\Assignment\\Hero Motocorp.csv'ignore
into table `Hero Motocorp`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%d-%M-%Y');
select *
from `Hero Motocorp`;

create table `Infosys` like `Bajaj Auto`;
load data infile 'E:\Assignment\\Infosys.csv'ignore
into table `Infosys`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%d-%M-%Y');
select *
from `Infosys`;

create table `TCS` like `Bajaj Auto`;
load data infile 'E:\Assignment\\TCS.csv'ignore
into table `TCS`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%d-%M-%Y');
select *
from `TCS`;

create table `TVS Motors` like `Bajaj Auto`;
load data infile 'E:\Assignment\\TVS Motors.csv'ignore
into table `TVS Motors`
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(`Date`,
`Open Price`,
`High Price`,`Low Price`, `Close Price`, `WAP`,
`No.of Shares`,
 `No.of Trades`,
 `Total Turnover (Rs.)`,
 `Deliverable Quantity`, 
 `% Deli. Qty to Traded Qty`,
`Spread High-Low`,
`Spread Close-Open`)
set `Date` = str_to_date(`Date`, '%d-%M-%Y');
select *
from `TVS Motors`;

#Task1: create table bajaj1

create table bajaj1(`Date` text, 
`Close Price` double,
 `20 Day MA` float(10,2),
 `50 Day MA` float(10,2) );

# inserting value into bajaj1 and calculating moving avg

insert into bajaj1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `Bajaj Auto` order by Date;

#updating table and setting null value limit till 19 row
 update bajaj1
 set `20 Day MA`= null limit 19;
 
  update bajaj1
 set `50 Day MA`= null limit 49;
 
 # repeating the same process for remaining companies
 
 create table eicher1 like bajaj1;
insert into eicher1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `Eicher Motors`;

#updating table and setting null value limit till 19 row
 update eicher1
 set `20 Day MA`= null limit 19;
 
  update eicher1
 set `50 Day MA`= null limit 49;
 
create table hero1 like bajaj1;
insert into hero1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `Hero Motocorp`;

#updating table and setting null value limit till 19 row
 update hero1
 set `20 Day MA`= null limit 19;
 
  update hero1
 set `50 Day MA`= null limit 49;
 
 create table infosys1 like bajaj1;
 insert into infosys1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `Infosys`;

#updating table and setting null value limit till 19 row
 update infosys1
 set `20 Day MA`= null limit 19;
 
  update infosys1
 set `50 Day MA`= null limit 49;

 create table tvs1 like bajaj1;
insert into tvs1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `TVS Motors`;

#updating table and setting null value limit till 19 row
 update tvs1
 set `20 Day MA`= null limit 19;
 
  update tvs1
 set `50 Day MA`= null limit 49;
 
create table tcs1 like bajaj1;
insert into tcs1(`Date`,`Close Price`, `20 Day MA`,`50 Day MA`)
select `Date`,`Close Price`,
avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),
avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row)
from `TCS`;

select*
from bajaj1;

#updating table and setting null value limit till 19 row
 update tcs1
 set `20 Day MA`= null limit 19;
 
  update tcs1
 set `50 Day MA`= null limit 49;

 select*
from bajaj1;	

# task1 completed

# task2: creating a master table for date and close price of every stock. 
# here master table is named as stock1.
create table stock1(
Date text, 
Bajaj double, 
TCS double, 
TVS double,
Infosys double,
Eicher double,
Hero double
);
 select*
 from stock1;
 
insert into stock1(`Date`,Bajaj,TCS,TVS,Infosys,Eicher,Hero)
select b.`Date`, b.`Close Price`, tcs.`Close Price`, tvs.`Close Price`, inf.`Close Price`, ei.`Close Price`, h.`Close Price`
from bajaj1 b inner join 
tcs1 tcs on tcs.`date`=b.`date`
inner join tvs1 tvs on tvs.`date`=b.`date`
inner join infosys1 inf on inf.`date`=b.`date`
inner join eicher1 ei on ei.`date`=b.`date`
inner join hero1 h on h.`date`=b.`date`;


#task 3:Create a new table named 'Bajaj Temp' to calculate the 'Prev Day 20','Prev Day 50'. 

create table `Bajaj Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);

# Inserting value into 'Bajaj Temp' from 'bajaj1' and calculating its moving average.

insert into `Bajaj Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   bajaj1 order by `Date`;

# Create a new table named 'Eicher Temp' to calculate the 'Prev Day 20','Prev Day 50'. 

create table `Eicher Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);
# Inserting value into 'Eicher Temp' from 'eicher1' and calculating its moving average.

insert into `Eicher Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   eicher1 order by `Date`;

#  Create a new table named 'Hero Temp' to calculate the 'Prev Day 20','Prev Day 50'. 
create table `Hero Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);
# Inserting value into 'Hero Temp' from 'hero1' and calculating its moving average.
insert into `Hero Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   hero1 order by `Date`;


#  Create a new table named 'Infosys Temp' to calculate the 'Prev Day 20','Prev Day 50'. 
create table `Infosys Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);
# Inserting value into 'Infosys Temp' from 'infosys1' and calculating its moving average.
insert into `Infosys Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   infosys1 order by `Date`;

#  Create a new table named 'Tcs Temp' to calculate the 'Prev Day 20','Prev Day 50'. 
create table `Tcs Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);
# Inserting value into 'Tcs Temp' from 'tcs1' and calculating its moving average.
insert into `Tcs Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   tcs1 order by `Date`;

#  Create a new table named 'Tvs Temp' to calculate the 'Prev Day 20','Prev Day 50'. 
create table `Tvs Temp`(
`Date` text,
`Close Price` double,
`20 Day MA` float(10,2),
`50 Day MA` float(10,2),
`Prev Day 20` float(10,2),
`Prev Day 50` float(10,2)
);
# Inserting value into 'Tvs Temp' from 'tvs1' and calculating its moving average.
insert into `Tvs Temp`(`Date`,`Close Price`,`20 Day MA`,`50 Day MA`, `Prev Day 20`,`Prev Day 50`) 
select `Date`,
       `Close Price`,
       AVG(`20 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 19 PRECEDING) ,
       AVG(`50 Day MA`) OVER (PARTITION BY `Close Price` ORDER BY Date asc ROWS 49 PRECEDING) ,
	LAG(`20 Day MA`, 1) OVER (ORDER BY `Date`) ,
	LAG(`50 Day MA`, 1) OVER (ORDER BY `Date`) 
FROM   tvs1 order by `Date`;

#task 3. Create table 'bajaj2' to generate 'Signal'


 CREATE TABLE bajaj2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'bajaj2'.
Insert into bajaj2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `bajaj temp`;

# Create table 'eicher2' to generate 'Signal'
 CREATE TABLE eicher2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'eicher2'.
Insert into eicher2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `eicher temp`;

# Create table 'hero2' to generate 'Signal'
 CREATE TABLE hero2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'hero2'.
Insert into hero2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `hero temp`;

# Create table 'infosys2' to generate 'Signal'
 CREATE TABLE infosys2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'infosys2'.
Insert into infosys2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `infosys temp`;

# Create table 'tcs2' to generate 'Signal'
 CREATE TABLE tcs2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'tcs2'.
Insert into tcs2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `tcs temp`;

# Create table 'tvs2' to generate 'Signal'
 CREATE TABLE tvs2(
 `Date` text,
 `Close Price` double, 
 `Signal` text
 ) ;
# Insert value into 'tvs2'.
Insert into tvs2(`Date`,`Close Price`,`Signal`) 
 Select `Date`,
       `Close Price`,
       CASE 
        WHEN `20 Day MA` > `50 Day MA` AND `Prev Day 20` < `Prev Day 50` THEN "BUY"
        WHEN `20 Day MA` < `50 Day MA` AND `Prev Day 20` > `Prev Day 50` THEN "SELL"
       ELSE  "HOLD "END as `Signal`
FROM  `tvs temp`;


#task 4. Create a User defined function 'get signal'.
create function `Get Signal`( `date 1` text)
returns char(10) deterministic
return (select `Signal` from bajaj2 where Date=`date 1`);

# Calling the UDF.
Select `Get Signal`('2015-05-12') as Status;