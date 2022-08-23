-- Revising Aggregations - The Count Function

-- Query a count of the number of cities in CITY having a Population larger than 100000.

SELECT COUNT(NAME)
FROM CITY WHERE POPULATION > 100000


-- Revising Aggregations - The Sum Function

-- Query the total population of all cities in CITY where District is California.

SELECT SUM(POPULATION) 
FROM CITY WHERE District = 'California'


-- Revising Aggregations - Averages

-- Query the average population of all cities in CITY where District is California.

SELECT AVG(POPULATION) 
FROM CITY WHERE District = 'California'


-- Average Population

-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(POPULATION),0)
FROM CITY


-- Japan Population

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(POPULATION) 
FROM CITY WHERE COUNTRYCODE = 'JPN'


-- Population Density Difference

-- Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY

-- Weather Observation Station 2

-- Query the following two values from the STATION table:

--The sum of all values in LAT_N rounded to a scale of 2 decimal places.
--The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SELECT
	ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2) FROM STATION

-- Weather Observation Station 13

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

SELECT ROUND(SUM(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345 AND LAT_N > 388.7880


-- Weather Observation Station 14

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

SELECT 
	ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345


-- Weather Observation Station 15

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 . Round your answer to 4 decimal places.

SELECT 
	ROUND((LONG_W),4) FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345)


-- Weather Observation Station 16

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . Round your answer to 4 decimal places.

SELECT 
	ROUND((LAT_N),4) FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)


-- Weather Observation Station 17

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

SELECT 
	ROUND((LONG_W),4) FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)


--The Blunder

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

SELECT 
	CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))
FROM CITY


-- Weather Observation Station 18

-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

 --A happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 --B happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 --C happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 --D happens to equal the maximum value in Western Longitude (LONG_W in STATION).
 --Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

SELECT
	ROUND(MAX(LAT_N) - MIN(LAT_N) + MAX(LONG_W) - MIN(LONG_W) , 4)
FROM STATION


-- Weather Observation Station 19

-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

--Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

SELECT ROUND(
SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2))
	,4)
FROM STATION


-- Top Earners

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT MAX(SALARY*MONTHS), COUNT(SALARY*MONTHS) FROM EMPLOYEE
WHERE SALARY*MONTHS = (SELECT MAX(SALARY*MONTHS) FROM EMPLOYEE)
