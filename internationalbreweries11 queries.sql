/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SALES_ID]
      ,[SALES_REP]
      ,[EMAILS]
      ,[BRANDS]
      ,[PLANT_COST]
      ,[UNIT_PRICE]
      ,[QUANTITY]
      ,[COST]
      ,[PROFIT]
      ,[COUNTRIES]
      ,[REGION]
      ,[MONTHS]
      ,[YEARS]
  FROM [forth_mg_technologies].[dbo].[International_Breweries11]

  select * from International_Breweries11

  select [SALES_REP],[BRANDS],[COST],[PROFIT],[COUNTRIES] from [dbo].[International_Breweries11]

  --------Aggregate function-------

SUM, COUNT, MIN, MAX, AVG

select sum(profit) as TotalProfit from International_Breweries11

select sum(profit) as TotalProfit from International_Breweries11
where COUNTRIES = 'senegal'

select sum(profit) as TotalProfit from International_Breweries11
where years = 2019 and countries = 'Nigeria'

select sum(profit) as TotalProfit from International_Breweries11
where years = 2018 and countries = 'Nigeria'

select SALES_ID, avg(profit) as TotalProfit from International_Breweries11
where years = 2017 and countries = 'Nigeria'

---------------- Group by & Order by clause------------

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years = 2017
group by brands
order by 2 desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria'
group by brands
order by brands desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years in (2017,2019)
group by brands
order by 2 desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years not in (2017,2019)
group by brands
order by 2 desc


select brands, sum(profit) as TotalProfit from International_Breweries11
where years in (2017, 2018,2019) and countries = 'Senegal'
group by (brands)
order by sum(profit) desc


select brands, sum(profit) as TotalProfit from International_Breweries11
where years in (2017, 2018,2019) and countries = 'Senegal'
group by (brands)
order by (TotalProfit) desc

select sum(profit) as totalprofit from International_Breweries11
where years = 2019

select sum(profit) as totalprofit from International_Breweries11
where years = 2018

select (30020250)/12


select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years = 2018
group by brands
order by 2 desc


select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years = 2018
group by brands
order by sum(profit) desc


select sum(profit) as Profit_for_hero from International_Breweries11
where countries = 'Nigeria' and years = 2017 and brands = 'hero'

select sum(profit) as Profit_for_hero from International_Breweries11
where countries = 'Ghana' and years = 2017 and brands = 'hero'

select sum(profit) as TotalProfitAlog from International_Breweries11
where countries in('Nigeria','Ghana')

select sum(profit) as TotalProfitAlog from International_Breweries11
where countries = 'nigeria'

select sum(profit) as TotalProfitAlog from International_Breweries11
where countries = 'ghana'

select sum(profit) as TotalProfitAlog from International_Breweries11
where countries not in('Nigeria','Ghana')

select countries,brands, sum(profit) as TotalProfit from International_Breweries11
group by countries, brands

---------Cube & Roll up---------

select countries, brands, sum(profit) as TotalProfit from International_Breweries11
group by cube (countries, brands)
order by 3 desc

select countries, brands, sum(profit) as TotalProfit from International_Breweries11
group by rollup  (countries, brands)
order by 3 desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and sales_rep = 'Gill' and years =2019
group by brands
having sum(profit) >=50000
order by 2 desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and sales_rep = 'Jones' and years =2019
group by brands
having sum(profit) >=50000
order by 2 desc

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and sales_rep in ('Gill','Jones') and years =2019
group by brands
having sum(profit) >=100000
order by 2 desc

--------- Offset & Fetch Next-------------

select * from International_Breweries11
offset 100 rows

select * from International_Breweries11
offset 1000 rows
fetch next 10 rows only

------------------ WILD CARD (search patterns)----------------------------------- ----------
wildcards : % and _

select distinct( sales_rep) from International_Breweries11
where sales_rep like 'J%'

select * from International_Breweries11
where sales_rep like 'J%'

select * from International_Breweries11
where brands like '%y%'

select * from International_Breweries11
where sales_rep like '%_a%'

select * from International_Breweries11
where sales_rep like 'a%'

select * from International_Breweries11
where emails like '%@uk%'

select * from International_Breweries11
where emails like 'g%'

select * from International_Breweries11
where sales_rep like '_are%'

--------------------------------------------------------------------------------------------------------------------------
select brands, quantity, profit, countries, region, years from [dbo].[International_Breweries11]
where countries = 'Nigeria' and years =2019

select brands, sum(profit) as TotalProfit from [dbo].[International_Breweries11]
where countries = 'Nigeria' and years = 2019
group by brands
ORDER BY 2 DESC

----------------------------SQL CAPSTONE PROJECT------------------------------------------
                   
SELECT * FROM [dbo].[International_Breweries11]

select sum(profit) as TotalProfit from [dbo].[International_Breweries11]

----1A

SELECT SUM(PROFIT) AS TOTALPROFIT FROM [dbo].[International_Breweries11]

----1B
SELECT SUM(PROFIT) AS TOTALPROFIT_ANGLOPHONE FROM [dbo].[International_Breweries11]
WHERE COUNTRIES IN ('Nigeria','Ghana')

----1c
SELECT SUM(PROFIT) AS TOTALPROFIT_francophone FROM [dbo].[International_Breweries11]
WHERE  not COUNTRIES IN ('Nigeria','Ghana')

-----------------------------------------------------------
select COUNTRIES  as Territory, sum(profit) AS TOTAL_PROFIT from  [dbo].[International_Breweries11]
where countries in ('Togo','Benin', 'Senegal','Nigeria','Ghana')
group by COUNTRIES
ORDER BY SUM(PROFIT) ASC

