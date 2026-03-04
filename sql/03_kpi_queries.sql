-- =========================
-- 03_kpi_queries.sql
-- Requêtes KPI principales
-- =========================

-- 1️⃣ Chiffre d'affaires total
SELECT 
    ROUND(SUM(order_payment_value), 2) AS total_revenue
FROM fact_orders
WHERE order_payment_value IS NOT NULL;


-- 2️⃣ Nombre de commandes
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_orders
WHERE order_payment_value IS NOT NULL;


-- 3️⃣ Panier moyen
SELECT 
    ROUND(
        SUM(order_payment_value) 
        / COUNT(DISTINCT order_id), 2
    ) AS avg_order_value
FROM fact_orders
WHERE order_payment_value IS NOT NULL;


-- 4️⃣ CA mensuel
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_payment_value) AS revenue
FROM fact_orders
WHERE order_payment_value IS NOT NULL
GROUP BY month
ORDER BY month;


-- 5️⃣ Top catégories produit
SELECT
    product_category_name,
    COUNT(*) AS total_items,
    ROUND(SUM(price), 2) AS total_revenue
FROM fact_sales
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 6️⃣ Taux de réachat
SELECT
    COUNT(*) FILTER (WHERE total_orders > 1) AS repeat_customers,
    COUNT(*) AS total_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE total_orders > 1) 
        / COUNT(*),
        2
    ) AS repeat_rate_pct
FROM (
    SELECT
        customer_unique_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM fact_orders
    WHERE order_payment_value IS NOT NULL
    GROUP BY customer_unique_id
) t;