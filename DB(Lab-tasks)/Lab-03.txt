

E3.1 Write a query to display all Theme Parks except those in the UK.


MariaDB [p190053_jawad]> SELECT * FROM THEMEPARK WHERE PARK_COUNTRY != 'UK';
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
5 rows in set (0.000 sec)





E3.2 Write a query to display all the sales that occurred on the 18th May 2007.



MariaDB [p190053_jawad]> SELECT * FROM SALES WHERE SALE_DATE = '2007-05-18';
+----------------+-----------+------------+
| TRANSACTION_NO | PARK_CODE | SALE_DATE  |
+----------------+-----------+------------+
|          12781 | FR1001    | 2007-05-18 |
|          12782 | FR1001    | 2007-05-18 |
|          12783 | FR1001    | 2007-05-18 |
|          12784 | FR1001    | 2007-05-18 |
|          12785 | FR1001    | 2007-05-18 |
|          12786 | FR1001    | 2007-05-18 |
|          34534 | UK3452    | 2007-05-18 |
|          34535 | UK3452    | 2007-05-18 |
|          34536 | UK3452    | 2007-05-18 |
|          34537 | UK3452    | 2007-05-18 |
|          34538 | UK3452    | 2007-05-18 |
|          34539 | UK3452    | 2007-05-18 |
|          34540 | UK3452    | 2007-05-18 |
|          34541 | UK3452    | 2007-05-18 |
|          67589 | ZA1342    | 2007-05-18 |
|          67590 | ZA1342    | 2007-05-18 |
|          67591 | ZA1342    | 2007-05-18 |
|          67592 | ZA1342    | 2007-05-18 |
|          67593 | ZA1342    | 2007-05-18 |
+----------------+-----------+------------+
19 rows in set (0.000 sec)



E3.3 Write a query to display the ticket prices between €20 AND €30.


MariaDB [p190053_jawad]> SELECT * FROM TICKET WHERE TICKET_PRICE BETWEEN 20 AND 30;
+-----------+--------------+-------------+-----------+
| TICKET_NO | TICKET_PRICE | TICKET_TYPE | PARK_CODE |
+-----------+--------------+-------------+-----------+
|     11001 |        24.99 | Adult       | SP4533    |
|     13003 |        20.99 | Senior      | FR1001    |
|     67833 |        28.67 | Adult       | ZA1342    |
|     88567 |        22.50 | Child       | UK3452    |
+-----------+--------------+-------------+-----------+
4 rows in set (0.000 sec)








E3.4 Display all attractions that have a capacity of more than 60 at the Theme Park
FR1001.


MariaDB [p190053_jawad]> SELECT * FROM ATTRACTION WHERE ATTRACT_CAPACITY > 60 AND PARK_CODE = 'FR1001';
+------------+-----------------+-------------+------------------+-----------+
| ATTRACT_NO | ATTRACT_NAME    | ATTRACT_AGE | ATTRACT_CAPACITY | PARK_CODE |
+------------+-----------------+-------------+------------------+-----------+
|      10056 | SpinningTeacups |           4 |               62 | FR1001    |
|      10098 | Carnival        |           3 |              120 | FR1001    |
+------------+-----------------+-------------+------------------+-----------+
2 rows in set (0.000 sec)





E3.5 Write a query to display the hourly rate for each attraction where an employee had
worked, along with the hourly rate increased by 20%. Your query should only
Display the ATTRACT_NO, HOUR_RATE and the HOUR_RATE with the 20% Increase.




MariaDB [p190053_jawad]> SELECT ATTRACT_NO, HOUR_RATE + ROUND((HOUR_RATE *0.2),2) AS INCREASED_RATE FROM HOURS;
+------------+-----------+----------------+
| ATTRACT_NO | HOUR_RATE | INCREASED_RATE |
+------------+-----------+----------------+
|      10034 |      6.50 |           1.30 |
|      10034 |      6.50 |           1.30 |
|      10034 |      6.50 |           1.30 |
|      30012 |      5.99 |           1.20 |
|      30044 |      5.99 |           1.20 |
|      30044 |      5.99 |           1.20 |
|      30011 |      7.20 |           1.44 |
|      30012 |      7.20 |           1.44 |
|      10078 |      8.50 |           1.70 |
|      10098 |      8.50 |           1.70 |
|      10098 |      8.50 |           1.70 |
+------------+-----------+----------------+
11 rows in set (0.010 sec)







