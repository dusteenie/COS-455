#Selects the livestock ID numbers of those who were cared for by a farmworker 
#whose beehive has a frame of at least 3.
select L.ID_Number
from LiveStock L
where exists
(
	select FarmWorker.Employee_ID, FarmWorker.RFID_Assignment, BeeHive.RFID
	from FarmWorker inner join BeeHive
	on BeeHive.RFID = FarmWorker.RFID_Assignment
	where BeeHive.Frame >= 3 and FarmWorker.Employee_ID = L.Caretaker_ID
);


#Selects the barcode of produce harvested by a farmworker whose Livestock 
#consumers ‘grass” type feed.
select P.Bar_Code
from Produce P
where exists(
	select FarmWorker.Employee_ID, LiveStock.Caretaker_ID, LiveStock.Feed 
	from FarmWorker inner join LiveStock
	on FarmWorker.Employee_ID = LiveStock.Caretaker_ID
	where LiveStock.Feed like 'Grass' and P.HarvestedBy = FarmWorker.Employee_ID
);


#Selects produce of type ‘fruit’ harvested by a farmworker with more than 
#1 year of experience.
select P.Bar_Code
from Produce P
where exists(
	select FarmWorker.Employee_ID
	from FarmWorker
	where 1 < FarmWorker.Experience and FarmWorker.Employee_ID = P.HarvestedBy and P.Type like 'fruit'
);


#Selects the names of customers who did not purchase produce harvested by 
#an employee who made more than $20,000.
select C.Name 
from Customer C
where not exists(
	select FarmWorker.Employee_ID, FarmWorker.Salary, Produce.HarvestedBy, Produce.Bar_Code
	from FarmWorker inner join Produce
	on FarmWorker.Employee_ID = Produce.HarvestedBy
	where FarmWorker.Salary > 20000 and Produce.Buyer = C.Social_Security_Number
);


#Selects the names of customers who did not purchase produce that costed more than $1.99.
select C.Name 
from Customer C
where not exists(
	select Produce.Price, Produce.Bar_Code
	from Produce
	where Produce.Price >= 2 and Produce.Buyer = C.Social_Security_Number
);


#Selects the barcode of produce that was not harvested by a farmworker who
#works with bees.
select P.Bar_Code
from Produce P 
where not exists(
	select P.HarvestedBy, FarmWorker.Employee_ID, FarmWorker.RFID_Assignment, BeeHive.RFID
	from FarmWorker inner join BeeHive
	where FarmWorker.RFID_Assignment = BeeHive.RFID and FarmWorker.Employee_ID = P.HarvestedBy
);


#Selects the livestock ID numbers who are not cared for by a ‘manager.’
select L.ID_Number
from LiveStock L
where not exists
(
	select FarmWorker.Employee_ID, FarmWorker.Position
	from FarmWorker
	where FarmWorker.Position like 'Manager' and FarmWorker.Employee_ID = L.Caretaker_ID
);


#Selects the type and barcode of produce whose price is less than the maximum 
#of all prices.
SELECT P.Bar_Code, P.Type
from Produce P
where P.Price < (SELECT max(Produce.Price) from Produce);


#Selects the FarmWorkers ID of those who make less than the average salary
Select F.Employee_ID
from FarmWorker F 
where F.Salary < (SELECT avg(FarmWorker.Salary) from FarmWorker)
