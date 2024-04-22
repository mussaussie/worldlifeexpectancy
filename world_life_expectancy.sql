# World_Life_Expectancy Project Part 1 ( Data Cleaning)

## Step 1 :- Just look at the data take the Glance

Select *
From worldlifeexpectancy;

#s Step 2 Remove Duplicates
   # a) First by checking the duplicates, the using window function we delete it and update the table. 
   
   
Select Country, Year , Concat(Country,Year), count(Concat(Country,Year))
from worldlifeexpectancy
Group By Country, Year , Concat(Country,Year) 
Having count(Concat(Country,Year)) > 1 ;

Select *
From (
Select row_id, Concat(Country, Year),
ROW_NUMBER() over ( partition by  Concat(Country, Year) order by Concat(Country, Year)) as Row_num
From worldlifeexpectancy ) AS SUB_1
Where Row_num > 1
;

Delete From worldlifeexpectancy
Where row_id IN (Select row_id
From (
Select row_id, Concat(Country, Year),
ROW_NUMBER() over ( partition by  Concat(Country, Year) order by Concat(Country, Year)) as Row_num
From worldlifeexpectancy ) AS SUB_1
Where Row_num > 1)
;

## check for the null Values

Select * 
From worldlifeexpectancy
Where status = '' ;

Update worldlifeexpectancy wt1 
Join worldlifeexpectancy wt2
 ON wt1.country = wt2.country
 Set wt1.Status = 'Developing'
 Where wt1.Status = ''
 AND wt2.Status <> ' '
 AND wt2.Status = 'Developing' ;
 
 Update worldlifeexpectancy wt1 
Join worldlifeexpectancy wt2
 ON wt1.country = wt2.country
 Set wt1.Status = 'Developed'
 Where wt1.Status = ''
 AND wt2.Status <> ' '
 AND wt2.Status = 'Developed' ;
 
 
## There is null Value in life expectancy as well 

Select `Life Expectancy`, Country
From worldlifeexpectancy
Where `Life expectancy` = '' ;

Select t1.year, t1.country, t1.`Life expectancy`, 
t2.year, t2.country, t2.`Life expectancy`,
t3.year, t3.country, t3.`Life expectancy`,
Round((t2.`life expectancy` +t3.`Life expectancy`)/2 ,1)
 From worldlifeexpectancy as t1
 Join worldlifeexpectancy as t2
 On t1.country = t2.country
 AND t1.year = t2.Year - 1
 join worldlifeexpectancy as t3
 On t1.Country = t3.Country
 AND t1.year = t3.year + 1
 Where t1.`Life expectancy` = '';
 
 Update worldlifeexpectancy as t1
 Join worldlifeexpectancy as t2
 On t1.country = t2.country
 AND t1.year = t2.Year - 1
 join worldlifeexpectancy as t3
 On t1.Country = t3.Country
 AND t1.year = t3.year + 1
 Set t1.`Life expectancy` = Round((t2.`life expectancy` +t3.`Life expectancy`)/2 ,1)
 Where t1.`Life expectancy` = '';
 
 
 ## Expolatory Data Analysis
 
 Select Country, 
	    MAX(`Life expectancy`), 
        MIN(`Life expectancy`),
        ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Life_Increased_15_year
 From worldlifeexpectancy
 Group by Country 
 HAVING MAX(`Life expectancy`) <> '0'
 and MIN(`Life expectancy`) <> '0'
 Order by Life_Increased_15_year DESC ;
 
 
 Select Year, ROUND(AVG(`Life expectancy`),2)
 From worldlifeexpectancy
 Where `Life expectancy` <> '0'
 group by Year 
 Order by year ;
 
 ##Comparison between Life expectancy and GDP
 
 Select Country , Round(AVG(`Life expectancy`),1) AS Life_Exp, Round(AVG(GDP),1) as GDP
 From worldlifeexpectancy
 Group by Country
 Having Life_Exp > '0'
 AND GDP > '0'
 Order by GDP DESC ;
 
 
 Select 
  SUM( Case WHEN GDP >= 1500 Then 1 ELSE 0 END) as High_GDP_Count,
  Round(AVG( Case when GDP >= 1500 Then `Life Expectancy` ELSE NULL END),2) as High_GDP_LIfe_Expectancy,
  SUM( Case WHEN GDP <= 1500 Then 1 ELSE 0 END) as Low_GDP_Count,
  Round(AVG( Case when GDP <= 1500 Then `Life Expectancy` ELSE NULL END),2) as Low_GDP_LIfe_Expectancy
From worldlifeexpectancy ;


Select 
  Count( Case WHEN GDP >= 1500 Then 1 ELSE NULL END) as High_GDP_Count,
  Round(AVG( Case when GDP >= 1500 Then `Life Expectancy` ELSE NULL END),2) as High_GDP_LIfe_Expectancy,
  Count( Case WHEN GDP <= 1500 Then 1 ELSE NULL END) as Low_GDP_Count,
  Round(AVG( Case when GDP <= 1500 Then `Life Expectancy` ELSE NULL END),2) as Low_GDP_LIfe_Expectancy
From worldlifeexpectancy ;


Select status, Round(avg(`life expectancy`),1) As Avg_Life_Exp , Count(Distinct Country) As Num_Country
From worldlifeexpectancy 
Group by Status ;