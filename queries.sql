select count(Address) Total_Street
from Customer
where Address like '%St%' or Address like '%Street%' or Address like '%st%' or Address like '%street%';  



select sum(Produce.Inventory) Total_Produce, Produce.Type
from Produce
group by Produce.Type;



select Employee_ID, Position, RFID_Assignment, Salary, Experience
from BeeHive inner join FarmWorker
on FarmWorker.RFID_Assignment = BeeHive.RFID
where Bee like '%Honey Bees%';



select Harvest,Social_Security_Number, Receipt, Name, Sex, Birthday, Address, Telephone
from Customer inner join Produce
on Customer.Social_Security_Number = Produce.Buyer
order by Harvest;



select count(Employee_ID) Total_Chicken_Farmer
from FarmWorker inner join LiveStock
on FarmWorker.Employee_ID = LiveStock.Caretaker_ID
where Type like "%poultry%" or Type like "%Poultry%";



select avg(Experience) Average_Chicken_Farmer_Experience
from FarmWorker inner join LiveStock
on FarmWorker.Employee_ID = LiveStock.Caretaker_ID
where Type like "%poultry%" or Type like "%Poultry%";



select Employee_ID, Produce.Price
from FarmWorker inner join LiveStock inner join Produce
on FarmWorker.Employee_ID = LiveStock.Caretaker_ID and FarmWorker.Employee_ID = Produce.HarvestedBy
where Feed like "%Seed%" or Feed like "%seed%"
order by Produce.Price;



select count(Customer.Social_Security_Number) Total_Customers_2_or_More
from Customer inner join Produce inner join FarmWorker
on Customer.Social_Security_Number = Produce.Buyer and Produce.HarvestedBy = FarmWorker.Employee_ID
where FarmWorker.Position like "%Manager%" or FarmWorker.Position like "%manager%";



select avg(Produce.Price) Average_Price
from FarmWorker inner join LiveStock inner join Produce
on FarmWorker.Employee_ID = LiveStock.Caretaker_ID and FarmWorker.Employee_ID = Produce.HarvestedBy
where LiveStock.Type like "%poultry%" or LiveStock.Type like "%Poultry%" and FarmWorker.Salary > 0;



select concat(concat(Customer.Social_Security_Number, "-"), FarmWorker.Employee_ID) Customer_Employee_ID
from Customer inner join FarmWorker inner join Produce
on Customer.Social_Security_Number = Produce.Buyer and FarmWorker.Employee_ID = Produce.HarvestedBy
where Customer.Receipt >= 0;



select concat(concat(LiveStock.ID_Number, "-"), Produce.Bar_Code) LiveStock_Produce_ID
from FarmWorker inner join Produce inner join LiveStock
on FarmWorker.Employee_ID = LiveStock.Caretaker_ID and FarmWorker.Employee_ID = Produce.HarvestedBy
where FarmWorker.Experience > 2;



select Social_Security_Number, Receipt, Name, Sex, Birthday, Address, Telephone
from Customer inner join FarmWorker inner join BeeHive inner join LiveStock inner join Produce
on Produce.HarvestedBy = FarmWorker.Employee_ID and LiveStock.Caretaker_ID = FarmWorker.Employee_ID and Customer.Social_Security_Number = Produce.Buyer and FarmWorker.RFID_Assignment = BeeHive.RFID
where Customer.Sex IS NOT NULL and Customer.Sex like "%f%" and FarmWorker.Experience >= 1 and BeeHive.Bee like '%Honey Bees%' and LiveStock.Type like "%poultry%" or LiveStock.Type like "%Poultry%";



select concat(concat(LiveStock.ID_Number, "-"), Customer.Social_Security_Number) LiveStock_Customer_ID
from  LiveStock inner join Customer inner join FarmWorker inner join BeeHive inner join Produce
on Produce.HarvestedBy = FarmWorker.Employee_ID and LiveStock.Caretaker_ID = FarmWorker.Employee_ID and Customer.Social_Security_Number = Produce.Buyer and FarmWorker.RFID_Assignment = BeeHive.RFID
where FarmWorker.Salary > 15000 and BeeHive.Indisposition = 0;



select count(BeeHive.RFID)
from FarmWorker inner join BeeHive inner join Customer inner join Produce
on Produce.HarvestedBy = FarmWorker.Employee_ID and Customer.Social_Security_Number = Produce.Buyer and FarmWorker.RFID_Assignment = BeeHive.RFID
where Produce.Price > 2 and  Customer.Address like '%St%' or Customer.Address like '%Street%' or Customer.Address like '%st%' or Customer.Address like '%street%';  



select sum(Produce.Inventory) Inventory_Greater_Than_ABuck99
from Produce
where Produce.Price > 1.99;