USE World;
#Querying tables city and country:
#1
SELECT 
    c.Name, c.Population, cy.Continent
FROM
    City AS c
        INNER JOIN
    Country AS cy ON c.CountryCode = cy.Code
ORDER BY Continent , Population , Name;
#2
SELECT 
    c.Name, c.Population, cy.Continent
FROM
    City AS c,
    Country AS cy
WHERE
    c.CountryCode = cy.Code
ORDER BY Continent , Population , Name;
#3
SELECT 
    c.Name, c.Population, cy.Continent
FROM
    City AS c
        INNER JOIN
    Country AS cy ON c.CountryCode = cy.Code
WHERE
    IndepYear = 1960
ORDER BY Continent , Population , Name;
#4
SELECT 
    c.Name, c.Population, cy.Continent
FROM
    City AS c,
    Country AS cy
WHERE
    c.CountryCode = cy.Code
        AND IndepYear = 1960
ORDER BY Continent , Population , Name;
#5
SELECT 
    city.Name, country.HeadOfState
FROM
    City
        INNER JOIN
    Country ON city.CountryCode = country.Code
WHERE
    city.Name = 'Ottawa';
#6
SELECT 
    city.Name, city.Population, country.Continent, country.Population
FROM
    City
        INNER JOIN
    Country ON city.CountryCode = country.Code
WHERE
    city.Name = 'Toronto';
    
#Querying tables city and countryLanguage:
#1
SELECT 
    city.Name,
    countryLanguage.Language,
    countryLanguage.Percentage
FROM
    City
        INNER JOIN
    CountryLanguage ON city.CountryCode = countryLanguage.CountryCode
    WHERE city.Name = 'Ottawa';
#2
SELECT 
    name, language, isOfficial, Percentage
FROM
    City,
    CountryLanguage
WHERE
    city.Name = 'Ottawa'
        AND countryLanguage.CountryCode = city.CountryCode
        AND CountryLanguage.isOfficial = TRUE;
#3
SELECT 
    c.name,
    co.language,
    co.isOfficial,
    co.Percentage,
    (c.population * co.Percentage / 100) AS total_speakers
FROM
    City AS c
        INNER JOIN
    CountryLanguage AS co ON co.CountryCode = c.CountryCode
WHERE
    c.Name = 'Ottawa'
        AND (co.isOfficial = TRUE
        OR co.language = 'Polish');
#4
SELECT 
    c.name, co.language, SUM(co.percentage)
FROM
    City AS c
        INNER JOIN
    CountryLanguage AS co ON co.CountryCode = c.CountryCode
WHERE
    c.Name = 'Ottawa'
        AND (co.isOfficial = TRUE
        OR co.language = 'Russian');

        
SELECT 
    c.name, co.language, co.percentage
    FROM
    City AS c
        INNER JOIN
    CountryLanguage AS co ON co.CountryCode = c.CountryCode
WHERE
    c.Name = 'Ottawa' AND co.language = "Russian";

#Querying tables city, country and countryLanguage:
#1
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
WHERE c.Name ="Toronto" AND cl.Language = "Italian";
#2
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
        AND cl.Language = 'Italian';
#3
SELECT 
    co.continent,
    co.Name,
    c.name,
    c.district,
    cl.Language
FROM ((Country As co
LEFT JOIN City As c ON co.Code = c.CountryCode)
LEFT JOIN CountryLanguage As cl ON co.Code = cl.CountryCode);