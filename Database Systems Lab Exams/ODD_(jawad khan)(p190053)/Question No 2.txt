
MariaDB [(none)]> use person;
Database changed
MariaDB [person]> show tables
    -> ;
+------------------+
| Tables_in_person |
+------------------+
| persoon          |
| summary          |
| users            |
+------------------+
3 rows in set (0.001 sec)

MariaDB [person]> select * from persoon
    -> ;
+----+------------------+
| id | email            |
+----+------------------+
|  1 | john@example.com |
|  2 | bob@example.com  |
+----+------------------+
2 rows in set (0.710 sec)

MariaDB [person]> create table per (
    -> id int,
    -> email varchar(25),
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.227 sec)

MariaDB [person]> select * from per;
Empty set (0.002 sec)

MariaDB [person]> insert into per(id,email) values(1,'john@example.com');
Query OK, 1 row affected (0.086 sec)


MariaDB [person]> insert into per(id,email) values(2,'bob@example.com');
Query OK, 1 row affected (0.106 sec)

MariaDB [person]> insert into per(id,email) values(3,'john@example.com');
Query OK, 1 row affected (0.203 sec)

MariaDB [person]> select * from per;
+----+------------------+
| id | email            |
+----+------------------+
|  1 | john@example.com |
|  2 | bob@example.com  |
|  3 | john@example.com |
+----+------------------+
3 rows in set (0.000 sec)


MariaDB [person]> delete from per where id not in (select * from (select min(id) from per group by email) as p);
Query OK, 1 row affected (0.152 sec)

MariaDB [person]> select * from per;
+----+------------------+
| id | email            |
+----+------------------+
|  1 | john@example.com |
|  2 | bob@example.com  |
+----+------------------+
2 rows in set (0.000 sec)

MariaDB [person]>
