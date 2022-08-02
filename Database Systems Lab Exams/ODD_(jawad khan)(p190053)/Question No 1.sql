1) 

MariaDB [hr]> SELECT * FROM `employees` ORDER BY `salary` DESC LIMIT 1 OFFSET 2;
+-------------+------------+-----------+---------+--------------+------------+--------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name | email   | phone_number | hire_date  | job_id | salary   | commission_pct | manager_id | department_id |
+-------------+------------+-----------+---------+--------------+------------+--------+----------+----------------+------------+---------------+
|         102 | Lex        | De Haan   | LDEHAAN | 515.123.4569 | 1993-01-13 | AD_VP  | 17000.00 |           NULL |        100 |            90 |
+-------------+------------+-----------+---------+--------------+------------+--------+----------+----------------+------------+---------------+
1 row in set (0.000 sec)

2)


MariaDB [hr]> Create view emp as select employee_id, first_name,max(salary), job_id from employees where job_id = 'ST_clerk';
Query OK, 0 rows affected (0.088 sec)


MariaDB [hr]> Create view clerk  as select employee_id, first_name,phone_number,max(salary), job_id from employees where job_id = 'ST_clerk';
Query OK, 0 rows affected (0.315 sec)

MariaDB [hr]> select * from neur;
+-------------+------------+--------------+-------------+----------+
| employee_id | first_name | phone_number | max(salary) | job_id   |
+-------------+------------+--------------+-------------+----------+
|         125 | Julia      | 650.124.1214 |     3600.00 | ST_CLERK |
+-------------+------------+--------------+-------------+----------+
1 row in set (0.001 sec)


3)

 SELECT first_name, last_name, salary FROM employees WHERE job_id='FI_ACCOUNT' AND salary > (SELECT MAX(salary) FROM employees);
+-------------+-----------+---------+
| first_name  | last_name | salary  |
+-------------+-----------+---------+
| Daniel      | Faviet    | 9000.00 |
| John        | Chen      | 8200.00 |
| Jose Manuel | Urman     | 7800.00 |
+-------------+-----------+---------+
3 rows in set (0.001 sec)

4)

MariaDB [hr]> select first_name,last_name from employees where salary>(select max(salary) from employees where first_name="Peter");
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Nancy      | Greenberg |
| Den        | Raphaely  |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Gerald     | Cambrault |
| Eleni      | Zlotkey   |
| Clara      | Vishney   |
| Lisa       | Ozer      |
| Ellen      | Abel      |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+
15 rows in set (0.002 sec)

MariaDB [hr]> select first_name,last_name from employees where salary>(select salary from employees where first_name="Lisa");
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Nancy      | Greenberg |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+
9 rows in set (0.002 sec)

5)
									
MariaDB [hr]> SELECT * FROM employees 
    -> WHERE salary > 
    -> ALL(SELECT avg(salary)FROM employees GROUP BY department_id);
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name | email | phone_number | hire_date  | job_id  | salary   | commission_pct | manager_id | department_id |
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING | 515.123.4567 | 1987-06-17 | AD_PRES | 24000.00 |           NULL |       NULL |            90 |
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
1 row in set (0.002 sec)

6)
									
MariaDB [hr]> select first_name , last_name , salary , department_id
    -> from employees
    -> where salary In
    ->   (select MAX(salary) from employees 
    -> group by department_id);
+------------+-----------+----------+---------------+
| first_name | last_name | salary   | department_id |
+------------+-----------+----------+---------------+
| Steven     | King      | 24000.00 |            90 |
| Alexander  | Hunold    |  9000.00 |            60 |
| Nancy      | Greenberg | 12000.00 |           100 |
| Daniel     | Faviet    |  9000.00 |           100 |
| John       | Chen      |  8200.00 |           100 |
| Den        | Raphaely  | 11000.00 |            30 |
| Adam       | Fripp     |  8200.00 |            50 |
| Shanta     | Vollman   |  6500.00 |            50 |
| John       | Russell   | 14000.00 |            80 |
| Alberto    | Errazuriz | 12000.00 |            80 |
| Gerald     | Cambrault | 11000.00 |            80 |
| Peter      | Tucker    | 10000.00 |            80 |
| Peter      | Hall      |  9000.00 |            80 |
| Oliver     | Tuvault   |  7000.00 |            80 |
| Janette    | King      | 10000.00 |            80 |
| Allan      | McEwen    |  9000.00 |            80 |
| Sarath     | Sewall    |  7000.00 |            80 |
| Harrison   | Bloom     | 10000.00 |            80 |
| Ellen      | Abel      | 11000.00 |            80 |
| Kimberely  | Grant     |  7000.00 |          NULL |
| Jennifer   | Whalen    |  4400.00 |            10 |
| Michael    | Hartstein | 13000.00 |            20 |
| Susan      | Mavris    |  6500.00 |            40 |
| Hermann    | Baer      | 10000.00 |            70 |
| Shelley    | Higgins   | 12000.00 |           110 |
+------------+-----------+----------+---------------+
25 rows in set (0.002 sec)


