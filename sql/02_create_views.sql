-- =========================
-- 02_create_views.sql
-- Création des vues BI
-- =========================

-- Paiement agrégé au niveau commande
CREATE VIEW v_payments_per_order AS
SELECT
    order_id,
    SUM(payment_value) AS order_payment_value
FROM olist_order_payments
GROUP BY order_id;


-- Fact table au niveau commande
CREATE VIEW fact_orders AS
SELECT
    o.order_id,
    c.customer_unique_id,
    DATE(o.order_purchase_timestamp) AS order_date,
    o.order_status,
    pay.order_payment_value
FROM olist_orders o
JOIN olist_customers c 
    ON o.customer_id = c.customer_id
LEFT JOIN v_payments_per_order pay
    ON o.order_id = pay.order_id;


-- Fact table au niveau produit (item)
CREATE VIEW fact_sales AS
SELECT
    o.order_id,
    c.customer_unique_id,
    DATE(o.order_purchase_timestamp) AS order_date,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,
    oi.price,
    oi.freight_value,
    pay.order_payment_value
FROM olist_orders o
JOIN olist_customers c 
    ON o.customer_id = c.customer_id
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
LEFT JOIN olist_products p 
    ON oi.product_id = p.product_id
LEFT JOIN v_payments_per_order pay 
    ON o.order_id = pay.order_id;