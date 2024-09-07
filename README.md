# Taxi-For-Sure-Ola-Cabs
### Situation:
Developed a comprehensive SQL database project to analyze and optimize the booking and locality data for a taxi service.

### Task:
Create and manage a database consisting of 2 tables - localities and data. The project required treating and updating the data using SQL commands and functions to derive meaningful insights and enhance the decision-making processes.

### Action:
#### > Database Design and Setup
1. DDL Commands: Created the database and altered the table.
2. DML Commands: Updated records to ensure data accuracy and integrity.
3. Datetime Functions: Transformed text fields into proper datetime formats for accurate analysis.
#### > Data Analysis and Querying
1. Aggregate Functions & Group By: Generated a table with the count of bookings where booking_type = 'p2p', categorized by Booking_mode using GROUP BY.
2. Window Functions: Calculated the top 5 drop zones in terms of average revenue.
3. Distinct & Inner Join: Identified all unique driver numbers grouped by the top 5 pickup zones.
4. Common Table Expressions and Aliases: Used CTEs along with aliases to simplify complex queries and improve readability.
5. IS NOT NULL Operator: Filtered non-null values to ensure data accuracy.
#### > Detailed Reporting
1. Hourwise Bookings: Created an hour-wise booking table for the week of Nov-01 to Nov-07, highlighting hours with more than the average number of bookings on a day-wise basis.

### Result:
Efficiently organized and analyzed booking data, providing actionable insights that helped in understanding booking patterns, driver distribution, and revenue generation. The use of advanced SQL functions and commands ensured that the data was treated accurately and queries were optimized for performance.
