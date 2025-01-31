-- write your queries here
mrmongol@DESKTOP-JBLJAT7:/mnt/c/Users/OWNERS-PC/OneDrive/Desktop/SpringBoard/sql-joins$ psql joins_exercise
psql (14.13 (Ubuntu 14.13-0ubuntu0.22.04.1))
Type "help" for help.

joins_exercise=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | owners   | table | mrmongol
 public | vehicles | table | mrmongol
(2 rows)

joins_exercise=# SELECT * FROM owners;
 id | first_name | last_name
----+------------+-----------
  1 | Bob        | Hope
  2 | Jane       | Smith
  3 | Melody     | Jones
  4 | Sarah      | Palmer
  5 | Alex       | Miller
  6 | Shana      | Smith
  7 | Maya       | Malarkin
(7 rows)

joins_exercise=# SELECT * FROM vehicles;
 id |  make  |  model  | year |  price   | owner_id
----+--------+---------+------+----------+----------
  1 | Toyota | Corolla | 2002 |  2999.99 |        1
  2 | Honda  | Civic   | 2012 | 12999.99 |        1
  3 | Nissan | Altima  | 2016 | 23999.99 |        2
  4 | Subaru | Legacy  | 2006 |  5999.99 |        2
  5 | Ford   | F150    | 2012 |  2599.99 |        3
  6 | GMC    | Yukon   | 2016 | 12999.99 |        3
  7 | GMC    | Yukon   | 2014 | 22999.99 |        4
  8 | Toyota | Avalon  | 2009 | 12999.99 |        4
  9 | Toyota | Camry   | 2013 | 12999.99 |        4
 10 | Honda  | Civic   | 2001 |  7999.99 |        5
 11 | Nissan | Altima  | 1999 |  1899.99 |        6
 12 | Lexus  | ES350   | 1998 |  1599.99 |        6
 13 | BMW    | 300     | 2012 | 22999.99 |        6
 14 | BMW    | 700     | 2015 | 52999.99 |        6
(14 rows)

joins_exercise=# SELECT * FROM owners o
joins_exercise-# FULL OUTER JOIN vehicles v
joins_exercise-# ON o.id=v.owner_id;
joins_exercise=# ^C
joins_exercise=# SELECT first_name, last_name,
joins_exercise-# COUNT(owner_id) FROM owners o
joins_exercise-# JOIN vehicles v on o.id=v.owner_id
joins_exercise-# GROUP BY (first_name, last_name)
joins_exercise-#
joins_exercise-# ORDER BY first_name;
 first_name | last_name | count
------------+-----------+-------
 Alex       | Miller    |     1
 Bob        | Hope      |     2
 Jane       | Smith     |     2
 Melody     | Jones     |     2
 Sarah      | Palmer    |     3
 Shana      | Smith     |     4
(6 rows)

joins_exercise=# SELECT
joins_exercise-#  first_name, last_name,
joins_exercise-#
joins_exercise-# ROUND(AVG(price)) as average_price,
joins_exercise-#   COUNT(owner_id)
joins_exercise-# FROM owners o
joins_exercise-# JOIN vehicles v on o.id=v.owner_id
joins_exercise-# GROUP BY
joins_exercise-# (first_name, last_name)
joins_exercise-# HAVING
joins_exercise-#  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000
joins_exercise-# ORDER BY first_name DESC;
 first_name | last_name | average_price | count
------------+-----------+---------------+-------
 Shana      | Smith     |         19875 |     4
 Sarah      | Palmer    |         16333 |     3
 Jane       | Smith     |         15000 |     2
(3 rows)

joins_exercise=#