2------- compare the total profit within these two territory

select case when countries in ('Nigeria', 'Ghana') then 'Anglophone' else 'Francophone' end countrygroup,
sum (profit) as Totalprofit from  [dbo].[International_Breweries11]
where years in (2017,2018, 2019)
group by COUNTRIES

--3-------country that generated highest profit in 2019----------

select countries, sum(profit) as TotalProfit from [dbo].[International_Breweries11]
where years =2019
group by (countries)
ORDER BY 2 DESC

-4-------the year with highest profit----------

select years, sum(profit) as TotalProfit from International_Breweries11
where years in (2017,2018,2019)
group by  years
order by totalprofit desc

-5------month in the three years was the least profit generated-------

select  months, years, min(profit) as MinProfit from International_Breweries11
where years in (2017,2018,2019)
group by months, years
order by 3 desc
limit 3

-6-----the minimum profit in the month of December 2018-------

select months, years, min(profit) as minprofit from International_Breweries11
where years = 2018 and months = 'December'
group by years, months

-7-------the profit percentage for each of the month in 2019-------
select months, round(sum(profit)/30020250 * 100, 2) as Totalprofit from International_Breweries11
where years = 2019
group by months

-8--------which particular brands generated the highest profit in senegal -------

select brands, sum(profit) as TotalProfit from International_Breweries
where countries = 'Senegal' and years in (2017,2018,2019)
group by brands
order by totalprofit desc

---------- SECTION B (BRAND ANALYSIS) -------------

select * from International_Breweries11

 --1-----Top three brands consumed in the francophone-------


select brands, sum(quantity) as TotalquantityFrancophone from International_Breweries11
where countries in ('Togo','Benin', 'Senegal') and years in (2018, 2019)
group by brands
order by TotalquantityFrancophone desc
limit 3

select top 3 brands, sum(quantity) as TotalquantityFrancophone from International_Breweries11
where countries in ('Togo','Benin', 'Senegal') and years in (2018, 2019)
group by brands
order by TotalquantityFrancophone desc


2-------Top two choice of consumer brands in Ghana---------

select brands, sum(quantity) as Totalquantity from International_Breweries11
where countries = 'Ghana' 
group by brands
order by 2 desc

select top 2 brands, sum(quantity) as Totalquantity from International_Breweries11
where countries = 'Ghana' 
group by brands
order by 2 desc


-3-----details of beers consumed in the past three years in most oil produced country in west africa

select 'Beer' as Category, sum(quantity) as TotalConsumption from International_Breweries11
where countries in ('Nigeria') and brands in ('hero','budweiser', 'trophy','castle lite', 'eagle lager')
and years in (2017,2018,2019)

-4-------Favourites malt brands in Anglophone region between 2018 and 2019------

select 'Anglophone'as countrygroup, brands, sum(quantity) as QuantitySold from International_Breweries11
where countries in ('Nigeria','Ghana') and brands like '%_malt%' and years in (2018, 2019)
group by countrygroup, brands
order by 2 desc

-5-------brands solds the highest in 2019 in Nigeria-------

select brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and years = 2019
group by brands
order by sum(profit) desc

-6-----Favourites brands in south south region in Nigeria----------

select region, brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Nigeria' and region ='southsouth'
group by region, brands
order by totalprofit desc

-7-----------beer consumption in nigeria--------------

select 'Beer' as Category, sum(quantity) as TotalConsumption from International_Breweries11
where countries in ('Nigeria') and brands in ('hero','budweiser', 'trophy','castle lite', 'eagle lager')
and years in (2017,2018,2019)

-8 -----level of consumption of budweiser in the region in Nigeria ------------

select  region, sum(quantity) as consumptionlevel from International_Breweries11
where countries in ('Nigeria') and brands in ('budweiser')
group by brands, region, countries

-9------level of consumption of budweiser in the region in Nigeria in 2019------

select  region, sum(quantity) as consumptionlevel from International_Breweries11
where countries in ('Nigeria') and brands in ('budweiser') and years = 2019
group by  region

-------------SECTION C (COUNTRIES ANALYSIS) -----------------

select * from International_Breweries11

-1---------Country with the highest consumption of beer

select countries, sum(quantity) as TotalConsumption from International_Breweries11 
where brands in ('beta malt', 'grand malt')
group by countries
order by 2 desc

-2-----Highest sales personnel of budweiser in senegal----------

select countries, sales_rep, brands, sum(profit) as TotalProfit from International_Breweries11
where countries = 'Senegal' and brands = 'budweiser' 
group by brands, sales_rep, countries
order by totalprofit desc


3-----Country with the highest profit of the fourth quarter in 2019------

select countries, sum(profit) from International_Breweries11 
where years = 2019 and months in ('October', 'November', 'December')
group by COUNTRIES
order by 2 desc
 

 -------------Offset & Fetch Next --------------

 select * from International_Breweries11 
offset 100 rows

 select * from  International_Breweries11 
offset 1000 rows
fetch next 10 rows only


------------------ search patterns ----------
wildcards : % and _

select * from International_Breweries11
where sales_rep like 'J%'

select * from International_Breweries11
where brands like '%y%'

select * from International_Breweries11
where sales_rep like '%_a%'

select * from International_Breweries11
where emails like '%@uk%'

select * from International_Breweries11
where emails like 'g%'

select * from International_Breweries11
where sales_rep like '_are%'