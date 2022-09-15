SHOW DATABASES;
USE sql_df;
SHOW TABLES;
SHOW TABLES FROM sql_store;
SELECT VERSION();


-- 拼接字段:concat--
SELECT concat(name1,'(',name2,')')
	AS ven_title  -- 赋予别名--
FROM Vendors
ORDER BY vend_name;

-- SELECT 省略后面的FROM 就是简单的处理数据--
SELECT now();   -- 返回当前时间--
SELECT curdate();  -- 函数的使用--

-- 时间处理函数 --
SELECT order_num
FROM Orders
WHERE YEAR(order_date) = 2012;  -- year 函数提取年份--


-- GROUP BY --分组函数
SELECT ven_id,COUNT(*) AS num_prd
FROM productes
GROUP BY venid;

-- HAVING -- 过滤分组
SELECT ven_id,COUNT(*) AS num_prd
FROM productes
GROUP BY venid
HAVING COUNT(*) > 2;

-- 














































