##1.create table called employees with following strcuture
use mavenmovies;
create database employees;
use employees;
create table employees(emp_id int primary key ,emp_name int not null,age int check(age>=18),
salary decimal default(30000));
select * from employees;
## 2.explain the purpose ofconstraints an how they help maintan data integrity in a database .provide example of
## common typed of constraints;
##ans2.the purpose of constrants are: to prohibit null value in column and prevent the entry of duplicate value in 
##column,check constraint purpose that to prevent the entry of those value which are not statisfied the specifiy 
##condition for column. 
##common type constraint are-unique constraint ,example customer_id=1 insert into customer(customer_id)value(1),
#3it will throw error becaue constraint probhit the entry of duplicate value.
## not null constraint example customer_name=ram insert into customer(customer_name)values(null),it 
##will throw an error because of no null constraint.
## check contraint age >=18 and insert into table(age)values(13),it will throw an error because it will satisfied 
##the given condition to the column.
## deafult constraint defautl(30000) if left the column then it will take default.
##3.why would you apply the not null constrant to a column can a primary key contin null value,justify your answer.
## ans3.we apply null constraint to column because to probhit null value in column and no primary key  not contain
## null values because a primary uniquely identify each record in a table and if we allow to enter the  null value
## in column then it will violate the prinipal of uniqueness constraint.primary key often refrenced by foreign key 
##in other table to establish between data and if we primary key could be null ,it would create complications in 
##
## maintaining referential integrity.
## 4.explain the steps and sql command used to ad or remove constaint on and existing table .provide an
## example for both adding and removing constraint
## ans 4.adding constraint- alter into table_name add constraint constriantname column example alter into table
## employees add constraint primary key emp_name.
## for remvong constraint-alter into table employees remove constraint primary key emp_name.
## 5. the consquences of attempting insert update or delete data in a way that violates constraints.provide
## an example of an error message that ight occur when violating a constraint.
## ans 5.emp_name varchar(59) unique,insert into employees(emp_name)value(ram),(ram),it will throw an error 
##duplicate entry value for unique column.
##6. you created a products table without constraint as follows:
create table products(product_id int,product_name varchar(50),price decimal(10,2));
alter table products add constraint primary key (product_id);
alter table products modify price decimal(10,2) default 50.00;
## 7 you have two tables studnets and classes
create table students(student_id int ,student_name varchar(40),class_id int);
insert into students(student_id,student_name,class_id)value(1,'alice',101),(2,'bob',102),(3,'charlie',101);
create table classes(class_id int,class_name varchar(44));
insert into classes(class_id,class_name)values(101,'math'),(102,'science'),(103,'history');
select  student_name,class_name from students s inner join classes c on s.class_id=c.class_id;
## consider the following three tables
create table orders(order_id int,order_date date,customer_id int);
insert into orders(order_id,order_date,customer_id)values(1,'2024-01-01',101),(2,'2024-01-03',102);
create table customers(customer_id int,customer_name varchar(55));
insert into customers(customer_id,customer_name)values(101,'alice'),(102,'bob');
create table product(product_id int,product_name varchar(33),order_id int);
insert into product(product_id,product_name,order_id)values(1,'laptop',1),(2,'phone',null);
select o.order_id,c.customer_name,p.product_name from orders  o left join product p on o.order_id=p.order_id 
left join customers c on o.customer_id=c.customer_id;
## 9.given following tables sales,products;
create table sales(sale_id int,product_id int,amount int);
insert into sales(sale_id,product_id,amount)value(1,101,500),(2,102,300),(3,101,700);
create table products(product_id int,product_name varchar(44));
insert into products(product_id,product_name)values(101,'laptop'),(102,'phone');
select p.product_name, s.product_id,sum(amount) as total_sum from sales s join products p on 
 s.product_id=p.product_id group by product_id,product_name;
