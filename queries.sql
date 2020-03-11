--How many entries in the countries table are from Africa?

SELECT COUNT(*)
from countries
WHERE continent = 'Africa'
;

--What was the total population of the continent of Oceania in 2005?

SELECT countries.continent,
  ROUND(SUM(population_years.population), 2) AS 'total population',
  population_years.year
from population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE population_years.year = '2005' AND
  countries.continent = 'Oceania'
;

--What is the average population of countries in South America in 2003?

SELECT countries.continent,
  ROUND(AVG(population_years.population), 2) AS 'average population',
  population_years.year
from population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE population_years.year = '2003' AND
  countries.continent = 'South America'
;

--What country had the smallest population in 2007?

SELECT countries.name,
  population_years.population,
  population_years.year
from population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE population_years.population IS NOT NULL AND
  population_years.year = '2007'
ORDER BY 2 ASC
LIMIT 1
;

--What is the average population of Poland during the time period covered by this dataset?

SELECT countries.name,
  ROUND(AVG(population_years.population), 2) AS 'average population'
from population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE countries.name = 'Poland'
;

--How many countries have the word “The” in their name?

SELECT COUNT(*)
from countries
WHERE name LIKE '%The%'
;

--What was the total population of each continent in 2010?

SELECT countries.continent,
  ROUND(SUM(population_years.population), 2) AS 'average population',
  population_years.year
from population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE population_years.year = '2010'
GROUP BY 1
ORDER BY 2 DESC
;
