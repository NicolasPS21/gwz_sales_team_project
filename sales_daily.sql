SELECT
  date_date
 , SUM(turnover) AS turnover 
 , ROUND(SUM(turnover)-SUM(purchase_cost),2) AS turnover
  FROM 'course9.gwz_sales'
  GROUP BY date_date
  ORDER BY date_date;