## 10,you are given three tables
create table orders(order_id int,order_date date,customer_id int);
insert into orders(order_id,order_date,customer_id)value(1,'2024-01-02',1),(2,'2024-01-05',2);
select * from customers;
create table order_details(order_id int ,product_id int,quantity int);
insert into order_details(order_id,product_id,quantity)values(1,101,2),(1,102,1),(2,101,3);
select o.order_id,c.customer_name,od.quantity from orders o inner join customers c on o.customer_id=c.customer_id 
inner join order_details od on o.order_id=od.order_id;
## sql command 
use mavenmovies;
##1. identifiy the primary key and foreign keys  in mavenmovies.db discuss the differnce
## primary key is unique identifier for each record in table .it ensure that all rows in a column uniquely
## identified by one or more column and primary key does not contain null values. foreign key is used to 
## establish relationship between two table. in film table the film_id is a primary key and in actor table 
##actor_id is primary key and in film_actor 
##table,film_id,actor_id are foreign key.difference between primary key and foregin key are- 1 uniquely identifies 
##each recrod in a table,creates a relationship between two tables 2.value must be unique,value can repeat
## 3.cannot be null ,can be null depending on the relationship 4.only one primary key per table 
##,a table can have multiple foreign key   
##2.list all detail of actor
select * from actor;
##3list all detail of customer from db.
## 4.list different countries
select * from country c join city a on c.country_id=a.country_id;
##5 display all acitive customer.
select*from customer where active=1;
## 6. list of all rental ids for customer with id 1.
select rental_id,customer_id as customerId from rental where customer_id='1';
##7.display all the film whose rental duration is greter than 5;
select * from film where rental_duration>5;
##8 list the total nuber of whose replacement cost is greater than $15 and less than &20
select * from film where replacement_cost>15 and replacement_cost<20;
## 9. display the count of unique first names of actors.
select distinct(count(first_name)) uniq_count from actor;
##10 display the first 10 records from the customer tables;
select * from customer limit 10;
##11.display the first 3 records from the customer table whose firstname starts with b;
select * from customer where first_name like 'b%' limit 3;
##12. display the names of the first 5 movies which are rated as g
select * from film where rating='g';
##13.find all customer whose firstname start with "a"
select * from customer where  first_name like 'a%';
## 14.find all customer whose firstname ends with "a"
## 15.display the list of first 4 cities which start and end with 'a'
select * from city where city like 'a%' and city like '%a';
select * from customer where first_name like '%a';
##16.find all customers whose first name have ni in any position.
select first_name from customer where first_name like '%ni%';
##17.find all customer whose first name have r in second position
select * from customer where first_name like'_r%';
##18.find all customer whose first name have start with a and are at least 5 character in length.
select * from  customer where first_name like 'a%' and length(first_name)>=5;
##19.find all customer whose first name start with "a" and end with "a"
select * from customer where first_name like'a%' and  first_name like '%a';
## 20 get the film with pg and pg-13 rating using in operator
select * from film where rating in ('pg','pg-13');
##21 get the films with length between 50 to 100 using in operator.
select title length from film where length in(50,51,52,53,54,55,56,91,92,93,94,95,96,97,98,99,100);
## 22.get the top 5o actor usng limit operator
select  first_name,last_name from actor limit 50;
## 23. get the distinct film ids from inventroy table.
select distinct(film_id) from inventory;
## function  basis aggregate function;
use sakila;
##1. retieve the total number of rentals made in the sakila database.
select count(*) total_count from rental;
## 2.find the average rental duration of movies rented from the sakila database.
select avg(rental_duration)as avg_rental_duration from film;
## 3.display the fist name and last name of customer in uppercase
select upper(first_name) as upper_first_name,upper(last_name) as upper_last_name from customer;
## 4.extract the month form the rental date and display it alongside the rental id
select month(rental_date) as month ,rental_id from rental;
## 5 retrieve the count of rental for each customer
select  c.customer_id,count(*) as total_count from customer c join rental r on c.customer_id=r.customer_id 
group by c.customer_id;
# 6. find the total revenue generated  by each store.
select store_id,sum(amount) as total_revenue from staff s join payment p on s.staff_id=p.staff_id group by store_id;
## 7.determine the total number of rental for each category of movies
select category_id, count(*) from rental r join inventory i  on r.inventory_id=i.inventory_id join film_category
 c on i.film_id=c.film_id group by category_id;
## 8.find the averge rental rate of movies in each language.
select avg(f.rental_rate) as avg_rental_rate,l.name from film f join language l on f.language_id=l.language_id
 group by l.name;
##9. display the title of the movie,customers firstname and last name who rented it.
select rental_id,title,first_name,last_name from film f join inventory i on f.film_id=i.film_id join rental r on
 i.inventory_id=r.inventory_id join customer c on r.customer_id=c.customer_id;
