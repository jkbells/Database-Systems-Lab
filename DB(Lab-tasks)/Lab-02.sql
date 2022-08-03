
MariaDB [(none)]> use themepark;
Database changed
MariaDB [themepark]> show tables;
+---------------------+
| Tables_in_themepark |
+---------------------+
| attraction          |
| employee            |
| hours               |
| sales               |
| sales_line          |
| themepark           |
| ticket              |
+---------------------+
7 rows in set (0.001 sec)

MariaDB [themepark]> describe themepark;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| PARK_CODE    | varchar(10) | NO   | PRI | NULL    |       |
| PARK_NAME    | varchar(35) | NO   |     | NULL    |       |
| PARK_CITY    | varchar(50) | YES  |     | NULL    |       |
| PARK_COUNTRY | char(2)     | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.011 sec)

MariaDB [themepark]> insert into themepark values('AU1001','SkiWorld','AU','UK');
Query OK, 1 row affected (0.076 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | SkiWorld      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.000 sec)

MariaDB [themepark]> insert into themepark values('GR5001','RobotLand','GR','SP');
Query OK, 1 row affected (0.069 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | SkiWorld      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| GR5001    | RobotLand     | GR           | SP           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.000 sec)

MariaDB [themepark]> show tables;
+---------------------+
| Tables_in_themepark |
+---------------------+
| attraction          |
| employee            |
| hours               |
| sales               |
| sales_line          |
| themepark           |
| ticket              |
+---------------------+
7 rows in set (0.001 sec)

MariaDB [themepark]> describe employee;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMP_NUM       | decimal(4,0) | NO   | PRI | NULL    |       |
| EMP_TITLE     | varchar(4)   | YES  |     | NULL    |       |
| EMP_LNAME     | varchar(15)  | NO   | MUL | NULL    |       |
| EMP_FNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_DOB       | date         | NO   |     | NULL    |       |
| EMP_HIRE_DATE | date         | YES  |     | NULL    |       |
| EMP_AREA_CODE | varchar(4)   | NO   |     | NULL    |       |
| EMP_PHONE     | varchar(12)  | NO   |     | NULL    |       |
| PARK_CODE     | varchar(10)  | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
9 rows in set (0.010 sec)

MariaDB [themepark]> select * from employee;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
7 rows in set (0.000 sec)

MariaDB [themepark]> insert into employee values('2049','Mr','Rahat','Noman','1990-12-20','2015-5-5','7253','502-4934','AU1001');
Query OK, 1 row affected (0.078 sec)

MariaDB [themepark]> select * from employee;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |
|    2049 | Mr        | Rahat      | Noman     | 1990-12-20 | 2015-05-05    | 7253          | 502-4934  | AU1001    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
8 rows in set (0.000 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | SkiWorld      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| GR5001    | RobotLand     | GR           | SP           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.000 sec)

MariaDB [themepark]> update themepark
    -> park_name = 'Miniland';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '= 'Miniland'' at line 2
MariaDB [themepark]> update themepark
    -> park_name = 'Miniland'
    -> Bye

jawad@DESKTOP-U23J2E2 c:\xampp
# mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 133
Server version: 10.4.24-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use themepark;
Database changed
MariaDB [themepark]> show tables;
+---------------------+
| Tables_in_themepark |
+---------------------+
| attraction          |
| employee            |
| hours               |
| sales               |
| sales_line          |
| themepark           |
| ticket              |
+---------------------+
7 rows in set (0.001 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | SkiWorld      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| GR5001    | RobotLand     | GR           | SP           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.000 sec)

MariaDB [themepark]> update themepark set park_name='MiniLand' where park_code=AU1001;
ERROR 1054 (42S22): Unknown column 'AU1001' in 'where clause'
MariaDB [themepark]> update themepark set park_name='MiniLand' where park_code='AU1001';
Query OK, 1 row affected (0.060 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | MiniLand      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| GR5001    | RobotLand     | GR           | SP           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.000 sec)

MariaDB [themepark]> delete from themepark where park_name='RobotLand' and park_code='AU1001';
Query OK, 0 rows affected (0.044 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | MiniLand      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| GR5001    | RobotLand     | GR           | SP           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.000 sec)

MariaDB [themepark]> delete from themepark where park_name='RobotLand' and park_code='GR5001';
Query OK, 1 row affected (0.125 sec)

MariaDB [themepark]> select * from themepark;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| AU1001    | MiniLand      | AU           | UK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| JK1001    | Greengarden   | uk           | un           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.000 sec)
