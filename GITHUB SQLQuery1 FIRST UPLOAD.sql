-- this is data for a business selling Computer Games. i uploaded a csv and used SQL to get out certain info
--out of the data. !!! Check it Out !!!

------------- CHECK/SAMPLE OUT THE ENTIRE DATA TO GET A FEEL OF WHATZ IT'S ABOUT-------
select * from [TEST_PROJECTZ].[dbo].[GamesSalesData];

----------ASSUMING U WANT TO SAMPLE JUST A FEW SAY FIRST 20 ROWS AND A FEW FIELDS------
select top (20) Name, Series, Genre, Release, Publisher from [TEST_PROJECTZ].[dbo].[GamesSalesData];

------------------- DETERMINE D NUMBER OF DISTINCT GAMES IN DATA ------------
select distinct (Name) from [TEST_PROJECTZ].[dbo].[GamesSalesData];


----------- RETURNS THE TOTAL NUMBER OF RELEASE DATES INCLUDING THE DUPLICATES--------------
select count(Release) as ReleaseCount from [TEST_PROJECTZ].[dbo].[GamesSalesData];


-------------- RETURNS THE BIGGEST SALE FIGURE FROM THE ENTIRE SALES--------------
select max(Sales) as MaximumSale from TEST_PROJECTZ.dbo.GamesSalesData;

-------------- RETURNS THE SMALLEST SALE FIGURE FROM THE ENTIRE SALES--------------
select min(Sales) as MaximumSale from [TEST_PROJECTZ].[dbo].[GamesSalesData];

--------------LET'S SELECT CERTAIN DATA USING WHERE STATEMENT-------------------------
select * from TEST_PROJECTZ.dbo.GamesSalesData;

----RETURN GAMES DATA WHERE D PUBLISHER IS EA,GENRE IS FIGHTING & NAME IS DIABLO ETC...--
select * from TEST_PROJECTZ.dbo.GamesSalesData where publisher  = 'electronic arts';
select * from TEST_PROJECTZ.dbo.GamesSalesData where genre  = 'fighting';
select * from TEST_PROJECTZ.dbo.GamesSalesData where name  = 'diablo';
select * from TEST_PROJECTZ.dbo.GamesSalesData where publisher  <> 'electronic arts';
select * from TEST_PROJECTZ.dbo.GamesSalesData where sales = 5
select * from TEST_PROJECTZ.dbo.GamesSalesData where sales  > 10 and publisher = 'electronic arts'

-------------SHOWS HOW TO USE THE 'AND' 'OR' OPERATORS--------------------------------
select * from TEST_PROJECTZ.dbo.GamesSalesData where sales  >= 5 and genre = 'survival';
select * from TEST_PROJECTZ.dbo.GamesSalesData where sales  >= 10 and publisher = 'cd projekt';


----------------------MULTIPLE WHERE STATEMENTS COMBINED TOGETHER------------------------
select * from TEST_PROJECTZ.dbo.GamesSalesData where name in ('robocop','quake','the sims','minecraft');

------------------- GROUP THE DATA BY CERTAIN CONDITIONS--------------------

---------GROUPS THE DATA PUBLISHER AND ENABLES U DETERMINE D FREQUENCY OF OCCURENCE------

select publisher, count(publisher) from TEST_PROJECTZ.dbo.GamesSalesData group by Publisher;
select name, publisher, genre, count(publisher) from TEST_PROJECTZ.dbo.GamesSalesData group by name, Publisher, genre;
select publisher, genre, count(publisher) from TEST_PROJECTZ.dbo.GamesSalesData where Sales = 10 group by Publisher, genre;

-------------------USING ALIAS TO LABEL A LOGICAL/DERIVED COLUMN---------------------
select publisher, genre, count(publisher) as CountOfEachPublisher from TEST_PROJECTZ.dbo.GamesSalesData group by Publisher, genre;


THIS NEXT SET OF DATA IS FOR A CAR SELLING FRANCHISE
------------- WHAT'S THE DATASET ALL ABOUT?? -------------------------------
select * from TEST_PROJECTZ.dbo.[car sales data]

------------- SELECT THE FIELDS YOU WANT TO WORK WITH B4 CLEANING -----------------------

