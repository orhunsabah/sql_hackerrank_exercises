-- Population Census

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT 
	SUM(CI.POPULATION)
FROM CITY AS CI
INNER JOIN COUNTRY AS CO 
ON CI.COUNTRYCODE = CO.CODE 
WHERE CO.CONTINENT = 'Asia'


-- Average Population of Each Continent

--Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT 
	CO.CONTINENT, FLOOR(AVG(CI.POPULATION))
FROM CITY AS CI
INNER JOIN COUNTRY AS CO CI.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT


-- African Cities

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT
   CITY.NAME
FROM CITY
INNER JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code WHERE COUNTRY.Continent = 'Africa' ;