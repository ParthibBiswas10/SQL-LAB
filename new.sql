
use exam;
create table sailor(
	sid varchar(4) primary key check (sid like 's%'),
    sname varchar(15) ,
    mname varchar(15),
    surname varchar(15) not null,
    rating int default 0,
    age decimal(3,1) not null
);
desc sailor;
desc reserve;
select * from sailor;
create table boat(
	bid varchar(4) primary key check(bid like 'b%'),
    bname varchar(10) constraint chk_bname check(bname=upper(bname)),
    color varchar(10) check(color in ('red','green','blue'))
);

create table reserve(
	sid varchar(4),
    bid varchar(4),
    day date check(day< Date'2001-01-01'),
    constraint pk_reverse primary key(sid,bid),
	CONSTRAINT fk_reserve_sailor
    foreign key(sid) references sailor(sid),
     CONSTRAINT fk_reserve_boat
    foreign key(bid) references boat(bid)
);
show tables;


desc sailor; 
INSERT INTO sailor VALUES ('s22', 'Fredrico', NULL, 'Roberts', 7, 45);
INSERT INTO sailor VALUES ('s31', 'Lubber', NULL, 'Sheen', 8, 55.5);
INSERT INTO sailor VALUES ('s32', 'Charlotte', NULL, 'Gordin', 8, 25.5);
INSERT INTO sailor VALUES ('s58', 'Mary', 'Beth', 'Lyon', 10, 35);
INSERT INTO sailor VALUES ('s64', 'Horatio', NULL, 'Powell', 7, 35.4);
INSERT INTO sailor VALUES ('s71', 'Zorba', NULL, 'Alex', 10, 16);
INSERT INTO sailor VALUES ('s29', 'Brutus', NULL, 'Slater', 1, 33.8);
INSERT INTO sailor VALUES ('s95', 'Deep', 'Graceb', 'Davis', 3, 63.5);
INSERT INTO sailor VALUES ('s74', 'Horatio', NULL, 'Forrest', 9, 35);
INSERT INTO sailor VALUES ('s85', 'Sara', 'Art', 'Powell', 3, 25.5);
INSERT INTO sailor VALUES ('s80', 'Deep', 'Kumar', 'Kumar', 6, 17);
INSERT INTO sailor VALUES ('s87', 'Deep', 'Kumar', 'Jha', 8, 5);

select * from sailor;

select * from boat;
insert into boat values('b101','interlake','blue');
insert into boat values('b102','interlake','red');
insert into boat values('b103','clipper','green');
insert into boat values('b104','marine','red');

insert into reserve values('s22','b101','1998-10-10');
INSERT INTO reserve VALUES ('s22', 'b103', '1998-08-10');
INSERT INTO reserve VALUES ('s22', 'b102', '1998-10-10');
INSERT INTO reserve VALUES ('s22', 'b104', '1998-07-10');
INSERT INTO reserve VALUES ('s31', 'b102', '1998-10-11');
INSERT INTO reserve VALUES ('s31', 'b103', '1998-06-11');
INSERT INTO reserve VALUES ('s31', 'b104', '1998-12-11');
INSERT INTO reserve VALUES ('s64', 'b101', '1998-05-09');
INSERT INTO reserve VALUES ('s64', 'b102', '1998-08-09');
INSERT INTO reserve VALUES ('s74', 'b103', '1998-08-09');
INSERT INTO reserve VALUES ('s80', 'b102', '1998-07-07');
INSERT INTO reserve VALUES ('s87', 'b101', '1998-07-08');
INSERT INTO reserve VALUES ('s87', 'b102', '1998-12-12');
SELECT * FROM reserve;

SELECT CONCAT(sname, ' ', IFNULL(CONCAT(mname, ' '), ''), surname) AS full_name,
       age
FROM sailor;

SELECT CONCAT(sname, ' ', IFNULL(CONCAT(mname, ' '), ''), surname) AS names_of_sailors,
       age+2 as age
FROM sailor;

select * from sailor order by sname;
/*select concat(sname,' ',surname) AS name from sailor
order by sname;*/

SELECT DISTINCT sname
FROM sailor;

-- 6) Show all distinct sailors names, ratings who have rating between 5 and 10.
select distinct CONCAT(sname, ' ', IFNULL(CONCAT(mname, ' '), ''), surname) AS full_name,rating from sailor where rating between 5 and 10;

-- 7) Select all records from sailors in ascending order by rating and descending order by age.
select * from sailor
order by rating asc, age desc;

-- 8) Select all records from sailors whose rating>7

select * from sailor
where rating>7;

-- 9) Find records for sailor name Horatio and age=35.4.

select * from sailor
where sname='Horatio' and age=35.4;

-- 11) Select names of sailors who have reserved boat 104.

select s.sname,b.bid
from sailor as s
join reserve as b
on s.sid=b.sid 
where b.bid='b104';

-- 12) Find sid of sailors who have reserved red boat

SELECT sname
FROM sailor
WHERE sid IN (
    SELECT sid
    FROM reserve
    WHERE bid IN (
        SELECT bid
        FROM boat
        WHERE color = 'red'
    )
);

SELECT DISTINCT s.sname
FROM sailor AS s
JOIN reserve AS r
ON s.sid = r.sid
JOIN boat AS b
ON r.bid = b.bid
WHERE b.color = 'red';

-- 13) Select records for name beginning with ‘B’.
SELECT *
FROM sailor
WHERE sname LIKE 'b%';

-- 14) Select records for name containing ‘B’/’b’
SELECT *
FROM sailor
WHERE CONCAT(sname, ' ', IFNULL(mname, ''), ' ', surname) LIKE '%B%'
or CONCAT(sname, ' ', IFNULL(mname, ''), ' ', surname) LIKE '%b%' ;

/*in oracle: 
	SELECT *
FROM sailor
WHERE sname || ' ' || NVL(mname || ' ', '') || surname LIKE '%B%'
   OR sname || ' ' || NVL(mname || ' ', '') || surname LIKE '%b%';
   
   else,  
   SELECT *
FROM sailor
WHERE UPPER(sname || ' ' || NVL(mname || ' ', '') || surname) LIKE '%B%';
*/


-- 28) Find names of sailors who have not reserved red boat. 
select s.sname
from sailor s
where sid NOT IN(
	select r.sid
    from reserve r
    join boat b
    on r.bid=b.bid
    where b.color='red'
);
select count(distinct sid)
from sailor;

-- 35) Find average age of sailors with rating 10.
select avg(age)
from sailor
where rating=10;

-- 20) Compute the increments of rating of persons who have sailed on different boats on the same day.
SELECT s.sname, s.rating + 1 AS incremented_rating
FROM sailor s
JOIN reserve r
ON s.sid = r.sid
GROUP BY s.sid, s.sname, s.rating, r.day
HAVING COUNT(DISTINCT r.bid) > 1;
