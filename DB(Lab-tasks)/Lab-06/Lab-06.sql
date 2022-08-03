Database changed

E4.1 Write a query that displays the average hourly rate that has been paid to all employees.
Your query should return €7.03.



MariaDB [p190053_jawad]> SELECT AVG(HOUR_RATE)
    -> FROM HOURS;
+----------------+
| AVG(HOUR_RATE) |
+----------------+
|       7.033636 |
+----------------+
1 row in set (0.001 sec)




E4.2 Write a query that displays the average attraction age for all attractions where the
PARK_CODE is equal to ‘UK3452’. Your query should return 7.25 years.




MariaDB [p190053_jawad]> SELECT AVG(ATTRACT_AGE)
    -> FROM ATTRACTION WHERE PARK_CODE = "UK3452";
+------------------+
| AVG(ATTRACT_AGE) |
+------------------+
|           7.2500 |
+------------------+
1 row in set (0.012 sec)


E4.3 Display the employee numbers of all employees and the total number of hours they
have worked. Output format


MariaDB [p190053_jawad]> SELECT EMP_NUM,SUM(HOURS_PER_ATTRACT)
    -> FROM HOURS GROUP BY EMP_NUM;
+---------+------------------------+
| EMP_NUM | SUM(HOURS_PER_ATTRACT) |
+---------+------------------------+
|     100 |                     12 |
|     101 |                      6 |
|     102 |                     12 |
|     104 |                     12 |
|     105 |                     12 |
+---------+------------------------+
5 rows in set (0.017 sec)


E4.4 Show the attraction number and the minimum and maximum hourly rate for each attraction.


MariaDB [p190053_jawad]> SELECT ATTRACT_NO, MIN(HOUR_RATE) , MAX(HOUR_RATE)
    -> FROM HOURS
    -> GROUP BY ATTRACT_NO;
+------------+----------------+----------------+
| ATTRACT_NO | MIN(HOUR_RATE) | MAX(HOUR_RATE) |
+------------+----------------+----------------+
|      10034 |           6.50 |           6.50 |
|      10078 |           8.50 |           8.50 |
|      10098 |           8.50 |           8.50 |
|      30011 |           7.20 |           7.20 |
|      30012 |           5.99 |           7.20 |
|      30044 |           5.99 |           5.99 |
+------------+----------------+----------------+
6 rows in set (0.023 sec)

E4.5 Using the HOURS table, write a query to display the employee number (EMP_NUM), the
attraction number (ATTRACT-NO) and the average hours worked per attraction
(HOURS_PER_ATTRACT) limiting the result to where the average hours worked per attraction
is greater or equal to 5. Check your results against those shown in below Figure.


MariaDB [p190053_jawad]> SELECT EMP_NUM,ATTRACT_NO, AVG(HOURS_PER_ATTRACT)
    -> FROM HOURS
    -> GROUP BY EMP_NUM, ATTRACT_NO
    -> HAVING AVG(HOURS_PER_ATTRACT)>5;
+---------+------------+------------------------+
| EMP_NUM | ATTRACT_NO | AVG(HOURS_PER_ATTRACT) |
+---------+------------+------------------------+
|     100 |      10034 |                 6.0000 |
|     101 |      10034 |                 6.0000 |
|     104 |      30011 |                 6.0000 |
|     104 |      30012 |                 6.0000 |
+---------+------------+------------------------+
4 rows in set (0.000 sec)

E 4.6 Write a CROSS JOIN query which selects all rows from the EMPLOYEE and
HOURS tables. How many rows were returned?



MariaDB [p190053_jawad]> select count(*) from employee cross join hours;
+----------+
| count(*) |
+----------+
|       77 |
+----------+
1 row in set (0.026 sec)




E.4.7 Write a query that displays the employees first and last name (EMP_FNAME
and EMP_LNAME), the attraction number(ATTRACT_NO) and the date worked.
Hint: (You will have to join the HOURS and the EMPLOYEE tables. Check your results with
those shown in below figure.)



