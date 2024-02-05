SELECT
  date_date
 , ROUND(SUM(turnover)-SUM(purchase_cost),2) AS turnover
 , ROUND(COUNT(orders_id),2) AS nb_transaction
 , ROUND(SUM(turnover),2) AS turnover
 , ROUND(SUM(turnover_before_promo)-SUM(turnover),2) AS discount
  FROM `mes-projets-du-wagon.Course14.gwz_sales`
  GROUP BY date_date
  ORDER BY date_date;