E.3.6 Elaborate Difference (IN vs BETWEEN) operators with examples.




IN:       SELECT SPECIFIC VALUES.



MariaDB [p190053_jawad]> SELECT EMP_NUM, EMP_FNAME FROM EMPLOYEE WHERE EMP_NUM IN(101,105);
+---------+-----------+
| EMP_NUM | EMP_FNAME |
+---------+-----------+
|     101 | Marshel   |
|     105 | Mirrelle  |
+---------+-----------+
2 rows in set (0.000 sec)




BETWEEN:  DEFINES THE RANGE THAT SHOULD BE INCLUDED.

MariaDB [p190053_jawad]> SELECT EMP_NUM, EMP_FNAME FROM EMPLOYEE WHERE EMP_NUM BETWEEN 101 AND 105;

+---------+-----------+
| EMP_NUM | EMP_FNAME |
+---------+-----------+
|     101 | Marshel   |
|     102 | Arif      |
|     103 | Anne      |
|     104 | Enrica    |
|     105 | Mirrelle  |
+---------+-----------+



E.3.7 Write a query to display all unique employees that exist in the HOURS table.




MariaDB [p190053_jawad]> SELECT DISTINCT(EMP_NUM) FROM HOURS;
+---------+
| EMP_NUM |
+---------+
|     100 |
|     101 |
|     102 |
|     104 |
|     105 |
+---------+
5 rows in set (0.000 sec)





E.3.8 Display all information from the SALES table in descending order of the sale date.



MariaDB [p190053_jawad]> SELECT * FROM SALES ORDER BY SALE_DATE DESC;
+----------------+-----------+------------+
| TRANSACTION_NO | PARK_CODE | SALE_DATE  |
+----------------+-----------+------------+
|          12781 | FR1001    | 2007-05-18 |
|          67592 | ZA1342    | 2007-05-18 |
|          67591 | ZA1342    | 2007-05-18 |
|          67590 | ZA1342    | 2007-05-18 |
|          67589 | ZA1342    | 2007-05-18 |
|          34541 | UK3452    | 2007-05-18 |
|          34540 | UK3452    | 2007-05-18 |
|          34539 | UK3452    | 2007-05-18 |
|          34538 | UK3452    | 2007-05-18 |
|          34537 | UK3452    | 2007-05-18 |
|          34536 | UK3452    | 2007-05-18 |
|          34535 | UK3452    | 2007-05-18 |
|          34534 | UK3452    | 2007-05-18 |
|          12786 | FR1001    | 2007-05-18 |
|          12785 | FR1001    | 2007-05-18 |
|          12784 | FR1001    | 2007-05-18 |
|          12783 | FR1001    | 2007-05-18 |
|          12782 | FR1001    | 2007-05-18 |
|          67593 | ZA1342    | 2007-05-18 |
+----------------+-----------+------------+
19 rows in set (0.000 sec)





E.3.9 Write a query to show the transaction numbers and lineprices (in the SALES_LINE
table) that are greater than €50.


MariaDB [p190053_jawad]> SELECT TRANSACTION_NO, LINE_PRICE FROM SALES_LINE WHERE LINE_PRICE > 50;
+----------------+------------+
| TRANSACTION_NO | LINE_PRICE |
+----------------+------------+
|          12781 |      69.98 |
|          12782 |      69.98 |
|          12785 |     139.96 |
|          34534 |     168.40 |
|          34535 |      84.20 |
|          34537 |      84.20 |
|          34539 |      84.20 |
|          34540 |     168.40 |
|          34541 |      84.20 |
|          67589 |      57.34 |
|          67590 |      57.34 |
|          67592 |     114.68 |
|          67593 |      57.34 |
+----------------+------------+
13 rows in set (0.000 sec)