7)



MariaDB [hr]> select first_name,last_name,job_id from employees where  department_id=20;
+------------+-----------+--------+
| first_name | last_name | job_id |
+------------+-----------+--------+
| Michael    | Hartstein | MK_MAN |
| Pat        | Fay       | MK_REP |
+------------+-----------+--------+
2 rows in set (0.001 sec)

8)


MariaDB [hr]> SELECT EMPLOYEES_NAME, DEPARTMENTS_NAME FROM COMPANY WHERE DEPARTMENTS_NAME IN (SELECT DEPARTMENTS_NAME FROM COMPANY GROUP BY DEPARTMENTS_NAME HAVING COUNT(*)<2);

+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name | email    | phone_number | hire_date  | job_id | salary   | commission_pct | manager_id | department_id |
+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+
|         201 | Michael    | Hartstein | MHARTSTE | 515.123.5555 | 1996-02-17 | MK_MAN | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat        | Fay       | PFAY     | 603.123.6666 | 1997-08-17 | MK_MAN |  6000.00 |           NULL |        201 |            50 |
+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+

9)

MariaDB [hr]> select first_name , last_name, department_name from employees , departments where department_name = "Finance";
+-------------+-------------+-----------------+
| first_name  | last_name   | department_name |
+-------------+-------------+-----------------+
| Steven      | King        | Finance         |
| Neena       | Kochhar     | Finance         |
| Lex         | De Haan     | Finance         |
| Alexander   | Hunold      | Finance         |
| Bruce       | Ernst       | Finance         |
| David       | Austin      | Finance         |
| Valli       | Pataballa   | Finance         |
| Diana       | Lorentz     | Finance         |
| Nancy       | Greenberg   | Finance         |
| Daniel      | Faviet      | Finance         |
| John        | Chen        | Finance         |
| Ismael      | Sciarra     | Finance         |
| Jose Manuel | Urman       | Finance         |
| Luis        | Popp        | Finance         |
| Den         | Raphaely    | Finance         |
| Alexander   | Khoo        | Finance         |
| Shelli      | Baida       | Finance         |
| Sigal       | Tobias      | Finance         |
| Guy         | Himuro      | Finance         |
| Karen       | Colmenares  | Finance         |
| Matthew     | Weiss       | Finance         |
| Adam        | Fripp       | Finance         |
| Payam       | Kaufling    | Finance         |
| Shanta      | Vollman     | Finance         |
| Kevin       | Mourgos     | Finance         |
| Julia       | Nayer       | Finance         |
| Irene       | Mikkilineni | Finance         |
| James       | Landry      | Finance         |
| Steven      | Markle      | Finance         |
| Laura       | Bissot      | Finance         |
| Mozhe       | Atkinson    | Finance         |
| James       | Marlow      | Finance         |
| TJ          | Olson       | Finance         |
| Jason       | Mallin      | Finance         |
| Michael     | Rogers      | Finance         |
| Ki          | Gee         | Finance         |
| Hazel       | Philtanker  | Finance         |
| Renske      | Ladwig      | Finance         |
| Stephen     | Stiles      | Finance         |
| John        | Seo         | Finance         |
| Joshua      | Patel       | Finance         |
| Trenna      | Rajs        | Finance         |
| Curtis      | Davies      | Finance         |
| Randall     | Matos       | Finance         |
| Peter       | Vargas      | Finance         |
| John        | Russell     | Finance         |
| Karen       | Partners    | Finance         |
| Alberto     | Errazuriz   | Finance         |
| Gerald      | Cambrault   | Finance         |
| Eleni       | Zlotkey     | Finance         |
| Peter       | Tucker      | Finance         |
| David       | Bernstein   | Finance         |
| Peter       | Hall        | Finance         |
| Christopher | Olsen       | Finance         |
| Nanette     | Cambrault   | Finance         |
| Oliver      | Tuvault     | Finance         |
| Janette     | King        | Finance         |
| Patrick     | Sully       | Finance         |
| Allan       | McEwen      | Finance         |
| Lindsey     | Smith       | Finance         |
| Louise      | Doran       | Finance         |
| Sarath      | Sewall      | Finance         |
| Clara       | Vishney     | Finance         |
| Danielle    | Greene      | Finance         |
| Mattea      | Marvins     | Finance         |
| David       | Lee         | Finance         |
| Sundar      | Ande        | Finance         |
| Amit        | Banda       | Finance         |
| Lisa        | Ozer        | Finance         |
| Harrison    | Bloom       | Finance         |
| Tayler      | Fox         | Finance         |
| William     | Smith       | Finance         |
| Elizabeth   | Bates       | Finance         |
| Sundita     | Kumar       | Finance         |
| Ellen       | Abel        | Finance         |
| Alyssa      | Hutton      | Finance         |
| Jonathon    | Taylor      | Finance         |
| Jack        | Livingston  | Finance         |
| Kimberely   | Grant       | Finance         |
| Charles     | Johnson     | Finance         |
| Winston     | Taylor      | Finance         |
| Jean        | Fleaur      | Finance         |
| Martha      | Sullivan    | Finance         |
| Girard      | Geoni       | Finance         |
| Nandita     | Sarchand    | Finance         |
| Alexis      | Bull        | Finance         |
| Julia       | Dellinger   | Finance         |
| Anthony     | Cabrio      | Finance         |
| Kelly       | Chung       | Finance         |
| Jennifer    | Dilly       | Finance         |
| Timothy     | Gates       | Finance         |
| Randall     | Perkins     | Finance         |
| Sarah       | Bell        | Finance         |
| Britney     | Everett     | Finance         |
| Samuel      | McCain      | Finance         |
| Vance       | Jones       | Finance         |
| Alana       | Walsh       | Finance         |
| Kevin       | Feeney      | Finance         |
| Donald      | OConnell    | Finance         |
| Douglas     | Grant       | Finance         |
| Jennifer    | Whalen      | Finance         |
| Michael     | Hartstein   | Finance         |
| Pat         | Fay         | Finance         |
| Susan       | Mavris      | Finance         |
| Hermann     | Baer        | Finance         |
| Shelley     | Higgins     | Finance         |
| William     | Gietz       | Finance         |
+-------------+-------------+-----------------+
107 rows in set (0.001 sec)




