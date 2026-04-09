create database ola;
use ola;

/* 1. Retrieve all successful bookings:*/
create view Succesfull_Booking as
select * from bookings 
where Booking_Status = "Success" ; 

/*2. Find the average ride distance for each vehicle type */
create view Average_Ride_Distance_Of_Each_Vehicle as
	select Vehicle_Type, avg(Ride_Distance) as Average_Distance
	from bookings
	group by Vehicle_Type ;
    
SELECT * FROM ola.average_ride_distance_of_each_vehicle;

 
/* 3. Get the total number of cancelled rides by customers */
 create view Cancelled_Rides_Customers as
 select count(*) from bookings
 where Booking_Status = "Canceled by Customer";
 SELECT * FROM ola.average_ride_distance_of_each_vehicle;
 
 SELECT * FROM ola.Cancelled_Rides_Customers;
 
 
/* 4. List the top 5 customers who booked the highest number of rides: */
create view Top_5_customers as
SELECT Customer_ID, COUNT(*) AS total_rides
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM ola.top_5_customers;

/* 5. Get the number of rides cancelled by drivers due to personal and car-related issues: */
 create view rides_cancelled_by_drivers as
 select count(*) from bookings
 where Canceled_Rides_by_Driver = "Personal & Car related issue";

SELECT * FROM ola.rides_cancelled_by_drivers;
 
/* 6. Find the maximum and minimum driver ratings for Prime Sedan bookings  */
create view Max_Min_Rating as
select max(Driver_Ratings) as Maximum_Rating, min(Driver_Ratings) as Minimum_Rating
  from bookings 
  where Vehicle_Type = "Prime Sedan";
  
  SELECT * FROM ola.max_min_rating;
  
  
  /* 7. Retrieve all rides where payment was made using UPI: */ 
  create view UPI_payment as
 select * from bookings where Payment_Method = "UPI";
 
 SELECT * FROM ola.upi_payment;
 
 /* 8. Find the average customer rating per vehicle type: */
 create view Averege_Customer_Rating as
 select Vehicle_Type, avg(Customer_Rating) as AVG_Cusomer_Rating from bookings
 group by Vehicle_Type;
 
 SELECT * FROM ola.averege_customer_rating;
 
 /* 9. Calculate the total booking value of rides completed successfully: */
 create view  Total_Succesfull_Ride_Value as
 select Sum(Booking_Value) as Total_Succesfull_Ride_Value from bookings
where  Booking_Status = "Success";

SELECT * FROM ola.total_succesfull_ride_value;

/* 10. List all incomplete rides along with the reason: */
create view Incomplete_Ride_with_Reason as 
select Customer_ID,Vehicle_Type,Incomplete_Rides_Reason,Incomplete_Rides from bookings
where Incomplete_Rides = "Yes";

SELECT * FROM ola.incomplete_ride_with_reason;
