--Show the name, continent and population of all countries

SELECT name, continent, population FROM world;

--Show the name for the countries that have a population of at least 200 million

SELECT name FROM world
WHERE population >= 200000000;

--Give the name and the per capita GDP for those countries with a population of at least 200 million

SELECT name, (GDP/population) AS per_capita_GDP FROM world 
WHERE population >= 200000000;

--Show the name and population in millions for the countries of the continent 'South America'

SELECT name, (population/1000000) AS population_in_millions FROM world 
WHERE continent = 'South America';

--Show the name and population for France, Germany, Italy

SELECT name, population FROM world WHERE name IN ('Germany', 'France', 'Italy'); 

--Show the countries which have a name that includes the word 'United'

SELECT name FROM world WHERE name LIKE '%United%';

--Show the countries that are big by area or big by population. Show name, population and area

SELECT name, population, area FROM world 
WHERE (area > 3000000 AND population < 2500000000) OR (area < 3000000 AND population > 250000000);

-- Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
--Australia has a big area but a small population, it should be included.
--Indonesia has a big population but a small area, it should be included.
--China has a big population and big area, it should be excluded.
--United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area FROM world 
WHERE (area > 3000000 AND population < 250000000) OR (area < 3000000 AND population > 250000000);

--Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Show the values to two decimal places

SELECT name, ROUND(population/1000000, 2) AS popullation_in_millions, ROUND(GDP/1000000000, 2) AS GDP_in_billions FROM world 
WHERE continent = 'South America';
 
--Show per-capita GDP for the trillion dollar countries to the nearest $1000

SELECT name, ROUND(GDP/population, -3) AS per_capita_GDP_in_Trillions FROM world 
WHERE GDP > 1000000000000;

--Show the name and capital where the name and the capital have the same number of characters

SELECT name, capital FROM world
 WHERE LEN(name) = LEN(capital);

--Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word

SELECT name, capital FROM world 
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital;

--Find the country that has all the vowels and no spaces in its name

SELECT name From world 
WHERE name LIKE '%a%'
AND name LIKE '%e'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%';
