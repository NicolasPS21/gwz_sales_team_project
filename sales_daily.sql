SELECT
  date_date,
  ROUND(COUNT(orders_id),2) AS nb_transactions,
  ROUND(SUM(turnover),2) AS turnover,
  ROUND(SUM(turnover_before_promo)-SUM(turnover),2) AS discount
  FROM 'course9.gwz_sales'
  GROUP BY date_date
  ORDER BY date_date;