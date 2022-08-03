
Setting environment for using XAMPP for Windows.
jawad@DESKTOP-U23J2E2 c:\xampp
# mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 223
Server version: 10.4.24-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use themepark;
Database changed
MariaDB [themepark]> select distinct emp_fname,emp_lname from employee natural join hours where hour_rate > (select avg(hour_rate) from hours);
+-----------+-----------+
| emp_fname | emp_lname |
+-----------+-----------+
| Enrica    | Denver    |
| Mirrelle  | Namowa    |
+-----------+-----------+
2 rows in set (0.002 sec)

MariaDB [themepark]> select distinct emp_fname,emp_lname,date_worked,(select avg(hours_per_attract)from hours)as average,hours_per_attract - (select avg(hours_per_attract)from hours)as difference from employee natural join hours;
+-----------+------------+-------------+---------+------------+
| emp_fname | emp_lname  | date_worked | average | difference |
+-----------+------------+-------------+---------+------------+
| Emma      | Calderdale | 2007-05-18  |  4.9091 |     1.0909 |
| Emma      | Calderdale | 2007-05-20  |  4.9091 |     1.0909 |
| Marshel   | Ricardo    | 2007-05-18  |  4.9091 |     1.0909 |
| Arif      | Arshad     | 2007-05-23  |  4.9091 |    -1.9091 |
| Arif      | Arshad     | 2007-05-21  |  4.9091 |     1.0909 |
| Arif      | Arshad     | 2007-05-22  |  4.9091 |    -1.9091 |
| Enrica    | Denver     | 2007-05-21  |  4.9091 |     1.0909 |
| Enrica    | Denver     | 2007-05-22  |  4.9091 |     1.0909 |
| Mirrelle  | Namowa     | 2007-05-18  |  4.9091 |    -1.9091 |
| Mirrelle  | Namowa     | 2007-05-19  |  4.9091 |     1.0909 |
+-----------+------------+-------------+---------+------------+
10 rows in set (0.002 sec)

MariaDB [themepark]> select attract_capacity,attract_capacity <= (select avg(attract_capacity)from attraction)from attraction;
+------------------+-------------------------------------------------------------------+
| attract_capacity | attract_capacity <= (select avg(attract_capacity)from attraction) |
+------------------+-------------------------------------------------------------------+
|               34 |                                                                 1 |
|               62 |                                                                 1 |
|               24 |                                                                 1 |
|               30 |                                                                 1 |
|               40 |                                                                 1 |
|              120 |                                                                 0 |
|              200 |                                                                 0 |
|               34 |                                                                 1 |
|               42 |                                                                 1 |
|               80 |                                                                 0 |
|               80 |                                                                 0 |
+------------------+-------------------------------------------------------------------+
11 rows in set (0.002 sec)

MariaDB [themepark]>