##10.retrieve the names of all actor ho have in the film "gone with the wind"
select concat(first_name,' ',last_name) as actor_name, title as film_name from actor a join film_actor 
fa on a.actor_id=fa.actor_id join film ffa on fa.film_id=ffa.film_id where title="Gone with the Wind";
## 11.retrieve the customer names along with total amount they spent on rental
select rental_id,concat(first_name,' ',last_name)as customer_name,sum(amount) as total_amount from customer 
c join payment p on c.customer_id=p.customer_id group by customer_name,rental_id order by rental_id;
## 12.list the title of movies rented by each customer in a particular city.
select r. rental_id, f. title ,concat(c.first_name,c.last_name) as customer_name,city from film f join inventory 
i on f.film_id=i.film_id join rental r on i.inventory_id=r.inventory_id join customer c on r.customer_id=c.customer_id 
join address a on c.address_id=a.address_id join city b on a.city_id=b.city_id order by r.rental_id;
## 13.display the top 5 movies alongith numbher of time they have been rented.
select  title,count(rental_duration) as rental_duration from film f join inventory i on f.film_id=i.film_id join 
rental r on i.inventory_id=r.inventory_id group by title order by count(rental_duration)desc limit 5;
## 14.determine the customer who have rented movies from both store(store id 1,storeid=2)
select c.customer_id,c.first_name,c.last_name from customer c join rental r on c.customer_id=r.customer_id
 join inventory i on r.inventory_id=i.inventory_id where i.store_id in (1,2) 
 group by customer_id having count(distinct i.store_id)=2;
## window function.
## 1.rank the customer based on the total amount they have spent on retnals.
select concat(first_name,' ',last_name) as customer_name ,amount,rank()over (order by amount desc) as 
rank_based_amount_spent  from customer c join payment p on c.customer_id=p.customer_id;
## 2.calculate the cumulative revenue generated by each film over time.
select f.title as filmtitle,p.payment_date,sum(p.amount) over (partition by f.film_id order by p.payment_date)
 as cumulatiave_revenue from payment p join rental r on p.rental_id join inventory i on r.inventory_id=i.inventory_id 
 join film f on i.film_id=f.film_id order by f.film_id;
## 3 deterimine the average rental duration of  each film considering films with similar length
select avg(rental_duration),length, rank() over (partition by length order by length desc ) as similar_length 
from film group by length;
## 4.identify the top 3 films in each category based on thier rental counts.
with rental_count as(select   f.film_id, fa.title,c.name,count(r.rental_id) as counts from category c 
join film_category f on c.category_id=f.category_id join inventory i on f.category_id=i.inventory_id join
 rental r on i.inventory_id=r.inventory_id join film fa on i.film_id= fa.film_id group by c.name,f.film_id,fa.title),
film as (select  film_id,title,name,counts , row_number() over(partition by name order by counts desc) as ranks 
from rental_count)
select film_id,title,name,counts from film where ranks<=3 order by name, counts desc;
## 5.calculate the difference in rental coounts between each cusomer total rentals and the average rentals across 
##all customers
select  c.customer_id,count(rental_id) ,avg(count(rental_id)) over() as total_rental from rental r join customr c
 on r.customer_id=c.customer_id group by c.customer_id;
## 6.find the monthly revenue trend for the entire rental store over time
with revenue as (select sum(amount) revenue,month(payment_date)  as months from rental r join payment p on 
r.rental_id=p.rental_id group by  months )
select months, revenue,sum(revenue) over (order by months) as cumulative_sum from revenue group by 
months order by months;
##7 identifiy the customer whose total spending on rentals falls within the top 20% of all customer.
 with total_spending as (select  c.customer_id ,c.first_name,c.last_name,sum(p.amount) as total_spending 
 from payment p join customer c on p.customer_id=c.customer_id group by c.customer_id,c.first_name,c.last_name),
 ranked_customer as (select customer_id,first_name,last_name, total_spending, ntile(100) 
 over (order by total_spending desc) as percentile_rank from total_spending)
 select customer_id,first_name,last_name,percentile_rank,total_spending from ranked_customer
 where percentile_rank<=20;
##8. calculate the running total of rentals per category,ordered by rental count.
select c.name as category,count((r.rental_id)) as rental_count,sum(count(r.rental_id)) 
over(order by count(r.rental_id) desc) as running_total from category c join film_category f on
 c.category_id=f.category_id join inventory i on f.film_id=i.film_id join rental r on 
 i.inventory_id=r.inventory_id group by c.category_id order by rental_count desc;
##9. find the films that have been rented less than the average rental count of their respective categories.
with rental_count as (select  cc.name,count(*) as counts from film_category c join category cc on
 c.category_id=cc.category_id join inventory i on c.film_id=i.film_id join rental r 
 on i.inventory_id=r.inventory_id group by cc.name)
select avg(counts) as avg_counts, counts , name ,rank() over (partition by name) from rental_count group by name;
 ## 10 identify the top 5 months with the highest revenue and display the revenue generated in each month.