10)


MariaDB [hr]> SELECT  first_name, last_name, employee_id, job_id
    -> FROM employees
    -> WHERE department_id =
    -> (SELECT department_id
    -> FROM departments
    -> WHERE location_id =
    -> (SELECT location_id
    -> FROM locations
    -> WHERE city ='Toronto'));
+------------+-----------+-------------+--------+
| first_name | last_name | employee_id | job_id |
+------------+-----------+-------------+--------+
| Michael    | Hartstein |         201 | MK_MAN |
| Pat        | Fay       |         202 | MK_REP |
+------------+-----------+-------------+--------+
2 rows in set (0.001 sec)

11)


MariaDB [hr]> select first_name,department_name,job_id from employees  natural join departments;
+-------------+-----------------+------------+
| first_name  | department_name | job_id     |
+-------------+-----------------+------------+
| Pat         | Marketing       | MK_REP     |
| Alexander   | Purchasing      | PU_CLERK   |
| Shelli      | Purchasing      | PU_CLERK   |
| Sigal       | Purchasing      | PU_CLERK   |
| Guy         | Purchasing      | PU_CLERK   |
| Karen       | Purchasing      | PU_CLERK   |
| Laura       | Shipping        | ST_CLERK   |
| Mozhe       | Shipping        | ST_CLERK   |
| James       | Shipping        | ST_CLERK   |
| TJ          | Shipping        | ST_CLERK   |
| Nandita     | Shipping        | SH_CLERK   |
| Alexis      | Shipping        | SH_CLERK   |
| Julia       | Shipping        | SH_CLERK   |
| Anthony     | Shipping        | SH_CLERK   |
| Bruce       | IT              | IT_PROG    |
| David       | IT              | IT_PROG    |
| Valli       | IT              | IT_PROG    |
| Diana       | IT              | IT_PROG    |
| Peter       | Sales           | SA_REP     |
| David       | Sales           | SA_REP     |
| Peter       | Sales           | SA_REP     |
| Christopher | Sales           | SA_REP     |
| Nanette     | Sales           | SA_REP     |
| Oliver      | Sales           | SA_REP     |
| Neena       | Executive       | AD_VP      |
| Lex         | Executive       | AD_VP      |
| Daniel      | Finance         | FI_ACCOUNT |
| John        | Finance         | FI_ACCOUNT |
| Ismael      | Finance         | FI_ACCOUNT |
| Jose Manuel | Finance         | FI_ACCOUNT |
| Luis        | Finance         | FI_ACCOUNT |
| William     | Accounting      | AC_ACCOUNT |
+-------------+-----------------+------------+
32 rows in set (0.002 sec)


