SQL> CREATE TABLE orders (
  2      order_id NUMBER,
  3      order_date DATE,
  4      amount NUMBER(10,2),
  5      product_id NUMBER
  6  );

Table created.

SQL> INSERT INTO orders VALUES (1, TO_DATE('2024-01-05','YYYY-MM-DD'), 1500, 101);

1 row created.

SQL> INSERT INTO orders VALUES (2, TO_DATE('2024-01-15','YYYY-MM-DD'), 2500, 102);

1 row created.

SQL> INSERT INTO orders VALUES (3, TO_DATE('2024-02-10','YYYY-MM-DD'), 3000, 101);

1 row created.

SQL> INSERT INTO orders VALUES (4, TO_DATE('2024-02-18','YYYY-MM-DD'), 4000, 103);

1 row created.

SQL> INSERT INTO orders VALUES (5, TO_DATE('2024-03-01','YYYY-MM-DD'), 5000, 104);

1 row created.

SQL> INSERT INTO orders VALUES (6, TO_DATE('2024-03-20','YYYY-MM-DD'), 6000, 105);

1 row created.

SQL> INSERT INTO orders VALUES (7, TO_DATE('2024-04-05','YYYY-MM-DD'), 7000, 106);

1 row created.

SQL> INSERT INTO orders VALUES (8, TO_DATE('2024-04-15','YYYY-MM-DD'), 8000, 107);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM orders;

  ORDER_ID ORDER_DAT     AMOUNT PRODUCT_ID
---------- --------- ---------- ----------
         1 05-JAN-24       1500        101
         2 15-JAN-24       2500        102
         3 10-FEB-24       3000        101
         4 18-FEB-24       4000        103
         5 01-MAR-24       5000        104
         6 20-MAR-24       6000        105
         7 05-APR-24       7000        106
         8 15-APR-24       8000        107

8 rows selected.

SQL> SELECT
  2      EXTRACT(YEAR FROM order_date) AS order_year,
  3      EXTRACT(MONTH FROM order_date) AS order_month,
  4      COUNT(DISTINCT order_id) AS total_orders,
  5      SUM(amount) AS total_revenue
  6  FROM orders
  7  GROUP BY
  8      EXTRACT(YEAR FROM order_date),
  9      EXTRACT(MONTH FROM order_date)
 10  ORDER BY order_year, order_month;

ORDER_YEAR ORDER_MONTH TOTAL_ORDERS TOTAL_REVENUE
---------- ----------- ------------ -------------
      2024           1            2          4000
      2024           2            2          7000
      2024           3            2         11000
      2024           4            2         15000

SQL> SELECT *
  2  FROM (
  3      SELECT
  4          EXTRACT(YEAR FROM order_date) AS order_year,
  5          EXTRACT(MONTH FROM order_date) AS order_month,
  6          SUM(amount) AS total_revenue
  7      FROM orders
  8      GROUP BY
  9          EXTRACT(YEAR FROM order_date),
 10          EXTRACT(MONTH FROM order_date)
 11      ORDER BY total_revenue DESC
 12  )
 13  WHERE ROWNUM <= 3;

ORDER_YEAR ORDER_MONTH TOTAL_REVENUE
---------- ----------- -------------
      2024           4         15000
      2024           3         11000
      2024           2          7000

SQL> SELECT
  2      TO_CHAR(order_date, 'YYYY') AS year,
  3      TO_CHAR(order_date, 'Month') AS month,
  4      COUNT(DISTINCT order_id) AS total_orders,
  5      SUM(amount) AS total_revenue
  6  FROM orders
  7  GROUP BY
  8      TO_CHAR(order_date, 'YYYY'),
  9      TO_CHAR(order_date, 'Month')
 10  ORDER BY year;

YEAR MONTH                                TOTAL_ORDERS TOTAL_REVENUE
---- ------------------------------------ ------------ -------------
2024 April                                           2         15000
2024 February                                        2          7000
2024 January                                         2          4000
2024 March                                           2         11000
