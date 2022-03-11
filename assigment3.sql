----Below you see a table of the actions of customers visiting the website by clicking on two different types of advertisements given by an E-Commerce company. Write a query to return the conversion rate for each Advertisement type.

--Create above table (Actions) and insert values,

 

--    Retrieve count of total Actions and Orders for each Advertisement Type,

 

--    Calculate Orders (Conversion) rates for each Advertisement Type by dividing by total count of actions casting as float by multiplying by 1.0.



create table [cho].[assigment](
[Visitor_Id] int not null,
[Adv_Type] VARCHAR(10) not null,
[Action] VARCHAR(10) not null)

select * from cho.assigment

insert into cho.assigment
values(1,'A','Left')
insert into cho.assigment
values(2,'A','Order')
insert into cho.assigment
values(3,'B','Left')
insert into cho.assigment
values(4,'A','Order')
insert into cho.assigment
values(5,'A','Review')
insert into cho.assigment
values(6,'A','Left')
insert into cho.assigment
values(7,'B','Left')
insert into cho.assigment
values(8,'B','Order')
insert into cho.assigment
values(9,'B','Review')
insert into cho.assigment
values(10,'A','Review')

select * from cho.assigment

select Adv_Type,
SUM(CASE WHEN [Action] = 'Order' THEN 1 ELSE 0 END)/(COUNT([Action])*1.0)
 as Conversion_Rate
from cho.assigment
group by Adv_Type


drop table cho.assigment

