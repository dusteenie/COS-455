DROP TABLE IF EXISTS BeeHive;
CREATE TABLE BeeHive(
	RFID INT NOT NULL,
	Super VARCHAR(50),
	Indisposition BOOLEAN NOT NULL,
	Produce INT NOT NULL,
	Frame DOUBLE(10,2) NOT NULL,
	Bee VARCHAR(20) NOT NULL,
	CONSTRAINT beeHivePrimaryKey PRIMARY KEY(RFID),
	CONSTRAINT beeHiveRFIDCheck CHECK(RFID >= 0)
	);

INSERT INTO BeeHive(RFID, Indisposition, Produce, Frame, Bee)
VALUES(117, 0, 1, 4.5, "Wax Bees");

INSERT INTO BeeHive
VALUES(118, "Deep", 1, 1, 1.5, "Wax Bees");

INSERT INTO BeeHive
VALUES(119, "Honey", 0, 0, 7.0, "Honey Bees");

INSERT INTO BeeHive
VALUES(120, "Honey", 0, 0, 9.0, "Honey Bees");

INSERT INTO BeeHive
VALUES(121, "Honey", 1, 0, 3.04, "Honey Bees");

INSERT INTO BeeHive
VALUES(122, "Honey", 1, 0, 7.25, "Honey Bees");

INSERT INTO BeeHive(RFID, Indisposition, Produce, Frame, Bee)
VALUES(123, 0, 2, 4.5, "Pollinating Bees");

INSERT INTO BeeHive(RFID, Indisposition, Produce, Frame, Bee)
VALUES(124, 0, 2, 2.4, "Pollinating Bees");

INSERT INTO BeeHive(RFID, Indisposition, Produce, Frame, Bee)
VALUES(125, 0, 0, 8.73, "Honey Bees");

INSERT INTO BeeHive(RFID, Indisposition, Produce, Frame, Bee)
VALUES(126, 1, 1, 6.83, "Wax Bees");




DROP TABLE IF EXISTS FarmWorker;
CREATE TABLE FarmWorker(
	Employee_ID INT NOT NULL,
	RFID_Assignment INT,
	Position VARCHAR(50) NOT NULL,
	Salary DOUBLE(7,2) NOT NULL,
	Experience INT NOT NULL,
	CONSTRAINT farmWorkerPrimaryKey	PRIMARY KEY(Employee_ID),
	CONSTRAINT farmWorkerForeignKey	FOREIGN KEY(RFID_Assignment) REFERENCES BeeHive(RFID),
	CONSTRAINT farmWorkerRFIDAssignment CHECK(RFID_Assignment >= 0 or RFID_Assignment = NULL),	
	CONSTRAINT farmWorkerSalary CHECK(Salary >= 0),
	CONSTRAINT farmWorkerExperience  CHECK(Salary >= 0),
	CONSTRAINT farmWorkerPos CHECK(value in ("Manager","Laborer","Sales Rep"))
	);

INSERT INTO FarmWorker
VALUES(12345, 118, "Laborer", 12345.67, 0);

INSERT INTO FarmWorker
VALUES(23456, NULL, "Sales Rep", 42300.50, 5);

INSERT INTO FarmWorker
VALUES(34567, 124, "Manager", 35500.50, 3);

INSERT INTO FarmWorker
VALUES(45678, 125, "Laborer", 42000, 3);

INSERT INTO FarmWorker
VALUES(56789, NULL, "Sales Rep", 17580.55, 1);

INSERT INTO FarmWorker
VALUES(67890, NULL, "Sales Rep", 15000, 0);

INSERT INTO FarmWorker
VALUES(78901, 119, "Laborer", 52000, 2);

INSERT INTO FarmWorker
VALUES(89012, 120, "Manager", 32000.75, 3);

INSERT INTO FarmWorker
VALUES(90123, 121, "Manager", 90750.25, 20);

INSERT INTO FarmWorker
VALUES(01234, NULL, "Sales Rep", 0, 0);

INSERT INTO FarmWorker
VALUES(00000, NULL, "Laborer", 0, 0);



DROP TABLE IF EXISTS LiveStock;
CREATE TABLE LiveStock(
	Feed VARCHAR(20) NOT NULL,
	Type VARCHAR(20) NOT NULL,
	ID_Number INT,
	Caretaker_ID INT NOT NULL,
	CONSTRAINT liveStockPrimaryKey PRIMARY KEY(ID_Number),
	CONSTRAINT liveStockForeignKey FOREIGN KEY(Caretaker_ID) REFERENCES FarmWorker(Employee_ID),
	CONSTRAINT liveStockFeedCheck CHECK(value in ("Seed","Grass"))
);

INSERT INTO LiveStock
VALUES("Seed", "Poultry", 222, 34567);

INSERT INTO LiveStock
VALUES("Seed", "Poultry", 223, 78901);

INSERT INTO LiveStock
VALUES("Seed", "Poultry", 224, 78901);

INSERT INTO LiveStock
VALUES("Seed", "Poultry", 225, 67890);

INSERT INTO LiveStock
VALUES("Grass", "Poultry", 226, 12345);

