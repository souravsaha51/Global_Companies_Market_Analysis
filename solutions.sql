--  Retrive the data set
select * from GlobalCompanies


-- Remove duplicates values

delete from globalcompanies
where rank not in (select min(rank) from globalcompanies
				  	group by title, sector, industry, hqcity);
					

--  Analyze the top 10 company Annual Revenue

select title, revenues
from globalcompanies
order by revenues desc
limit 10;

-- find the top 5 company with largest numbers of employee

select title, employees
from globalcompanies
order by employees desc
limit 5;

-- Analyze the market capitalization
-- we know MarketCap = revenues * totshequity
					
select title, revenues * totshequity as MarketCap
from globalcompanies
order by MarketCap desc
limit 10;


-- Analyze the top 10 companies highest profit

select title, profits
from globalcompanies
order by profits desc
limit 10
					
-- Analyze the top 10 based on companies Assets

select title, assets
from globalcompanies
order by assets desc
limit 10
					
-- Analyze which companies have the largest assets in each industry	

WITH TopAssets AS (
    SELECT industry, title, assets,
           ROW_NUMBER() OVER (PARTITION BY industry ORDER BY assets DESC) AS rank
    FROM globalcompanies
)
SELECT industry, title, assets
FROM TopAssets
WHERE rank = 1;
					
					
					
-- Find the top 3 companies by Market Capitalization in each industry
WITH RankedCompanies AS (
    SELECT industry, title,
           COALESCE(revenues, 0) * COALESCE(totshequity, 0) AS MarketCap,
           ROW_NUMBER() OVER (PARTITION BY industry ORDER BY COALESCE(revenues, 0) * COALESCE(totshequity, 0) DESC) AS rank
    FROM globalcompanies
)
SELECT industry, title, MarketCap
FROM RankedCompanies
WHERE rank <= 3;



-- Calculate the total number of employees in each industry	

SELECT industry, SUM(employees) AS total_employees
FROM globalcompanies
GROUP BY industry
ORDER BY total_employees DESC;

					
-- Find the companies with revenue greater than the average revenue							
select title, revenues from globalcompanies
where revenues > (select avg(revenues) from globalcompanies)
order by revenues desc;

					
--  Find Companies that Made a Loss					

select title, profits
from globalcompanies
where profits < 0
order by profits desc
limit 10;					
					
					
					
					
					