use TravelOnTheGO


1)
create table PASSENGER (Passenger_name varchar(50),
Category varchar(50),
Gender varchar(1),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20));



create table PRICE (
Bus_Type varchar(20),
Distance int, 
Price int);


--2)
use TravelOnTheGO

insert into PASSENGER
values
('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');




insert into PRICE
values
('Sleeper', '350', '770'),
('Sleeper', '500', '1100'),
('Sleeper', '600' ,'1320'),
('Sleeper','700', '1540'),
('Sleeper', '1000' ,'2200'),
('Sleeper', '1200', '2640'),
('Sleeper', '350', '434'),
('Sitting', '500', '620'),
('Sitting', '500', '620'),
('Sitting', '600','744'),
('Sitting', '700', '868'),
('Sitting', '1000', '1240'),
('Sitting', '1200', '1488'),
('Sitting','1500', '1860');



--3)


select gender, count(gender) as NumberOfTravellers from passenger where distance>=600 group by 
gender


--4)

select min(price) from price where Bus_Type='Sleeper'

--5)

select Passenger_name from passenger where Passenger_name like 'S%'

--6)

select  psg.Passenger_name, psg.Boarding_City, psg.Destination_City,
 psg.Bus_Type, pr.price
 from PASSENGER psg  left  join PRICE pr
on psg.Bus_Type = pr.Bus_Type where pr.distance = psg.distance


--7)
-- as per data inserted, there is no sitting travellers in passenger table who travelled 1000 kms.

select price,passenger_name,p.distance from passenger p join price pr 
on p.distance = pr.distance and p.bus_type=pr.bus_type
 where p.bus_type='Sitting' and p.distance='1000'


 --8)

 select price as SleeperPrice from passenger p join price pr on 
 p.distance = pr.distance and p.bus_type = pr.bus_type
 where boarding_city='panaji' and destination_city='bengaluru'
 and p.bus_type='sleeper'



 select price as SittingPrice from price where distance=
 (select p.distance from passenger p join price pr on 
 p.distance = pr.distance and p.bus_type = pr.bus_type
 where boarding_city='panaji' and destination_city='bengaluru')
 and bus_type='sitting'
 


 --9)

 select distance from passenger group by distance having 
 count(distance)=1 order by distance desc


 --10)


 select passenger_name, 
  (distance/TotalDistance)*100
   as PercentageOfDistance
 from passenger inner join 
(select SUM(distance) as TotalDistance from passenger) as TOTAL
 


 --11)

 

 select   distance,price  ,
 case 
 when price >= 1000 then 'Expensive'
 when price between 500 and 1000 then 'Average Cost'
 else 'Cheap' end as Category
 from price