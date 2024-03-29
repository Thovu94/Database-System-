USE World;
SELECT CountryCode,COUNT(Name) As TotalCities FROM City GROUP BY CountryCode;
SELECT CountryCode,COUNT(Name) As Totalcities FROM City GROUP BY CountryCode HAVING COUNT(Name) > 200;
SELECT CountryCode,COUNT(*) FROM City GROUP BY CountryCode HAVING COUNT(*) >200;
SELECT CountryCode,COUNT(Name) As Totalcities, SUM(Population) As Totalpopulation FROM City GROUP BY CountryCode;
SELECT CountryCode, District,COUNT(Name) As Totalcities FROM City GROUP BY CountryCode, District;
SELECT CountryCode,COUNT(Name) As Totalcities, SUM(Population) As Totalpopulation, AVG(Population) As Avgpopulation FROM City GROUP BY CountryCode;
SELECT District, CountryCode, COUNT(*) As TotalCities, SUM(Population) As TotalPopulation, AVG(Population) As Avgpopulation FROM City GROUP BY District, CountryCode HAVING District LIKE 'a%';
SELECT District, CountryCode, COUNT(*) As TotalCities, SUM(Population) As TotalPopulation, AVG(Population) As Avgpopulation FROM City GROUP BY District, CountryCode HAVING District LIKE 'a%' AND COUNT(*)> 10;
SELECT COUNT(*) As TotalCities, SUM(Population) As TotalPopulation, AVG(Population) As Avgpopulation, MIN(Population) As MinPopulation, MAX(Population) As MaxPopulation FROM City;