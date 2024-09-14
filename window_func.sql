use sarvesh_db;
create table info(
Name varchar(20) primary key ,
batch int(10),
marks int(5) ) ;

select * from info ;

insert into info values('Ram',1,6);

/ insert into info(name,batch,marks) values( ('Sarvesh' ,1,18), ('Ravi' ,1,15),('Shubham' ,1,12) ,
('Prashant' ,2,18),('Ankur' ,2,13),('Vinay' ,2,12),('Abhishek' ,3,16) ,
('Anurag' ,3,16) ,('Rahul' ,3,12),('Nikesh' ,3,10) ); 

INSERT INTO info VALUES
('Sarvesh', 1, 18), 
('Ravi', 1, 15),
('Shubham', 1, 12),
('Prashant', 2, 18),
('Ankur', 2, 13),
('Vinay', 2, 12),
('Abhishek', 3, 16),
('Anurag', 3, 16),
('Rahul', 3, 12),
('Nikesh', 3, 10);


select * from info order by marks desc,  batch asc limit 3 ;
select batch , avg(marks) from info group by batch;

select name , batch , marks , row_number() over (order by marks desc) as "rom_num" ,
rank() over (order by marks desc) as "rank",
dense_rank() over (order by marks desc) as "dense_rank"
from info ;

select name , batch , marks , row_number() over (partition by batch order by marks desc) as "rom_num" ,
rank() over (order by marks desc) as "rank",
dense_rank() over (order by marks desc) as "dense_rank"
from info ;


select * from (select name , batch , marks , row_number() over (partition by batch order by marks desc) as "rom_num" ,
rank() over (order by marks desc) as "rank",
dense_rank() over (order by marks desc) as "dens_rank"
from info ) as test where dens_rank >= 1 ;

select name , batch, marks, dense_rank() over(partition by batch order by marks desc) as "rank" 
from info ;

select name , max(marks) from info having batch =2 ;

create view view_2 as 
select * from info where batch=2 ;
select * from view_2;

create view case_view as
select name , marks ,
	case 
		when marks >15 then " excellent" 
		when marks <10 then "fail"
		else "Good"
	end as 'result'
from info ;

select * from case_view ;



