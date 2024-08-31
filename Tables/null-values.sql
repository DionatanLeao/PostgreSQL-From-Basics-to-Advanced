insert into categories (title) values ('limão');
select * from categories;
select * from categories where description ='';
\pset null NULL
select * from categories;
select title, description from categories where description is null;
select title, description from categories where description is not null;
insert into categories (title,description) values ('damasco ','frutas');
select * from categories order by description NULLS last;
select * from categories order by description;
select * from categories order by description NULLS first;