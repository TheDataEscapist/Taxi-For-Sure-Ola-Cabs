# Taxi-For-Sure-Ola-Cabs
This database consists of 2 tables - data and localities. The table 'data' contains information about the bookings. Here, the unique ID is the Booking_id. The columnar distribution of both the tables are given as follows:
#### data
pickup_date text,	pickup_time text, pickup_datetime text, PickupArea text, DropArea text, Booking_id text, Booking_type text, Booking_mode text, Driver_number int, Service_status text, Status int, Fare int, Distance int, Confirmed_at text
#### localities
id int, Area text, city_id int, zone_id int
### Tasks & Objectives:
After treating and updating the data with proper datetime functions, the below tasks need to be performed.
1. Make a table with count of bookings where booking_type = p2p, catgorized by booking mode as 'phone', 'online', 'app', etc.
2. Find top 5 drop zones in terms of average revenue.
3. Find all unique driver numbers grouped by top 5 pickzones.
4. Make an hourwise table of bookings for week between Nov-01 to Nov-07 and highlight the hours with more than the average number of bookings day-wise.
