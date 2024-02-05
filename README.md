# gwz_sales_team_project
 
**Turnover and purchase cost by category_1 & date (exercise from Le Wagon)**

- The sales information split per category_1, and then the evolution per day.
- Display turnover_before_promo instead of turnover.
- Instead of having the daily sales data, have the cumulative sales data. 
- Have the numbers in 1000s of euros, instead of euros. That will be easier to read.

*You can see the whole code on this file: sales_daily.sql (last query).*

**Overview of the final code:** 

```WITH tmp AS (
  SELECT
    category_1
  , date_date
  , ROUND(SUM(turnover_before_promo)/1000, 2) AS turnover
  , ROUND((SUM(turnover) - SUM(purchase_cost))/1000, 2) AS margin
  FROM `data-analytics-bootcamp-363212.course14.gwz_sales`
  GROUP BY category_1, date_date
  ORDER BY category_1, date_date
), 
unrounded AS (
  SELECT
    category_1
  , date_date
  , SUM(turnover) OVER(PARTITION BY category_1 ORDER BY date_date) as turnover
  , SUM(margin) OVER(PARTITION BY category_1 ORDER BY date_date) as margin
  FROM tmp
)
SELECT
  category_1
, date_date
, ROUND(turnover, 2) as turnover
, ROUND(margin, 2) as margin
FROM unrounded
;```

'''
