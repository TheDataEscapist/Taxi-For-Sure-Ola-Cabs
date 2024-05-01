/*Creating Database*/
create database olacabs;

/*Making the database default*/
use olacabs;

/*Dropping redundant columns*/
alter table data
drop column pickup_date;

alter table data
drop column pickup_time;

/*Adding column pickup_dt to the data table*/
alter table data
add column pickup_dt datetime;

/*Disabling the safe update mode to update data table and extract the values from a text column to the date column
(and dropping the text column thereafter)*/
SET SQL_SAFE_UPDATES = 0;

update data
set pickup_dt = Str_To_Date(pickup_datetime,"%d-%m-%Y %H:%i");

alter table data
drop column pickup_datetime;

/*Adding another column confirmed_dt to the data table*/
alter table data
add column confirmed_dt datetime;

/*Updating data table and extracting the values from a text column to the date column
(and dropping the text column thereafter)*/
update data
set confirmed_dt = Str_To_Date(confirmed_at,"%d-%m-%Y %H:%i");

alter table data
drop column confirmed_at;

/*Task 1: Make a table with count of bookings where booking_type = p2p, catgorized by booking mode as 'phone', 'online', 'app', etc*/
select booking_mode, count(*)
from data
where booking_type = "p2p"
group by booking_mode;

/*Task 2: Find top 5 drop zones in terms of average revenue*/
select zone_id, Rnk
from (select zone_id, avg(fare),
rank() over (order by avg(fare) desc) as Rnk
from data INNER JOIN localities
on data.DropArea = localities.Area
group by zone_id) as TempTable
where Rnk <= 5;

/*Task 3: Find all unique driver numbers grouped by top 5 pickzones*/
select distinct zone_id, driver_number
from (select distinct zone_id, PickupArea,
rank() over (order by sum(fare) desc) as Rnk
from data INNER JOIN localities
on data.PickupArea = localities.Area
group by zone_id) as TempTable, data
where TempTable.PickupArea = data.PickupArea
and Rnk <= 5 and driver_number is not null;

/*Task 4: Make an hourwise table of bookings for week between Nov-01 to Nov-07 and highlight the hours with more than the average no.of bookings day-wise
Step 1 - Hourwise table of bookings for week between Nov-01 to Nov-07*/
select hour(pickup_dt), count(*) as HourlyBookings
from data
where pickup_dt between '2013-11-01' and '2013-11-07'
group by hour(pickup_dt)
order by 1 ASC;

/*Step 2 - Average Daily Bookings*/
select avg(DailyBookings)
from (select day(pickup_dt), count(*) as DailyBookings
	  from data
	  group by day(pickup_dt)
	  order by 1 ASC) as TempTable;

/*Step 3 - The hours with more than the average no.of bookings day-wise between Nov-01 to Nov-07*/
select hour(pickup_dt), count(*) as HourlyBookings
from data
where pickup_dt between '2013-11-01' and '2013-11-07'
group by hour(pickup_dt)
having HourlyBookings > 
(select avg(DailyBookings)
from (select day(pickup_dt), count(*) as DailyBookings
	  from data
	  group by day(pickup_dt)
	  order by 1 ASC) as TempTable)
order by 1 ASC;