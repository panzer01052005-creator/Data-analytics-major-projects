-- ============================================
-- AIRLINE & FLIGHT ANALYTICS DATABASE
-- ============================================

CREATE DATABASE Airline_Flight_Analytics;
USE Airline_Flight_Analytics;


-- ============================================
-- 1. AIRLINES TABLE
-- ============================================

CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO Airlines VALUES
(1, 'IndiGo', 'India'),
(2, 'Air India', 'India'),
(3, 'Vistara', 'India'),
(4, 'SpiceJet', 'India'),
(5, 'Emirates', 'UAE');


-- ============================================
-- 2. AIRPORTS TABLE
-- ============================================

CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    airport_code VARCHAR(10),
    airport_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO Airports VALUES
(1, 'DEL', 'Indira Gandhi International Airport', 'Delhi', 'India'),
(2, 'BOM', 'Chhatrapati Shivaji Maharaj Airport', 'Mumbai', 'India'),
(3, 'BLR', 'Kempegowda International Airport', 'Bangalore', 'India'),
(4, 'HYD', 'Rajiv Gandhi International Airport', 'Hyderabad', 'India'),
(5, 'CCU', 'Netaji Subhas Chandra Bose Airport', 'Kolkata', 'India'),
(6, 'DXB', 'Dubai International Airport', 'Dubai', 'UAE');


-- ============================================
-- 3. FLIGHTS TABLE
-- ============================================

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(20),
    airline_id INT,
    source_airport INT,
    destination_airport INT,
    flight_date DATE,
    scheduled_departure TIME,
    actual_departure TIME,
    scheduled_arrival TIME,
    actual_arrival TIME,
    status VARCHAR(20),
    delay_minutes INT,
    cancellation_reason VARCHAR(100),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (source_airport) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport) REFERENCES Airports(airport_id)
);

INSERT INTO Flights VALUES
(101,'6E101',1,1,2,'2026-01-05','08:00','08:20','10:00','10:15','Completed',20,NULL),
(102,'AI202',2,2,1,'2026-01-06','09:00','09:45','11:00','11:50','Completed',45,NULL),
(103,'UK303',3,1,3,'2026-01-07','10:00','10:05','12:30','12:35','Completed',5,NULL),
(104,'SG404',4,3,4,'2026-01-08','14:00','14:40','15:30','16:20','Completed',40,NULL),
(105,'EK505',5,1,6,'2026-01-09','18:00','18:10','21:00','21:15','Completed',10,NULL),
(106,'6E106',1,2,3,'2026-01-10','07:30','07:30','09:00','08:55','Completed',0,NULL),
(107,'AI207',2,3,1,'2026-01-11','12:00',NULL,'14:00',NULL,'Cancelled',0,'Technical Problem'),
(108,'SG408',4,4,1,'2026-01-12','15:00','16:30','17:30','19:00','Completed',90,NULL),
(109,'UK309',3,1,5,'2026-01-13','11:00','11:25','13:30','14:00','Completed',25,NULL),
(110,'EK510',5,6,1,'2026-01-14','20:00','20:05','23:00','23:10','Completed',5,NULL),
(111,'6E111',1,1,4,'2026-01-15','06:00','06:15','08:30','08:50','Completed',15,NULL),
(112,'AI212',2,2,5,'2026-01-16','13:00','13:50','15:30','16:20','Completed',50,NULL),
(113,'SG413',4,3,2,'2026-01-17','16:00',NULL,'18:00',NULL,'Cancelled','0','Weather'),
(114,'UK314',3,5,1,'2026-01-18','09:00','09:10','11:30','11:45','Completed',10,NULL),
(115,'6E115',1,4,2,'2026-01-19','17:00','17:30','19:00','19:40','Completed',30,NULL);


-- ============================================
-- 4. PASSENGERS TABLE
-- ============================================

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    flight_id INT,
    passenger_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    travel_class VARCHAR(20),
    ticket_price DECIMAL(10,2),
    booking_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Passengers VALUES
(1,101,'Rahul Sharma',28,'Male','Economy',5500,'2025-12-20'),
(2,101,'Priya Singh',25,'Female','Economy',5500,'2025-12-21'),
(3,102,'Amit Kumar',35,'Male','Business',12500,'2025-12-22'),
(4,103,'Neha Verma',29,'Female','Economy',6200,'2025-12-25'),
(5,104,'Rohan Gupta',40,'Male','Economy',4800,'2025-12-26'),
(6,105,'Anjali Mehta',32,'Female','Business',25000,'2025-12-28'),
(7,106,'Vikas Yadav',26,'Male','Economy',4500,'2025-12-29'),
(8,108,'Sneha Jain',31,'Female','Economy',5100,'2025-12-30'),
(9,109,'Arjun Kapoor',38,'Male','Business',11000,'2026-01-01'),
(10,110,'Pooja Agarwal',27,'Female','Economy',22000,'2026-01-02'),
(11,111,'Karan Singh',30,'Male','Economy',6000,'2026-01-03'),
(12,112,'Simran Kaur',24,'Female','Economy',5800,'2026-01-04'),
(13,114,'Manish Tiwari',45,'Male','Business',9000,'2026-01-05'),
(14,115,'Riya Sharma',22,'Female','Economy',5200,'2026-01-06');


-- ============================================
-- 5. REVENUE TABLE
-- ============================================

