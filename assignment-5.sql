create database library;
use library;

-- create 2 tables:-
create table books (book_id int primary key auto_increment, title varchar(50),author varchar(50));

create table members (member_id int primary key auto_increment,name varchar(50),book_id int);


-- Values insert:- 
insert into books (title, author) values('Java Basics', 'Ram'),('MySQL Guide', 'Shyam'),('Python Intro', 'Mohan');

insert into members (name, book_id) values('Bheem', 1),('Mohini', 2),('Abhi', 1);


-- 3 Subqueries:- 
select title from books where book_id in (select book_id from members);

select name from members where book_id = (select book_id from books where title = 'Java Basics');

select title from books where book_id in (select book_id from members group by book_id having count(*) > 1);


-- 2 views:- 
create view member_book_view as select m.name, b.title from members m join books b on m.book_id = b.book_id;

select * from member_book_view;

create view book_borrow_count as select b.title, count(m.member_id) as total_borrowed from books b left join members m on b.book_id = m.book_id group by b.title;

select * from book_borrow_count;
