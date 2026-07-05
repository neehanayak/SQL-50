# Write your MySQL query statement below
WITH last_change AS(
    SELECT DISTINCT(product_id), MAX(change_date) as last_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT
    p.product_id,
    p.new_price AS price
FROM Products p
JOIN last_change l
ON p.product_id = l.product_id
AND p.change_date = l.last_date

UNION

SELECT
    product_id,
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';