12)

SELECT emp_department.dpt_name FROM emp_details INNER JOIN emp_department ON emp_dept =dpt_code GROUP BY emp_department.dpt_name HAVING COUNT(*) > 2;

 +------------+
 | dpt_name   |
 | Finance    |
 | IT         |
 | HR         |
 +------------+

13)

								
MariaDB [hr]> select first_name,last_name,job_title,department_name,city,country_name,region_name from employees natural join departments natural join jobs natural join locations natural join countries natural join regions;
+-------------+------------+-------------------------------+-----------------+---------------------+--------------------------+-------------+
| first_name  | last_name  | job_title                     | department_name | city                | country_name             | region_name |
+-------------+------------+-------------------------------+-----------------+---------------------+--------------------------+-------------+
| Peter       | Tucker     | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| David       | Bernstein  | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| Peter       | Hall       | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| Christopher | Olsen      | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| Nanette     | Cambrault  | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| Oliver      | Tuvault    | Sales Representative          | Sales           | Oxford              | United Kingdom           | Europe      |
| Pat         | Fay        | Marketing Representative      | Marketing       | Toronto             | Canada                   | Americas    |
| Bruce       | Ernst      | Programmer                    | IT              | Southlake           | United States of America | Americas    |
| David       | Austin     | Programmer                    | IT              | Southlake           | United States of America | Americas    |
| Valli       | Pataballa  | Programmer                    | IT              | Southlake           | United States of America | Americas    |
| Diana       | Lorentz    | Programmer                    | IT              | Southlake           | United States of America | Americas    |
| Laura       | Bissot     | Stock Clerk                   | Shipping        | South San Francisco | United States of America | Americas    |
| Mozhe       | Atkinson   | Stock Clerk                   | Shipping        | South San Francisco | United States of America | Americas    |
| James       | Marlow     | Stock Clerk                   | Shipping        | South San Francisco | United States of America | Americas    |
| TJ          | Olson      | Stock Clerk                   | Shipping        | South San Francisco | United States of America | Americas    |
| Nandita     | Sarchand   | Shipping Clerk                | Shipping        | South San Francisco | United States of America | Americas    |
| Alexis      | Bull       | Shipping Clerk                | Shipping        | South San Francisco | United States of America | Americas    |
| Julia       | Dellinger  | Shipping Clerk                | Shipping        | South San Francisco | United States of America | Americas    |
| Anthony     | Cabrio     | Shipping Clerk                | Shipping        | South San Francisco | United States of America | Americas    |
| Alexander   | Khoo       | Purchasing Clerk              | Purchasing      | Seattle             | United States of America | Americas    |
| Shelli      | Baida      | Purchasing Clerk              | Purchasing      | Seattle             | United States of America | Americas    |
| Sigal       | Tobias     | Purchasing Clerk              | Purchasing      | Seattle             | United States of America | Americas    |
| Guy         | Himuro     | Purchasing Clerk              | Purchasing      | Seattle             | United States of America | Americas    |
| Karen       | Colmenares | Purchasing Clerk              | Purchasing      | Seattle             | United States of America | Americas    |
| Neena       | Kochhar    | Administration Vice President | Executive       | Seattle             | United States of America | Americas    |
| Lex         | De Haan    | Administration Vice President | Executive       | Seattle             | United States of America | Americas    |
| Daniel      | Faviet     | Accountant                    | Finance         | Seattle             | United States of America | Americas    |
| John        | Chen       | Accountant                    | Finance         | Seattle             | United States of America | Americas    |
| Ismael      | Sciarra    | Accountant                    | Finance         | Seattle             | United States of America | Americas    |
| Jose Manuel | Urman      | Accountant                    | Finance         | Seattle             | United States of America | Americas    |
| Luis        | Popp       | Accountant                    | Finance         | Seattle             | United States of America | Americas    |
| William     | Gietz      | Public Accountant             | Accounting      | Seattle             | United States of America | Americas    |
+-------------+------------+-------------------------------+-----------------+---------------------+--------------------------+-------------+
32 rows in set (0.003 sec)

