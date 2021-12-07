/*To get the anglophone countries profit over the past three years*/
select sum(profit) as Anglophone_profit
	from [dbo].[Brewery]
	where countries IN ('Ghana','Nigeria')

/*To get the Francophone countries profit over the past three years*/
select sum(profit) as Francophone_profit
	from [dbo].[Brewery]
	where countries IN ('Benin','Benin', 'Senegal')

/* From the results gotten, we can deduced that the Francophone countries is doing well compare to the Anglophone countries in terms of total profits*/

/*Country that generated the highest profit in 2019*/
select top 1 sum(profit) as highest_profit, countries
	from [dbo].[Brewery]
	where years = 2019
	group by countries
	ORDER BY highest_profit DESC


/*year with the highest profit*/
select top 1 years, sum(profit) as highest_profit 
	from [dbo].[Brewery]
	group by years
	order by highest_profit DESC

/*Which month in the three years was the least profit generated?*/
select TOP 1 months, years, SUM(profit) as least_profit
	from [dbo].[Brewery]
	group by YEARS, MONTHS
	order by least_profit ASC

/*What was the minimum profit in the month of December 2018?*/
Select  months, years, min(profit) as min_profit
	from [dbo].[Brewery]
	where years = 2018
		and months = 'December'
	group by months, years
	order by min_profit

/*Compare the profit in percentage for each of the month in 2019*/
select MONTHS, YEARS, sum(profit) as Monthly_profit, (sum(profit)*100/(SELECT sum(profit) as total_profit from [dbo].[Brewery] where years = 2019)) as Percent_profit
	from [dbo].[Brewery]
	where YEARS = 2019
	group by MONTHS, YEARS

/*Which particular brand generated the highest profit in Senegal?*/
select top 1 brands, countries, sum(profit) as highest_profit
	from [dbo].[Brewery]
	where countries = 'Senegal'
	group by countries, brands
	order by highest_profit DESC


/*Convert profits column from char to int using the query below*/
alter table [dbo].[Brewery]
alter column profits int



/* Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries*/
select top 3 brands, sum(quantity) as Quantity_Consumed
from [UtivaCap].[dbo].[Brewery]
where years between 2018 and 2019
group by brands
order by Quantity_Consumed Desc


/* Find out the top two choice of consumer brands in Ghana*/
select top 2 brands, sum(quantity) as Quantity_consume
from [UtivaCap].[dbo].[Brewery]
where COUNTRIES = ('Ghana')
group by brands
order by Quantity_consume Desc

/*Find out the details of beers consumed in the past three years in the most oil reached country in West Africa.*/
select brands, sum(quantity) as Quantity_consume, countries
from [UtivaCap].[dbo].[Brewery]
where COUNTRIES = ('Nigeria')
group by brands, countries

/* Favorites malt brand in Anglophone region between 2018 and 2019*/
select brands, sum(quantity) as Favourite_malt
from [UtivaCap].[dbo].[Brewery]
where brands like ('%malt%')
	and countries IN ('Nigeria','Ghana')
group by brands

/*Which brands sold the highest in 2019 in Nigeria?*/
select brands, sum(quantity) as sum_quantity, years
from [UtivaCap].[dbo].[Brewery]
where years = 2019
group by brands, years
order by sum_quantity Desc

/*Favorites brand in South_South region in Nigeria*/
select brands, countries, [REGION ], sum(quantity) as favourite_brand
from [UtivaCap].[dbo].[Brewery]
where countries in ('Nigeria')
	and [REGION ] in ('southsouth')
group by brands, countries, [REGION ]
order by favourite_brand desc

/*Bear consumption in Nigeria*/
select brands, countries, sum(quantity) as consumption
from [UtivaCap].[dbo].[Brewery]
where countries = ('Nigeria')
group by brands, countries

/*Level of consumption of Budweiser in the regions in Nigeria*/
select brands, sum(quantity) as consumption, countries, [REGION ]
from [UtivaCap].[dbo].[Brewery]
where brands = ('budweiser')
	and countries = ('Nigeria')
group by brands, countries, [REGION ]
order by consumption Desc


/*Level of consumption of Budweiser in the regions in Nigeria in 2019*/
select brands, sum(quantity) as consumption, countries, [REGION ], years
from [UtivaCap].[dbo].[Brewery]
where brands = ('budweiser')
	and countries = ('Nigeria')
	and years = 2019
group by brands, countries, [REGION ], years
order by consumption Desc


/*Country with the highest consumption of beer*/
select COUNTRIES, sum(quantity) as consumption
from [UtivaCap].[dbo].[Brewery]
group by countries
order by consumption Desc


/*Highest sales personnel of Budweiser in Senegal*/
select count(sales_rep) as number_sales_personnel, countries, brands
from [UtivaCap].[dbo].[Brewery]
where countries = ('Senegal')
	and brands = ('budweiser')
group by countries, brands
order by number_sales_personnel Desc


/*Country with the highest profit of the fourth quarter in 2019*/
select countries, sum(profit) as profit_for_quarter
from [UtivaCap].[dbo].[Brewery]
where years = 2019
	AND months in ('September','October','November','December')
group by countries
order by profit_for_quarter Desc























