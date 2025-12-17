
CREATE TABLE ola_db (
    date DATE,
    time TIME,
    booking_id TEXT,
    booking_status TEXT,
    customer_id TEXT,
    vehicle_type TEXT,
    pickup_location TEXT,
    drop_location TEXT,
    v_tat INT,
    c_tat INT,
    canceled_rides_by_customer TEXT,
    canceled_rides_by_driver TEXT,
    incomplete_rides TEXT,
    incomplete_rides_reason TEXT,
    booking_value NUMERIC,
    payment_method TEXT,
    ride_distance NUMERIC,
    driver_ratings NUMERIC,
    customer_rating NUMERIC
);

Select * from ola_db;


--1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM ola_db
WHERE Booking_Status = 'Success';

Select * from Successful_Bookings;


--2. Find the average ride distance for each vehicle type:
Create View Ride_distance_for_each_vehicle_s As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM ola_db
GROUP BY Vehicle_Type;

Select * from Ride_distance_for_each_vehicle_s;


--3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customer_s AS
SELECT COUNT(*) AS total_cancelled_rides
FROM ola_db
WHERE booking_status = 'Canceled by Customer';

Select * from cancelled_rides_by_customer_s;


-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customer_s As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM ola_db
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

Select * from Top_5_Customer_s;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_canceled_by_Drivers_P_C_Issue As
SELECT COUNT(*) FROM ola_db
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * from Rides_canceled_by_Drivers_P_C_Issue;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM ola_db WHERE Vehicle_Type = 'Prime Sedan';

Select * from Max_Min_Driver_Rating;


-- 7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM ola_db
WHERE Payment_Method = 'UPI';

Select * from UPI_Payment;


-- 8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM ola_db
GROUP BY Vehicle_Type;

Select * from AVG_Cust_Rating;


-- 9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM ola_db
WHERE Booking_Status = 'Success';

Select * from total_successful_ride_value;


-- 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM ola_db
WHERE Incomplete_Rides = 'Yes';

Select * from Incomplete_Rides_Reason;


------------------------------------ END --------------------------------------------
