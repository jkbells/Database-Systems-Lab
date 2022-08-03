CREATE VIEW EMPFR AS SELECT * FROM EMPLOYEE WHERE PARK_CODE = 'FR1001' WITH CHECK OPTION;
Query OK, 0 rows affected (0.089 sec)


SELECT * FROM EMPFR;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
3 rows in set (0.000 sec)

UPDATE EMPFR SET EMP_PHONE = '324-9652'
    -> WHERE EMP_NUM = 105;
Query OK, 1 row affected (0.054 sec)
Rows matched: 1  Changed: 1  Warnings: 0

SELECT * FROM EMPFR;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 324-9652  | FR1001    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
3 rows in set (0.001 sec)

DROP VIEW EMPFR;
Query OK, 0 rows affected (0.001 sec)

-------------------------------------------- 6.2-------------------------------------

CREATE VIEW EMP_DETAILS as
    -> SELECT EMP_NUM,PARK_CODE,PARK_NAME,EMP_LNAME,EMP_FNAME,EMP_HIRE_DATE,EMP_DOB
    -> FROM THEMEPARK NATURAL JOIN EMPLOYEE
    -> WITH CHECK OPTION;
Query OK, 0 rows affected (0.042 sec)

MariaDB [ThemePark]> DESCRIBE EMP_DETAILS;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMP_NUM       | decimal(4,0) | NO   |     | NULL    |       |
| PARK_CODE     | varchar(10)  | NO   |     | NULL    |       |
| PARK_NAME     | varchar(35)  | NO   |     | NULL    |       |
| EMP_LNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_FNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_HIRE_DATE | date         | YES  |     | NULL    |       |
| EMP_DOB       | date         | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
7 rows in set (0.002 sec)

--------------------------------------------6.3 ---------------------------------

SELECT EMP_FNAME,EMP_LNAME,PARK_NAME FROM EMP_DETAILS;
+-----------+------------+--------------+
| EMP_FNAME | EMP_LNAME  | PARK_NAME    |
+-----------+------------+--------------+
| Emma      | Calderdale | FairyLand    |
| Marshel   | Ricardo    | PleasureLand |
| Arif      | Arshad     | FairyLand    |
| Anne      | Roberts    | PleasureLand |
| Enrica    | Denver     | GoldTown     |
| Mirrelle  | Namowa     | FairyLand    |
| Gemma     | Smith      | GoldTown     |
+-----------+------------+--------------+
7 rows in set (0.001 sec)

------------------------------------------6.4-------------------------------------

CREATE VIEW TICKET_SALES as
    -> SELECT PARK_NAME, min(LINE_PRICE),max(LINE_PRICE)
    -> FROM THEMEPARK join SALES using(PARK_CODE)
    -> join SALES_LINE using(TRANSACTION_NO)
    -> group by PARK_NAME;
Query OK, 0 rows affected (0.058 sec)

MariaDB [ThemePark]> SELECT * FROM TICKET_SALES;
+--------------+-----------------+-----------------+
| PARK_NAME    | min(LINE_PRICE) | max(LINE_PRICE) |
+--------------+-----------------+-----------------+
| FairyLand    |           14.99 |          139.96 |
| GoldTown     |           12.12 |          114.68 |
| PleasureLand |           21.98 |          168.40 |
+--------------+-----------------+-----------------+
3 rows in set (0.001 sec)


-------------------------------------------6.5--------------------------------------

SELECT DISTINCT (DATE_FORMAT(SALE_DATE,'%a-%e-%m-%y')) FROM SALES;
+----------------------------------------+
| (DATE_FORMAT(SALE_DATE,'%a-%e-%m-%y')) |
+----------------------------------------+
| Fri-18-05-07                           |
+----------------------------------------+
1 row in set (0.001 sec)


---------------------------6.6-----------------------------------------------------
ELECT EMP_FNAME,EMP_LNAME, concat(substr(EMP_DOB,6,2),'01',UPPER(SUBSTR(EMP_LNAME,1,6))) as USER_ID
    -> FROM EMPLOYEE;
+-----------+------------+------------+
| EMP_FNAME | EMP_LNAME  | USER_ID    |
+-----------+------------+------------+
| Emma      | Calderdale | 0601CALDER |
| Marshel   | Ricardo    | 0301RICARD |
| Arif      | Arshad     | 1101ARSHAD |
| Anne      | Roberts    | 1001ROBERT |
| Enrica    | Denver     | 1101DENVER |
| Mirrelle  | Namowa     | 0301NAMOWA |
| Gemma     | Smith      | 0201SMITH  |
+-----------+------------+------------+
7 rows in set (0.001 sec)


-------------------6.7-----------------------------------

SELECT CONCAT(EMP_FNAME,' ',EMP_LNAME) AS NAME, EMP_DOB
    -> FROM EMPLOYEE WHERE DAYOFMONTH(EMP_DOB) = '14';
+-----------------+------------+
| NAME            | EMP_DOB    |
+-----------------+------------+
| Arif Arshad     | 1969-11-14 |
| Mirrelle Namowa | 1990-03-14 |
+-----------------+------------+
2 rows in set (0.001 sec)


----------------------6.8--------------------

SELECT CONCAT(SUBSTR(EMP_PHONE,1,2),LOWER(SUBSTR(EMP_FNAME,1,2))) AS USER_PASSWORD
    -> FROM EMPLOYEE;
+---------------+
| USER_PASSWORD |
+---------------+
| 32em          |
| 32ma          |
| 67ar          |
| 89an          |
| 50en          |
| 32mi          |
| 32ge          |
+---------------+
7 rows in set (0.001 sec)

