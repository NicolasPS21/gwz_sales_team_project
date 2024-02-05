SELECT
  date_date,
  COUNT(orders_id) AS nb_transactions,
  SUM(turnover) AS turnover
  FROM 'course9.gwz_sales'
  GROUP BY date_date;