14)
								Answer Q14:
MariaDB [hr]> select salary,department_id from employees where salary<5000 group by department_id
    -> ;
+---------+---------------+
| salary  | department_id |
+---------+---------------+
| 4400.00 |            10 |
| 3100.00 |            30 |
| 3200.00 |            50 |
| 4800.00 |            60 |
+---------+---------------+
4 rows in set (0.001 sec)
15)




16)

MariaDB [hr]> select * from employees where department_id = 10 ;
+-------------+------------+-----------+---------+--------------+------------+---------+---------+----------------+------------+---------------+
| employee_id | first_name | last_name | email   | phone_number | hire_date  | job_id  | salary  | commission_pct | manager_id | department_id |
+-------------+------------+-----------+---------+--------------+------------+---------+---------+----------------+------------+---------------+
|         200 | Jennifer   | Whalen    | JWHALEN | 515.123.4444 | 1987-09-17 | AD_ASST | 4400.00 |           NULL |        101 |            10 |
+-------------+------------+-----------+---------+--------------+------------+---------+---------+----------------+------------+---------------+
1 row in set (0.000 sec)

MariaDB [hr]> select * from employees where department_id = 20 ;
+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name | email    | phone_number | hire_date  | job_id | salary   | commission_pct | manager_id | department_id |
+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+
|         201 | Michael    | Hartstein | MHARTSTE | 515.123.5555 | 1996-02-17 | MK_MAN | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat        | Fay       | PFAY     | 603.123.6666 | 1997-08-17 | MK_REP |  6000.00 |           NULL |        201 |            20 |
+-------------+------------+-----------+----------+--------------+------------+--------+----------+----------------+------------+---------------+
2 rows in set (0.000 sec)

MariaDB [hr]> select * from employees where department_id = 30 ;
+-------------+------------+------------+----------+--------------+------------+----------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name  | email    | phone_number | hire_date  | job_id   | salary   | commission_pct | manager_id | department_id |
+-------------+------------+------------+----------+--------------+------------+----------+----------+----------------+------------+---------------+
|         114 | Den        | Raphaely   | DRAPHEAL | 515.127.4561 | 1994-12-07 | PU_MAN   | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander  | Khoo       | AKHOO    | 515.127.4562 | 1995-05-18 | PU_CLERK |  3100.00 |           NULL |        114 |            30 |
|         116 | Shelli     | Baida      | SBAIDA   | 515.127.4563 | 1997-12-24 | PU_CLERK |  2900.00 |           NULL |        114 |            30 |
|         117 | Sigal      | Tobias     | STOBIAS  | 515.127.4564 | 1997-07-24 | PU_CLERK |  2800.00 |           NULL |        114 |            30 |
|         118 | Guy        | Himuro     | GHIMURO  | 515.127.4565 | 1998-11-15 | PU_CLERK |  2600.00 |           NULL |        114 |            30 |
|         119 | Karen      | Colmenares | KCOLMENA | 515.127.4566 | 1999-08-10 | PU_CLERK |  2500.00 |           NULL |        114 |            30 |
+-------------+------------+------------+----------+--------------+------------+----------+----------+----------------+------------+---------------+
6 rows in set (0.000 sec)


