select month(payment_date) as month ,sum(amount) as total_revenue from payment group by month;
use sakila;
## normalisation & cte 
##1 first normal form (1nf)
## a identify a table in the sakila database tht violates 1nf explain hou you would you normalize it to achieve 1nf.
## ans 1.a table in sakila database which viloates 1nf is film_actor,the column name special_features contains
## two values .
## to normalize create a new row for each  values .it will prevent multiple value in one column ,in place 
##of  storing multiple value in single column,store each value in its own row . 
select * from film_actor;
##2.second normal form 2nf
## a.choose the table in sakila  and describe how would determine wheather it is 2nf,if it violates 2nf
## explain the steps to normalize it .
## ans 2.the film table  in sakila database violates the 2nf form because in this table non key attribute 
##is partially depedent film_Id and non_keY attribute partially dependent on language_id.to normalize 
##it ,to convert it into  two tables in which one belong language_id and another one belong to FIlm_id.
## 3.third normal from
## identify a table in sakila that violates 3nf.describe the transitive dpendencies present and outline the step
## to normalize the table 3nf.
## ans3.film table has violated a 3nf form in sakila database . in sakila database actor_name is dpend on
## actor_id which is not primary key of this table.this creates a transitive dpendency since actor_name 
##relies on actor_id and film_id to establish full context.to normazlize it creates two tables one belongs 
##to actor_id and another film__id,
##  establish relationship actor_id in film refrences to with film_id as primary_key.
##normalization process.
## 4.a take a specific table in sakila and guide throughout the process of normalizing it from the inital 
##unnormalized form up to at least 2nf
## ans4. the film table in sakila database has contained comma separated values in column which violats
## the norms of first normal form and to convert this table in 1nf from creates two column .and 
#3the table must be compliance with norms of 1nf before it checks wheather it follows norms of 2nf form or not.
## if the table is in 1nf then checks for the 2nf forrm. the film table is also violates 2nf form because 
##it has composite key film_id and languague _id and non-key attributes paritally depend upon film_id and 
##language_id which is wrong according to seccond nomral form . to normazlize it creates two column that one
## belongs to language_id and other one film_id.
## 5.write query usng a cte to retrieve the distinct list of actor names and the number of
## films they have acted in from the acto film_actor tables
use mavenmovies;
with dist_list_actor as (select distinct(concat(first_name,last_name)) as actor_name ,count(f.film_id) as
 film_count from actor a join film_actor f on a.actor_id=f.actor_id group by actor_name)
select actor_name,film_count from dist_list_actor order by film_count desc;
##6.create cte that combines information from the film and languague table to display the film title the 
##language name and and rental rate
with fil_lang_cte as (select f.film_id,f.title,l.name from film f join language l on f.language_id=l.language_id)
select * from fil_lang_cte;
## 7. write query usng a cte to find the total revenue generated by each customer (sum of payment) from 
the customer and payment table
with total_revenue as (select first_name,last_name, sum(amount) as total_revenue from customer c join payment p
 on c.customer_id=p.customer_id group by first_name,last_name)
select first_name,last_name,total_revenue from total_revenue order by total_revenue;
## 8 cte window function
## utilize a cte with a window function to rank film based on their rental duration form the flim table
with rank_film as(select film_id, rental_duration, rank() over ( order by  rental_duration) as rental_rank from film)
select film_id,rental_duration,rental_rank from rank_film;
## 9,cte and filtering 
## create a te to list customers who have made more than two rentals and thenjoin this cte with customer table 
##to retieve additonal cusomer details
with rental_count as (select  c.customer_id,first_name,last_name, count(*) as rental_count from customer c 
join rental r on c.customer_id=r.customer_id group by first_name,last_name,c.customer_id)
select rr.customer_id  as customer_id,c.store_id, rr.first_name,rr.last_name,rental_count from rental_count rr
 join customer c on rr.customer_id=c.customer_id where rental_count>2 ;
## 10 cte write a query using a cte to find the total number of rentals made each month considering rental_
##date from the rental table
with total_number_rental as(select month(rental_date) as month, count(*)  total_rental_counts from rental 
group by month)
select * from total_number_rental;
##.cte and self join 
## 11.a.create a cte to generate a report showing pairs of actors who have appeared in the same film together,
##using the film_actor 
with actor_name as (select   a.actor_id, f.film_id as film_id,concat(a.first_name,a.last_name)  as actor_name from 
actor a join film_actor f on a.actor_id=f.actor_id)
select  ff.actor_id, fb.actor_id ,ff.actor_name,fb.actor_name from actor_name ff join actor_name fb on 
ff.film_id=fb.film_id where ff.actor_id<fb.actor_id;
## a.implement a recursive cte to find all employees in the staff table who report to a specific manager
## considering the report_to column.
select * from store;