INSERT INTO LiveStock
VALUES("Grass", "Cattle", 415, 12345);

INSERT INTO LiveStock
VALUES("Grass","Cattle", 416, 67890);

INSERT INTO LiveStock
VALUES("Grass","Cattle", 417, 78901);

INSERT INTO LiveStock
VALUES("Seed", "Poultry", 240, 78901);

INSERT INTO LiveStock
VALUES("Grass","Cattle", 425, 00000);



DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
	Social_Security_Number INT,
	Receipt INT,
	Name VARCHAR(30) NOT NULL,
	SEX CHAR,
	Birthday DATE NOT NULL,
	Address VARCHAR(60),
	Telephone VARCHAR(60),
	CONSTRAINT customerPrimaryKey PRIMARY KEY(Social_Security_Number),
	CONSTRAINT customerReceiptCheck CHECK(Receipt >= 0),
	CONSTRAINT customerSexCheck CHECK(value in ("f","m")),
	CONSTRAINT customerBirthdayCheck CHECK(Birthday <= GetDate() and Birthday >= date '1900-01-01')
);


INSERT INTO Customer
VALUES(11111111, 2241, "John", "m", '1981-03-05', '11 South St', '4444444');

INSERT INTO Customer
VALUES(12345678, 3951, "Mary", "f", '1978-08-15', '12 HighWater St, 1 Ham St', '2508881');

INSERT INTO Customer
VALUES(23456789, NULL, "Suzie", "f", '1995-11-16', '15 Butterfly Rd', '7442112');

INSERT INTO Customer
VALUES(22222222, NULL, "Phil", NULL, '1964-04-25', '412 Chaplin Circle, 1118 5 St APT 12', '8338605');

INSERT INTO Customer
VALUES(33333333, 4950, "James", "m", '2001-12-07', '45 JohnMan Rd',' 4917505, 1214441');

INSERT INTO Customer
VALUES(44444444, 8679, "Billy Bob", "m", '1959-07-13', '98 North St', '1234567');

INSERT INTO Customer
VALUES(55555555, 5519, "Amanda", "f", '2002-04-02', '12 Miami Ln', '1231231');

INSERT INTO Customer
VALUES(66446648, 1240, "Meka", "f", '2003-10-18', '1 TheFarm Rd, 39 Cheeny Pl', '1225541');

INSERT INTO Customer
VALUES(89415551, NULL, "Johanna", "f", '1984-06-12', '14 NorthFeild Dr, 215 SouthFeild Dr', '8557451');

INSERT INTO Customer
VALUES(99814444, NULL, "Walter", NULL, '2000-08-12', '198 MiddleFeild Dr', '2337589,8897760');




DROP TABLE IF EXISTS Produce;
CREATE TABLE Produce(
	Price DECIMAL(5,2) NOT NULL,
	Type VARCHAR(20) NOT NULL,
	Buyer INT,
	Bar_Code INT,
	Inventory INT NOT NULL,
	Harvest DATETIME NOT NULL,
	HarvestedBy INT NOT NULL,
	CONSTRAINT producePrimaryKey PRIMARY KEY(Bar_Code), 
	CONSTRAINT produceForeignKey FOREIGN KEY(Buyer) REFERENCES Customer(Social_Security_Number),
	CONSTRAINT producePriceCheck CHECK(Price >= 0),
	CONSTRAINT produceInventoryCheck CHECK(Price >= 0),
	CONSTRAINT produceHarvestCheck CHECK(Harvest <= GetDate()),
	CONSTRAINT produceHarvestedByForeignKey FOREIGN KEY(HarvestedBy) REFERENCES FarmWorker(Employee_ID)
);

INSERT INTO Produce
VALUES(2.50, "vegetable", 23456789, 1001, 49, '2021-03-20 01:42:00', 12345);

INSERT INTO Produce
VALUES(3.75, "meat", 33333333, 3223, 74, '2021-03-22 10:00:00', 89012);

INSERT INTO Produce
VALUES(1.99, "meat", 22222222, 2221, 5, '2021-03-22 09:00:00', 12345);

INSERT INTO Produce
VALUES(2.99, "vegetable", 55555555, 4117, 50, '2021-03-20 13:00:00', 34567);

INSERT INTO Produce
VALUES(1.50, "vegetable", 23456789, 2501, 67, '2021-03-20 14:30:00', 12345);

INSERT INTO Produce
VALUES(2.50, "dairy", 55555555, 9999, 25, '2021-03-21 05:00:00', 00000);

INSERT INTO Produce
VALUES(3.50, "fruit", 66446648, 1350, 98, '2021-02-25 14:12:00',89012);

INSERT INTO Produce
VALUES(4.99, "fruit", 66446648, 1450, 30, '2021-02-25 18:39:00', 78901);

INSERT INTO Produce
VALUES(1.75, "fruit", 12345678, 1250, 72, '2021-02-25 17:00:00', 78901);

INSERT INTO Produce
VALUES(0.50,  "dairy", 23456789, 9991, 109, '2021-03-21 07:00:00', 00000);

