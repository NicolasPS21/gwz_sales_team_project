SELECT
category_1
, ROUND(SUM(turnover),2) AS daily_turnover_round
, ROUND(SUM(purchase_cost),2) AS daily_purchase_round
FROM `mes-projets-du-wagon.Course14.gwz_sales`
GROUP BY category_1