/*
    Name: Dev Patel
    ZID:  Z1912837

*/

USE BabyName;

SHOW TABLES;

DESCRIBE BabyName; 

SELECT DISTINCT name FROM BabyName where year=2001 LIMIT 50;

SELECT DISTINCT year, name FROM BabyName WHERE name='Dev';

SELECT MAX(count) FROM BabyName;

SELECT DISTINCT name, SUM(count) FROM BabyName WHERE year=1984 AND gender='M';

SELECT DISTINCT name, SUM(count) FROM BabyName WHERE year=1984 AND gender='F';

SELECT DISTINCT place, COUNT(name) FROM BabyName GROUP BY place;

SELECT * FROM BabyName WHERE name LIKE"%Dev" ORDER BY count,year;

SELECT COUNT(name) FROM BabyName;

SELECT COUNT(name) FROM BabyName WHERE year=1974;

SELECT COUNT(name) FROM BabyName WHERE year=1962 AND gender='M';

SELECT COUNT(name) FROM BabyName WHERE year=1962 AND gender='F';