CREATE TABLE Revenue (
    revenue_id INT PRIMARY KEY,
    flight_id INT,
    ticket_revenue DECIMAL(12,2),
    baggage_revenue DECIMAL(12,2),
    food_revenue DECIMAL(12,2),
    other_revenue DECIMAL(12,2),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Revenue VALUES
(1,101,11000,1000,800,200),
(2,102,12500,1200,600,300),
(3,103,6200,700,500,100),
(4,104,4800,500,300,100),
(5,105,25000,2500,1500,500),
(6,106,4500,400,300,100),
(7,108,5100,600,350,100),
(8,109,11000,1000,700,200),
(9,110,22000,2200,1200,400),
(10,111,6000,600,400,100),
(11,112,5800,500,350,100),
(12,114,9000,800,600,150),
(13,115,5200,500,300,100);


-- ============================================
-- MODULE 1: FLIGHT PERFORMANCE
-- ============================================

SELECT
    f.flight_number,
    a.airline_name,
    f.status,
    f.delay_minutes
FROM Flights f
JOIN Airlines a
ON f.airline_id = a.airline_id;


-- Average Delay
SELECT
    AVG(delay_minutes) AS average_delay
FROM Flights
WHERE status = 'Completed';


-- On-Time Flights
SELECT COUNT(*) AS on_time_flights
FROM Flights
WHERE delay_minutes <= 15
AND status = 'Completed';


-- ============================================
-- MODULE 2: DELAY ANALYSIS
-- ============================================

SELECT
    f.flight_number,
    a.airline_name,
    f.delay_minutes
FROM Flights f
JOIN Airlines a
ON f.airline_id = a.airline_id
WHERE f.delay_minutes > 15
ORDER BY f.delay_minutes DESC;


-- Delay by Airline
SELECT
    a.airline_name,
    AVG(f.delay_minutes) AS average_delay
FROM Flights f
JOIN Airlines a
ON f.airline_id = a.airline_id
WHERE f.status = 'Completed'
GROUP BY a.airline_name;


-- ============================================
-- MODULE 3: CANCELLATION ANALYSIS
-- ============================================

SELECT
    f.flight_number,
    a.airline_name,
    f.cancellation_reason
FROM Flights f
JOIN Airlines a
ON f.airline_id = a.airline_id
WHERE f.status = 'Cancelled';


-- Total Cancelled Flights
SELECT COUNT(*) AS cancelled_flights
FROM Flights
WHERE status = 'Cancelled';


-- Cancellation Reason Analysis
SELECT
    cancellation_reason,
    COUNT(*) AS total
FROM Flights
WHERE status = 'Cancelled'
GROUP BY cancellation_reason;


-- ============================================
-- MODULE 4: PASSENGER ANALYTICS
-- ============================================

-- Total Passengers
SELECT COUNT(*) AS total_passengers
FROM Passengers;


-- Passenger by Gender
SELECT
    gender,
    COUNT(*) AS total_passengers
FROM Passengers
GROUP BY gender;


-- Passenger by Travel Class
SELECT
    travel_class,
    COUNT(*) AS passengers
FROM Passengers
GROUP BY travel_class;


-- Average Ticket Price
SELECT
    AVG(ticket_price) AS average_ticket_price
FROM Passengers;


-- ============================================
-- MODULE 5: ROUTE ANALYTICS
-- ============================================

SELECT
    ap.airport_code AS source,
    ad.airport_code AS destination,
    COUNT(*) AS total_flights,
    AVG(f.delay_minutes) AS average_delay
FROM Flights f
JOIN Airports ap
ON f.source_airport = ap.airport_id
JOIN Airports ad
ON f.destination_airport = ad.airport_id
GROUP BY ap.airport_code, ad.airport_code;


-- ============================================
-- MODULE 6: AIRPORT PERFORMANCE
-- ============================================

SELECT
    ap.airport_code,
    ap.airport_name,
    COUNT(f.flight_id) AS total_flights
FROM Airports ap
LEFT JOIN Flights f
ON ap.airport_id = f.source_airport
GROUP BY ap.airport_id;


-- Average Delay by Airport
SELECT
    ap.airport_code,
    AVG(f.delay_minutes) AS average_delay
FROM Airports ap
JOIN Flights f
ON ap.airport_id = f.source_airport
GROUP BY ap.airport_code;


-- ============================================
-- MODULE 7: AIRLINE PERFORMANCE
-- ============================================

SELECT
    a.airline_name,
    COUNT(f.flight_id) AS total_flights,
    SUM(CASE
        WHEN f.status = 'Completed' THEN 1
        ELSE 0
    END) AS completed_flights,
    SUM(CASE
        WHEN f.status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_flights,
    AVG(f.delay_minutes) AS average_delay
FROM Airlines a
LEFT JOIN Flights f
ON a.airline_id = f.airline_id
GROUP BY a.airline_id;


-- ============================================
-- MODULE 8: REVENUE DASHBOARD
-- ============================================

SELECT
    SUM(ticket_revenue) AS ticket_revenue,
    SUM(baggage_revenue) AS baggage_revenue,
    SUM(food_revenue) AS food_revenue,
    SUM(other_revenue) AS other_revenue,
    SUM(
        ticket_revenue +
        baggage_revenue +
        food_revenue +
        other_revenue
    ) AS total_revenue
FROM Revenue;


-- Revenue by Airline
SELECT
    a.airline_name,
    SUM(
        r.ticket_revenue +
        r.baggage_revenue +
        r.food_revenue +
        r.other_revenue
    ) AS total_revenue
FROM Revenue r
JOIN Flights f
ON r.flight_id = f.flight_id
JOIN Airlines a
ON f.airline_id = a.airline_id
GROUP BY a.airline_name
ORDER BY total_revenue DESC;


-- Revenue by Flight
SELECT
    f.flight_number,
    SUM(
        r.ticket_revenue +
        r.baggage_revenue +
        r.food_revenue +
        r.other_revenue
    ) AS total_revenue
FROM Revenue r
JOIN Flights f
ON r.flight_id = f.flight_id
GROUP BY f.flight_number
ORDER BY total_revenue DESC;