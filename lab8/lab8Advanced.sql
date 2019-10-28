USE World;
SELECT 
    city.name,
    district,
    city.population,
    country.name,
    country.code,
    continent,
    region,
    gnp,
    surfaceArea
FROM
    ((City
    LEFT JOIN Country ON City.CountryCode = Country.Code)
    LEFT JOIN CountryLanguage ON city.CountryCode = CountryLanguage.Countrycode)
WHERE
    (SELECT 
            city.Name,
                country.continent,
                country.HeadOfState,
                country.IndepYear,
                countryLanguage.Language,
                (city.population * countryLanguage.Percentage / 100) AS total_speakers
        FROM
            City,
            Country,
            CountryLanguage
        WHERE
            city.CountryCode = country.Code
                AND city.CountryCode = countryLanguage.CountryCode
		HAVING total_speakers > 60);

