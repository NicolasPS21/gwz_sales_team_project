WITH sales_daily AS (
  SELECT
    category_1,
    date_date,
    ROUND(SUM(turnover_before_promo) - SUM(purchase_cost), 2) / 1000 AS net_turnover,
    ROUND(COUNT(orders_id), 2) AS nb_transaction,
    ROUND(SUM(turnover_before_promo), 2) / 1000 AS total_turnover
  FROM `starlit-hangar-411310.course9.gwz_sales` 
  GROUP BY date_date, category_1
  ORDER BY date_date
),

cumulative_sales AS (
  SELECT
    category_1,
    date_date,
    ROUND(SUM(net_turnover) OVER (PARTITION BY category_1, date_date ORDER BY date_date), 2) AS cumulative_net_turnover,
    nb_transaction,
    ROUND(SUM(total_turnover) OVER (PARTITION BY category_1 ORDER BY date_date), 2) AS cumulative_total_turnover,
  FROM sales_daily
)

SELECT 
  cumulative_sales.*
FROM cumulative_sales
WHERE category_1 IS NOT NULL;