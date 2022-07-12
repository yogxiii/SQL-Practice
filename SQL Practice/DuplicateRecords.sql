--Write a SQL Query to fetch all the duplicate records in a table.

create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

--drop table user;

--Solution 1
select * from
(
SELECT *, ROW_NUMBER() OVER(Partition by user_name ORDER BY user_name) AS 'userCount'
FROM users ) as x
where x.userCount <> 1

--solution 2 CTE, RowNumber()
;with cte1 as (
SELECT *, ROW_NUMBER() OVER(Partition by user_name ORDER BY user_name) AS 'userCount'
FROM users )
select cte1.user_id,cte1.user_name,cte1.email from cte1 where userCount <> 1

