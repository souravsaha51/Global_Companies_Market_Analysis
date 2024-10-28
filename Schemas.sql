CREATE TABLE GlobalCompanies (
    Rank INT PRIMARY KEY,
    Title VARCHAR(255),
    Employees INT,
    Sector VARCHAR(100),
    Industry VARCHAR(100),
    Hqlocation VARCHAR(100),
    Hqcity VARCHAR(50),
    Hqtel VARCHAR(20),
    Ceo VARCHAR(100),
    Revenues BIGINT,
    Profits NUMERIC,
    Assets BIGINT,
    Totshequity NUMERIC
);

select * from GlobalCompanies