MariaDB [p190053_jawad]> SELECT EMPLOYEE.EMP_FNAME,EMPLOYEE.EMP_LNAME,HOURS.ATTRACT_NO,HOURS.DATE_WORKED
    -> FROM EMPLOYEE JOIN HOURS ON EMPLOYEE.EMP_NUM = HOURS.EMP_NUM;
+-----------+------------+------------+-------------+
| EMP_FNAME | EMP_LNAME  | ATTRACT_NO | DATE_WORKED |
+-----------+------------+------------+-------------+
| Emma      | Calderdale |      10034 | 2007-05-18  |
| Emma      | Calderdale |      10034 | 2007-05-20  |
| Marshel   | Ricardo    |      10034 | 2007-05-18  |
| Arif      | Arshad     |      30012 | 2007-05-23  |
| Arif      | Arshad     |      30044 | 2007-05-21  |
| Arif      | Arshad     |      30044 | 2007-05-22  |
| Enrica    | Denver     |      30011 | 2007-05-21  |
| Enrica    | Denver     |      30012 | 2007-05-22  |
| Mirrelle  | Namowa     |      10078 | 2007-05-18  |
| Mirrelle  | Namowa     |      10098 | 2007-05-18  |
| Mirrelle  | Namowa     |      10098 | 2007-05-19  |
+-----------+------------+------------+-------------+
11 rows in set (0.001 sec)


E4.8 Rewrite the query you wrote in E 4.7 so that the attraction name
(ATTRACT_NAME located in the ATTRACTION table) is also displayed.
Hint: (You will need to join three tables. Your output should match that shown in
below Figure.)



MariaDB [p190053_jawad]> SELECT EMP_FNAME,EMP_LNAME,ATTRACT_NO,ATTRACT_NAME
    -> FROM EMPLOYEE
    -> NATURAL JOIN HOURS
    -> NATURAL JOIN ATTRACTION;
+-----------+------------+------------+----------------+
| EMP_FNAME | EMP_LNAME  | ATTRACT_NO | ATTRACT_NAME   |
+-----------+------------+------------+----------------+
| Emma      | Calderdale |      10034 | ThunderCoaster |
| Emma      | Calderdale |      10034 | ThunderCoaster |
| Mirrelle  | Namowa     |      10078 | Ant-Trap       |
| Mirrelle  | Namowa     |      10098 | Carnival       |
| Mirrelle  | Namowa     |      10098 | Carnival       |
+-----------+------------+------------+----------------+
5 rows in set (0.001 sec)


E4.9 Display the park names and total sales for Theme Parks who are located in the
country ‘UK’ or ‘FR’.


MariaDB [p190053_jawad]> select park_name, sum(line_price) from themepark join sales using (park_code) join sales_line using (transaction_no) where park_country="UK" OR park_country = "FR" group by park_name;
+--------------+-----------------+
| park_name    | sum(line_price) |
+--------------+-----------------+
| FairyLand    |          401.86 |
| PleasureLand |          851.00 |
+--------------+-----------------+
2 rows in set (0.001 sec)




E4.10 List the sale date, line quantity and line price of all transactions on the 18th May
2007.
Hint: (Remember the format of MySQL dates is ‘2007-05-18’).


MariaDB [p190053_jawad]> SELECT SALE_DATE , LINE_QTY, LINE_PRICE
    -> FROM SALES NATURAL JOIN SALES_LINE
    -> WHERE SALE_DATE = '2007-05-18';
+------------+----------+------------+
| SALE_DATE  | LINE_QTY | LINE_PRICE |
+------------+----------+------------+
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        2 |      41.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      34.99 |
| 2007-05-18 |        4 |     139.96 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        1 |      18.56 |
| 2007-05-18 |        1 |      12.12 |
| 2007-05-18 |        4 |     114.68 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
+------------+----------+------------+
31 rows in set (0.018 sec)

6)

MariaDB [p190053_jawad]> select * from employee cross join hours;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+---------+------------+-------------------+-----------+-------------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE | EMP_NUM | ATTRACT_NO | HOURS_PER_ATTRACT | HOUR_RATE | DATE_WORKED |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+---------+------------+-------------------+-----------+-------------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+---------+------------+-------------------+-----------+-------------+
77 rows in set (0.003 sec)

MariaDB [p190053_jawad]>
