USE World;

#2 Using a UNION query, create a report that lists the name and the district of the cities in Canada
#(code CAN) and the Netherlands (code NLD). Note that this query can be written without using a
#UNION. The purpose of this question is to use UNION. (city table)

SELECT 
    Name, District
FROM
    City 
UNION SELECT 
    Name, District
FROM
    City
WHERE
    CountryCode = 'NLD'
        OR CountryCode = 'NLD';
        
#3 Using an INNER JOIN..ON, create a report that list the name of cities, the country and the
#indepyear of all countries whose indepYear field is not null. (city and country tables).


SELECT 
    City.Name, Country.Name, Country.IndepYear
FROM
    City
        INNER JOIN
    Country ON City.CountryCode = Country.Code
WHERE
    IndepYear IS NOT NULL;
    
#4 Rewrite the previous query using WHERE/FROM.


SELECT 
    City.Name, Country.Name, Country.IndepYear
FROM
    City,
    Country
WHERE
    City.CountryCode = Country.Code
        AND IndepYear IS NOT NULL;
        
#5 Using a subquery, list the name of the city, the countrycode, the population and the average city
#population of all cities with a population less than the average population. (city table)


SELECT 
    Name, CountryCode, Population
FROM
    City
WHERE
    Population < (SELECT 
            AVG(Population)
        FROM
            City);

#6 Using INNER JOIN ..ON, write a query that displays, for the city of Toronto, the name of the city
#and the head of state of its country. (city and country tables)
SELECT 
    City.Name, Country.HeadOfState
FROM
    City
        INNER JOIN
    Country ON City.COuntryCode = Country.Code
WHERE
    City.Name = 'Toronto'; 

#7 Using INNER JOIN ..ON the three tables, write a query that displays the name of the city, the city
#continent, the city head of state, the year of independance and the percentage of people who
#speaks English in the city of Toronto. (city, countrylanguage and country tables)


SELECT 
    c.Name,
    co.continent,
    co.HeadOfState,
    co.IndepYear,
    cl.Language,
    (c.population * cl.Percentage / 100) AS total_speakers
FROM ((City As c
INNER JOIN Country As co ON c.CountryCode = co.Code)
INNER JOIN CountryLanguage As cl ON c.CountryCode = cl.CountryCode)
WHERE c.Name ="Toronto" AND cl.Language = "English";


#8 Rewrite the previous query using WHERE/FROM.


SELECT 
    c.Name,
    co.continent,
    co.HeadOfState,
    co.IndepYear,
    cl.Language,
    (c.population * cl.Percentage / 100) AS total_speakers
FROM
    City AS c,
    Country AS co,
    CountryLanguage AS cl
WHERE
    c.CountryCode = co.Code
        AND c.CountryCode = cl.CountryCode
        AND c.Name = 'Toronto'
        AND cl.Language = 'English';

#9 Using a subquery, list the name of the city, the countrycode and the population of the city with
#the largest population. (city table)


SELECT 
    Name, CountryCode, Population
FROM
    City
WHERE
    Population = (SELECT 
            MAX(Population)
        FROM
            City);
            
#10 Using a subquery, list the name of the city, the countrycode and the population of all the cities
#whose population is larger than the average population. (city table)


SELECT 
    Name, CountryCode, Population
FROM
    City
WHERE
    Population >(SELECT 
            AVG(Population)
        FROM
            City);
            
            
#11 What is wrong with the following subquery?
#SELECT name,countrycode,population,avg(population)
#FROM city
#WHERE population > (SELECT avg(population) FROM city)


SELECT 
    name, countrycode, population
FROM
    city
WHERE
    population > (SELECT 
            AVG(population)
        FROM
            city);
            
#12 Replace the first avg(population) with (SELECT AVG(population) from city)
#What happens? Why? --ANSWER: If we put it in SELECT, only one valuue return
SELECT 
    name, countrycode, population , (SELECT AVG(population) from city)
FROM
    city
WHERE
    population > (SELECT 
            AVG(population)
        FROM
            city);
            
            
#13 Using a subquery, list the name of the country, the continent and the life expectancy of all
#countries whose life expectancy is less than the average life expectancy. (country table)


SELECT 
    Name, Continent, LifeExpectancy
FROM
    Country
WHERE
    LifeExpectancy < (SELECT 
            AVG(LifeExpectancy)
        FROM
            Country);