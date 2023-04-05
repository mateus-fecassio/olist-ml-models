-- Databricks notebook source
-- https://spark.apache.org/docs/latest/api/sql/index.html

-- COMMAND ----------

SELECT * FROM silver.olist.pagamento_pedido


-- COMMAND ----------

SELECT 
  DATE(dtPedido) AS dtPedido,
  count(*) as qtPedido
FROM silver.olist.pedido

GROUP BY 1
ORDER BY 1

-- COMMAND ----------

SELECT * FROM silver.olist.pagamento_pedido

-- COMMAND ----------

SELECT t2.*
FROM silver.olist.pedido as t1
LEFT JOIN silver.olist.pagamento_pedido as t2
ON t1.idPedido = t2.idPedido

WHERE dtPedido < '2018-01-01' AND dtPedido >= add_months('2018-01-01', -6)