select Manufacturer, Model,[Price in thousands],[Sales in thousands], [Engine size], [Fuel capacity], [Fuel efficiency],
[Latest Launch], Horsepower from TEST_PROJECTZ.dbo.[car sales data];

------------- THIS IS WHAT THE DATA LOOKS LIKE AFTER CLEANING/TIDYING ---------------------
	-----now it can be used for data analysis and visualization if need be--------------

select Manufacturer, Model,CAST([Price in thousands] as int)*1000 AS Price,cast([Sales in thousands] as int) as Qty_Sold,
cast( [Engine size] as decimal(10,1)) as Engine_Liter, cast([Fuel capacity] as INT) as Tank_Size_InLiters, [Fuel efficiency],
[Latest Launch], Horsepower from TEST_PROJECTZ.dbo.[car sales data];

-------------------- DETERMINE THE NUMBER OF UNIQUE CAR BRANDS ------------------
select distinct(Manufacturer) from TEST_PROJECTZ.dbo.[car sales data];

---------------------------- USE OF ALIASES & FUNCTIONS RENAME COLUMNS ----------------------
select max([price in thousands]* 1000) as highestprice from TEST_PROJECTZ.dbo.[car sales data];
select min([price in thousands]* 1000) as smallestprice from TEST_PROJECTZ.dbo.[car sales data];
select avg([price in thousands]* 1000) as avearagecarprice from TEST_PROJECTZ.dbo.[car sales data];

---------------------------- USE OF WHERE STATEMENTS TO QUERY SPECIFIC INFO -------------

select * from TEST_PROJECTZ.dbo.[car sales data] where Manufacturer = 'porsche'
select Model,[Price in thousands],[Sales in thousands], [Engine size] from TEST_PROJECTZ.dbo.[car sales data] where Manufacturer = 'porsche';
select Model,[Price in thousands],[Sales in thousands], [Engine size] from TEST_PROJECTZ.dbo.[car sales data] where Manufacturer = 'toyota';
select * from TEST_PROJECTZ.dbo.[car sales data] where model ='corolla';
select * from TEST_PROJECTZ.dbo.[car sales data] where model in ('rav4','camry','e-class','civic','al','ranger','es300');

------------------------ GROUP BYs AND ORDER BYs ---------------------------------------

select Manufacturer, count(Manufacturer) as NoOfEachManufacturer from TEST_PROJECTZ.dbo.[car sales data] group by Manufacturer
select Model, count(Model) as AmtOfEachModel from TEST_PROJECTZ.dbo.[car sales data] group by Model
select * from TEST_PROJECTZ.dbo.[car sales data] where Manufacturer like 's%'
select * from TEST_PROJECTZ.dbo.[car sales data] order by 1 desc,  2, 7, 8;

-------------------- SEE HOW I CAN USE CASE STATEMENTS -------------------

select Manufacturer, Model, Horsepower, [Fuel efficiency], 
	case 
		when horsepower > 142 then 'Has Turbo Speed' else 'Has Moderate Speed'
	end 
 from TEST_PROJECTZ.dbo.[car sales data] 
 where Manufacturer='toyota' order by Horsepower;



select Manufacturer, Model, Horsepower, [Fuel efficiency], 
	case 
		when [Fuel efficiency] < 20 then 'Has Low Fuel Consumption'
		when [Fuel efficiency] between 20 and 27 then 'Has Moderate Economy'
		else 'Cosumes Alot of Fuel'
	end 
 from TEST_PROJECTZ.dbo.[car sales data] 
 where Manufacturer='honda' order by [Fuel efficiency];


 select Manufacturer, Model, floor([Engine size]) as [Engine size], floor([Fuel efficiency]) as [Fuel efficiency],
	case
			when Manufacturer='acura' then floor([Engine size])
			when Manufacturer='bmw' then floor([Engine size])
			when Manufacturer='audi' then floor([Engine size])
			else [Engine size]
	end
 from TEST_PROJECTZ.dbo.[car sales data];


select Manufacturer + '***' + Model as ManufacturerModel from TEST_PROJECTZ.dbo.[car sales data] where Manufacturer = 'Acura';
