--Lookups Tables

--Habiba 
CREATE TABLE EmployeeType (
Emp_Type_ID INT PRIMARY KEY IDENTITY(1,1),
Emp_Type VARCHAR(25),
Emp_Type_Desc VARCHAR(100))
INSERT INTO dbo.EmployeeType (Emp_Type,Emp_Type_Desc)
 VALUES ('Full-Time/Commission', 'Full- Time Employee on Salary with Commissio'),
 ('Part-Time/Commission', 'Part- Time Employee on Hourly with Commission'),
 ('Flex/Commission', 'Work as they company needs according to employee hours with Commission');
  SELECT * FROM EmployeeType;

CREATE TABLE EmployeePosition (
Emp_Position_ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL ,
Emp_Position VARCHAR(25),
Emp_Position_DESC VARCHAR(100),)
INSERT INTO EmployeePosition(Emp_Position, Emp_Position_DESC)
VALUES
 ('Manager', 'Manges the whole Buisness'),
 ('Clerk', 'Manages all the paperwork whole Buisness'),
 ('Front Desk', 'Take calls and set up appointments for the Buisness'),
 ('IT Tech', 'Ensure Buisness System runs smooth'),
 ('Owner', 'Owner of the whole Buisness'),
 ('Dispatcher', 'Communicate with client and assign the jobs'),
 ('Accountant', 'Manages the Buisness accounts');
SELECT * FROM EmployeePosition;

CREATE TABLE EmployeeStatus (Emp_Status_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Emp_Status VARCHAR(25),)
INSERT INTO EmployeeStatus
 ([Emp_Status]) VALUES
 ('Permanent'),
 ('Temporary'),('InProgress'),
 ('Inactive'), ('Terminated');
SELECT * FROM EmployeeStatus;

--Chris
Create Table TruckStatus(
ID int PRIMARY KEY IDENTITY(1,1), 
TruckStatus VarChar(25) NOT Null)
insert into dbo.TruckStatus (TruckStatus)
Values 
	('Working'),('Broken'),('Under Repair'),('Total Lost'),('Available'), ('Unavailable');
select * from TruckStatus;

--Miguel
Create Table DriverStatus(
Driver_Status_ID int PRIMARY KEY IDENTITY(1,1), 
Driver_Status VarChar(25) NOT Null)
insert into DriverStatus (Driver_Status)
Values 
	('Active'),	('Probation'),('Not Active');
select * from DriverStatus;

--Amalia
create table TruckOwnerStatus
(
Status_ID int primary key identity(1,1),
TruckOwnerStatus varchar(25)NOT Null)
insert into dbo.TruckOwnerStatus(TruckOwnerStatus)
values ('Active'),('Inactive'),('Terminated Lease')
,('Long Absence'),('In Progress');
select * from TruckOwnerStatus

create table BrokerStatus
(
Status_ID int primary key identity(1,1),
BrokerStatus varchar(25))
insert into dbo.BrokerStatus (BrokerStatus)
values ('Active'),('Inactive');
select * from BrokerStatus;

--Melissa
Create Table DrugTestStatus(
	Status_ID int Primary Key IDENTITY(1,1),
	DrugTestStatus VarChar(25) NOT Null)
insert into dbo.DrugTestStatus(DrugTestStatus)
Values
	('Postive'),('Pending'),('Incomplete'),('Scheduled'),('Not Passed');
select* from DrugTestStatus;

--Cindy
create table TrailerStatus(
Trailer_Status_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Trailer_Status Varchar(25) not null)
insert into dbo.TrailerStatus (Trailer_Status)
Values 
	('Available'),('Unavailable'),('Under Repair'),('Total Lost');
select * from TrailerStatus;

create table TrailerOwnerType(
Trailer_Owner_Type_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Trailer_Owner_Type varchar(100) not null,
Trailer_Owner_Desc varchar(100)
)
insert into dbo.TrailerOwnerType (Trailer_Owner_Type,Trailer_Owner_Desc )
Values 
	('Company','Trailer is owned by a private company'),('Truck Owner', 'Trailer is owned by a truck owner');
select * from TrailerOwnerType;

--Zack
create table LoadStatus
(Load_Status_ID int primary key identity(1,1),
Load_Status varchar(25))
insert into dbo.LoadStatus (Load_Status )
values ('Pending'),('In Progress'), ('Delivered'),('Completed'), ('Cancelled');
select * from LoadStatus;


create table Country
(
Country_ID int primary key identity(1,1),
Country_Name varchar(52)
)
bulk insert Country
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Country.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Country;


create table State
(State_ID int primary key identity(1,1),
State_Name varchar(50),Country_ID int)

Alter Table State Add Constraint Country_ID_FK
Foreign Key (Country_ID) References Country(Country_ID)

bulk insert State
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\State.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from State;


/*
drop table BrokerStatus
drop table DriverStatus
drop table DrugTestStatus
drop table EmployeePosition
drop table EmployeeStatus
drop table LoadStatus
drop table State
drop table TrailerOwnerType
drop table TrailerStatus
drop table TruckOwnerStatus
drop table TruckStatus
drop table EmployeeType
drop table Country

*/
--Accident,Injury, Witness, Other Vehicle Info
--Alex

/*
drop table Injury
drop table OtherVehicleInfo
drop table Witness
drop table Load
drop table Accident 
drop table Employee 
drop table Broker 
drop table Truck
drop table Trailer
drop table TruckOwner
drop table TrailerOwner
drop table DrugTest
drop table DrugTestCompany
drop table Driver
drop table Endorsement
drop table Note
*/
CREATE TABLE Accident (
Accident_ID INT PRIMARY KEY IDENTITY(1,1),
Accident_Date date,
Accident_GeneralDescription varchar(100),
Accident_Location varchar (100),
Accident_City varchar (60),
State_ID int,
Accident_ZipCode varchar(6),
)

Alter Table Accident Add Constraint State_ID_FK
Foreign Key (State_ID) References State(State_ID)

bulk insert Accident
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Accident.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Accident




create table OtherVehicleInfo
(
OVI_ID int primary key identity(1,1),
Accident_ID int,
OVI_DriverFirstName varchar(35),
OVI_DriverLastName varchar(35), 
OVI_DriversAddress varchar(60), 
OVI_DriversCity varchar(60),
State_ID int,
OVI_ZipCode varchar(6),
OVI_Make varchar(20), 
OVI_Model varchar(30),
OVI_Year int, 
OVI_LicenseNumber int,
OVI_InsuranceCompany varchar(20), 
OVI_InsuranceCompanyPhoneNumber float,
OVI_InsuranceCompanyEmail varchar(60),
OVI_InsuranceClaimNumber varchar(20),
OVI_DamageDescription varchar(50)
)

Alter Table OtherVehicleInfo Add Constraint OtherVehicleInfo_Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)



Alter Table OtherVehicleInfo Add Constraint OtherVehicleInfo_State_ID_FK
Foreign Key (State_ID) References State(State_ID)


bulk insert OtherVehicleInfo
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\OtherVehicleInfo.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from OtherVehicleInfo

CREATE TABLE Injury (
Injury_ID INT PRIMARY KEY IDENTITY(1,1),
OVI_ID int, 
Accident_ID int,
Injury_InjuredFirstName varchar(35),
Injury_InjuredLastName varchar(35),
Injury_InjuredAddress varchar (60),
Injury_InjuredCity varchar (60),
State_ID int,
Injury_InjuredZipCode varchar(6),
Injury_InjuredHospital varchar(58),
Injury_InjuredDoctor varchar(20),
Injury_InjuredDescription varchar(50))

Alter Table Injury Add Constraint Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)

Alter Table Injury Add Constraint OVI_Injury_ID_FK
Foreign Key (OVI_ID) References OtherVehicleInfo(OVI_ID)

Alter Table Injury Add Constraint Injury_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

bulk insert Injury
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Injury.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Injury


create table Witness
(
Witness_ID int primary key identity(1,1),
Accident_ID int,
Witness_WitnessFirstName varchar(35),Witness_WitnessLastName varchar(35), Witness_WitnessPhoneNumber float, 
Witness_WitnessEmailAddress varchar(60),Witness_WitnessNotes varchar(100),
)

Alter Table Injury Add Constraint Witness_Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)

bulk insert Witness
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Witness.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Witness


--Employee
--Habiba
CREATE TABLE Employee (
Emp_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Emp_FName VARCHAR(35) NOT NULL,
Emp_MInitial VARCHAR(1),
Emp_LName VARCHAR(35) NOT NULL,
Emp_BDate DATE NOT NULL,
Emp_Address VARCHAR(60)  NOT NULL,
City VARCHAR(60) NOT NULL,
Zipcode VARCHAR(6) NOT NULL,
Emp_Email VARCHAR(60) NOT NULL,
Emp_Phone FLOAT NOT NULL,
Emp_SSN VARCHAR(11) NOT NULL,
Emp_SD Date NOT NULL,
Emp_ED Date,
Emp_DL VARCHAR(260),
Exp_DL date, 
State_ID INT,
Emp_Position_ID INT,
Emp_Type_ID INT,
Emp_Status_ID INT
)

Alter Table Employee Add Constraint Employee_State_ID2_FK
Foreign Key (State_ID) References State(State_ID)

Alter Table Employee Add Constraint Emp_Position_ID_FK
Foreign Key (Emp_Position_ID) References EmployeePosition(Emp_Position_ID)

Alter Table Employee Add Constraint EmployeeType_ID_FK
Foreign Key (Emp_Type_ID ) References EmployeeType(Emp_Type_ID )

Alter Table Employee Add Constraint EmployeeStatus_ID_FK
Foreign Key (Emp_Status_ID ) References EmployeeStatus(Emp_Status_ID )

BULK INSERT Employee  
FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Employee.csv' WITH (
   ROWTERMINATOR = '\n', 
   FIELDTERMINATOR = ',' 
)
SELECT * FROM Employee

--Broker and Truck Owner
--Amalia Vina
create table Broker
(
ID int primary key identity(1,1),
FName varchar(35), LName varchar(35), Phone varchar(12), Email varchar(60),
[Address] varchar(60), City varchar(60), State_ID int, 
ZipCode int, Broker_Status_ID int
)

Alter Table Broker Add Constraint Broker_ID_FK
Foreign Key (Broker_Status_ID) References BrokerStatus(Status_ID)

Alter Table Broker Add Constraint Broker_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

bulk insert Broker
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Broker.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Broker

create table TruckOwner
(
ID int primary key identity(1,1),
FName varchar(35),MInitial char(1), LName varchar(35),BDate date, Phone float, Email varchar(60),SSN varchar(11),
License int, Identification_Doc varchar(260) ,[Address] varchar(60), City varchar(60), State_ID int , 
ZipCode int, TruckOwnerStatus int
)

Alter Table TruckOwner Add Constraint TruckOwnerStatus_ID_FK
Foreign Key (TruckOwnerStatus) References TruckOwnerStatus(Status_ID)

Alter Table TruckOwner Add Constraint TruckOwner_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

bulk insert TruckOwner
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TruckOwner.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from TruckOwner

--Jordan
--Load
CREATE TABLE Load
(
	LoadID INT IDENTITY(1,1) PRIMARY KEY,
	LoadNumber VARCHAR(30),
	RateOfConfirmation VARCHAR(260),
	LoadDate Date,
	DateExpected DATE,
	DateDelivered DATE,
	ProofOfDelivery VARCHAR(260),
	Employee INT,
	Broker INT,
	LoadStatus INT)

Alter Table Load Add Constraint Employee_Load_ID_FK
Foreign Key (Employee ) References Employee(Emp_ID )

Alter Table Load Add Constraint Broker_Load_ID_FK
Foreign Key (Broker ) References Broker(ID)

Alter Table Load Add Constraint LoadStatus_Load_ID_FK
Foreign Key (LoadStatus ) References LoadStatus(Load_Status_ID )

	BULK INSERT Load FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Load.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
SELECT * FROM Load;


--Truck
--Chris 

CREATE TABLE Truck (
Truck_ID int NOT NULL Primary Key Identity(1,1),
Truck_Year INT,
Truck_Make VARCHAR(20),
Truck_Model VARCHAR(20),
Truck_VIN VARCHAR(17),
Truck_PlateNumber varchar(10),
Truck_Length DECIMAL(4,2),
Truck_Width DECIMAL(4,2),
Inspection_Expi Date ,
Truck_State int,
TruckStatus_ID int,
TruckOwner_ID int
)
Alter Table Truck Add Constraint Truck_State_ID_FK
Foreign Key (Truck_State) References State(State_ID)

Alter Table Truck Add Constraint TruckStatus_ID_FK
Foreign Key (TruckStatus_ID) References TruckStatus(ID)

Alter Table Truck Add Constraint TruckOwner_ID_FK
Foreign Key (TruckOwner_ID) References TruckOwner(ID)

bulk insert Truck
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Truck.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from Truck 

--Trailer, Trailer Owner
--Cindy
CREATE TABLE TrailerOwner(
Trailer_Owner_ID int NOT NULL Primary Key Identity(1,1),
Trailer_Owner_FName varchar(30) not null,
Trailer_Owner_MInitial varchar(1),
Trailer_Owner_LName varchar(30) not null,
Trailer_Owner_BDate date ,
Trailer_Owner_Phone float not null,
Trailer_Owner_SSN varchar(9),
Trailer_Owner_License varchar(15),
Trailer_Owner_Email varchar(30),
Trailer_Owner_Address varchar(30),
City varchar(50) not null,
Zipcode varchar (10) not null,
State_ID int ,
Trailer_Owner_Type_ID int,
)

Alter Table TrailerOwner Add Constraint TrailerOwner_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

Alter Table TrailerOwner Add Constraint TrailerOwnerType_ID_FK
Foreign Key (Trailer_Owner_Type_ID) References TrailerOwnerType(Trailer_Owner_Type_ID)

BULK INSERT TrailerOwner  
FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TrailerOwner.csv' WITH (
   ROWTERMINATOR = '\n', 
   FIELDTERMINATOR = ',' 
)
SELECT * FROM TrailerOwner 


create table Trailer(
Trailer_ID int NOT NULL Primary Key Identity(1,1),
Trailer_Year int not null,
Trailer_Make Varchar(20) not null,
Trailer_Model Varchar(20) not null,
Trailer_TYPE Varchar(20) not null,
Trailer_Vin Varchar(20) not null,
Trailer_PlateNumber Varchar(10)not null,
Trailer_Length float not null,
Trailer_Width float not null,
Inspection_Expiration_Date Date not null,
Truck_Owner_ID int not null,
Trailer_Owner_ID int not null,
State_ID int not null,
Trailer_Status_ID int not null
)

Alter Table Trailer Add Constraint Trailer_State_ID2_FK
Foreign Key (State_ID) References State(State_ID)

Alter Table Trailer Add Constraint Trailer_Truck_Owner_ID_FK
Foreign Key (Truck_Owner_ID) References TruckOwner(ID)

Alter Table Trailer Add Constraint Trailer_Owner_ID_FK
Foreign Key (Trailer_Owner_ID) References TrailerOwner(Trailer_Owner_ID)

Alter Table Trailer Add Constraint Trailer_Status_State_ID_FK
Foreign Key (Trailer_Status_ID) References TrailerStatus(Trailer_Status_ID)

BULK INSERT Trailer  
FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Trailer.csv' WITH (
   ROWTERMINATOR = '\n', 
   FIELDTERMINATOR = ',' 
)
SELECT * FROM Trailer 

--Miguel
--Endorsement, Driver
Create Table Endorsement(
ID int PRIMARY KEY IDENTITY(1,1), 
End_Type VarChar(50) NOT Null,
End_Description VarChar(200) NOT NULL
)

insert into dbo.Endorsement(End_Type,End_Description)
Values 
	('Passenger Transport Endorsement','allow you to operate a vehicle that carries a specified number of passengers (i.e. commuter bus)'),
	('Double/Triples Endorsement','tow a double or triple trailer'),
	('Hazardous Materials Endorsement (HAZMAT)','required for transporting hazardous materials, such as flammable and combustible liquids, gases or other explosives'),
	('Tanker/HAZMAT Combo Endorsement','transport hazardous materials in a tank vehicle'),
	('Tank Vehicle Endorsement (Tanker)','will allow you to operate a tank vehicle, featuring either a permanent or temporary tank attached to the vehicle itself');

	select * from Endorsement

	Create Table Driver(
ID int PRIMARY KEY IDENTITY(1,1), 
Employee_ID int NOT Null,
First_Name Varchar(35) NOT Null,
Middle_Initial char(1) NOT Null,
Last_Name Varchar(35) NOT Null,
DOB date NOT Null,
Email Varchar (60) NOT Null,
Phone float NOT Null,
SSN varchar(11) NOT Null,
Licence_Num int NOT Null,
Licence_Doc varchar(260) Null,
Exp_License Date,
MedCard_Doc varchar(260) Null,
Exp_MedCard date, 
Driver_Address Varchar(60) NOT Null,
City Varchar(60) NOT Null,
Zip int NOT Null,
State_ID int NOT Null,
TruckOwner_ID int Null,
DriverStatus int NOT Null
)

Alter Table Driver Add Constraint Driver_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

Alter Table Driver Add Constraint Driver_ID_FK
Foreign Key (Employee_ID) References Employee(Emp_ID)

Alter Table Driver Add Constraint Driver_TruckOwner_ID_FK
Foreign Key (TruckOwner_ID) References TruckOwner(ID)

Alter Table Driver Add Constraint DriverStatus_ID_FK
Foreign Key (DriverStatus) References DriverStatus(Driver_Status_ID)

BULK INSERT Driver
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Driver.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)
	select * from  Driver

--Melissa
--Drug Test Co, Drug Test

create Table DrugTestCompany
(
	DrugTest_ID int NOT NULL Primary Key identity(1,1),
	DrugTestCom_Name varchar(50),
	DrugTestCom_Address varchar(60),
	City varchar(60),
	State_ID int,
	ZipCode int,
	DrugTestCom_Phone float,
	DrugTestCom_Email varchar(60)
)

Alter Table DrugTestCompany Add Constraint DrugTestCompany_State_ID_FK
Foreign Key (State_ID) References State(State_ID)

bulk insert DrugTestCompany
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\DrugTestCompany.csv'
with
(
rowterminator='\n',
fieldterminator=','
)
select*from DrugTestCompany

create table DrugTest(
	DrugT_ID int NOT NULL Primary Key identity(1,1),
	DrugTest_DateTime DATE,
	DrugTest_Doc varchar(260),
	Driver_ID int ,
	DrugTestCompany int,
	DrugTest_StatusID int ,
	)
	
	Alter Table DrugTest Add Constraint DrugTest_Driver_ID_FK
Foreign Key (Driver_ID) References Driver(ID)

	Alter Table DrugTest Add Constraint DrugTestCompany_ID_FK
Foreign Key (DrugTestCompany) References DrugTestCompany(DrugTest_ID)

	Alter Table DrugTest Add Constraint DrugT_ID_FK
Foreign Key (DrugTest_StatusID) References DrugTestStatus(Status_ID)

bulk insert DrugTest
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\DrugTest.csv'
with
(
rowterminator='\n',
fieldterminator=','
)
select* from DrugTest;


--Justin
--Note
create table [Note]
(
	Note_ID int not null Primary Key identity(1,1),
	Note varchar(240),
	Emp_ID int ,
	Load_ID int
)

	Alter Table [Note] Add Constraint Note_ID_FK
Foreign Key (Emp_ID) References Employee(Emp_ID)

	Alter Table [Note] Add Constraint Note_Load_ID_FK
Foreign Key (Load_ID) References [Load](LoadID)

bulk insert [Note]
from 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\Note.csv'
with
(
rowterminator='\n',
fieldterminator=',')
select * from [Note]



--Miguel
--Driver Endorsement

Create Table Driver_Endorsement(
Driver_ID int NOT Null,
END_ID int NOT NULL,
Sate_ID int NOT Null,
Date_Aquired date Null,
Expiration date NOT Null
CONSTRAINT PK_DRIVER_ENDORSEMENT PRIMARY KEY(DRIVER_ID,END_ID)
)
ALTER TABLE Driver_Endorsement
   ADD CONSTRAINT FK_Driver_END FOREIGN KEY (DRIVER_ID)
      REFERENCES Driver (ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE

BULK INSERT Driver_Endorsement
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\DriverEndorsement.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)
	select * from Driver_Endorsement

--Justin
-- TDT Accident, TDTL Accident

create table TruckDriverTrailerAccident
(
	Truck_ID int ,
	Driver_ID int ,
	Trailer_ID int ,
	Accident_ID int 
	CONSTRAINT TruckDriverTrailerAccidentID PRIMARY KEY (Truck_ID, Driver_ID, Trailer_ID, Accident_ID)
)

Alter Table TruckDriverTrailerAccident Add Constraint TDTA_Truck_ID_FK
Foreign Key (Truck_ID) References Truck(Truck_ID)

Alter Table TruckDriverTrailerAccident Add Constraint TDTA_Driver_ID_FK
Foreign Key (Driver_ID) References Driver(ID)

Alter Table TruckDriverTrailerAccident Add Constraint TDTA_Trailer_ID_FK
Foreign Key (Trailer_ID) References Trailer(Trailer_ID)

Alter Table TruckDriverTrailerAccident Add Constraint TDTA_Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)

BULK INSERT TruckDriverTrailerAccident
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TruckDriverTrailerAccident.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from TruckDriverTrailerAccident

create table [TruckDriverTrailerLoadAccident]
(
	Truck_ID int ,
	Driver_ID int ,
	Trailer_ID int ,
	Accident_ID int ,
	Load_ID int 
	CONSTRAINT TruckDriverTrailerLoadAccidentID PRIMARY KEY (Truck_ID, Driver_ID, Trailer_ID, Accident_ID,Load_ID)
)

Alter Table [TruckDriverTrailerLoadAccident] Add Constraint TDTLA_Truck_ID_FK
Foreign Key (Truck_ID) References Truck(Truck_ID)

Alter Table [TruckDriverTrailerLoadAccident] Add Constraint TDTLA_Driver_ID_FK
Foreign Key (Driver_ID) References Driver(ID)

Alter Table [TruckDriverTrailerLoadAccident] Add Constraint TDTLA_Trailer_ID_FK
Foreign Key (Trailer_ID) References Trailer(Trailer_ID)

Alter Table [TruckDriverTrailerLoadAccident] Add Constraint TDTLA_Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)

Alter Table [TruckDriverTrailerLoadAccident] Add Constraint TDTLA_Load_ID_FK
Foreign Key (Load_ID) References Load(LoadID)

BULK INSERT [TruckDriverTrailerLoadAccident]
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TruckDriverTrailerLoadAccident.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from [TruckDriverTrailerLoadAccident]

--Chris
--TD Accident

create table TruckDriverAccident
(
	Truck_ID int ,
	Driver_ID int ,
	Accident_ID int ,
	CONSTRAINT TruckDriverAccidentID PRIMARY KEY (Truck_ID, Driver_ID, Accident_ID)
)

Alter Table TruckDriverAccident Add Constraint TDA_Truck_ID_FK
Foreign Key (Truck_ID) References Truck(Truck_ID)

Alter Table TruckDriverAccident Add Constraint TDA_Driver_ID_FK
Foreign Key (Driver_ID) References Driver(ID)

Alter Table TruckDriverAccident Add Constraint TDA_Accident_ID_FK
Foreign Key (Accident_ID) References Accident(Accident_ID)

BULK INSERT TruckDriverAccident
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TDA.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from TruckDriverAccident

--Jordan
--TruckDriver, TDT, TDTL
CREATE TABLE TruckDriver
(
	TruckID INT,
	DriverID INT,
	CONSTRAINT TruckDriverID PRIMARY KEY (TruckID, DriverID)
);

Alter Table TruckDriver Add Constraint TruckDriver_Truck_ID_FK
Foreign Key (TruckID) References Truck(Truck_ID)

Alter Table TruckDriver Add Constraint TruckDriver_Driver_ID_FK
Foreign Key (DriverID) References Driver(ID)

BULK INSERT TruckDriver
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TD.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from TruckDriver

CREATE TABLE TruckDriverTrailer
(
	TruckID INT,
	DriverID INT,
	TrailerID INT,
	CONSTRAINT TruckDriverTrailerID PRIMARY KEY (TruckID, DriverID, TrailerID)
);

Alter Table TruckDriverTrailer Add Constraint TDT_Truck_ID_FK
Foreign Key (TruckID) References Truck(Truck_ID)

Alter Table TruckDriverTrailer Add Constraint TDT_Driver_ID_FK
Foreign Key (DriverID) References Driver(ID)

Alter Table TruckDriverTrailer Add Constraint TDT_Trailer_ID_FK
Foreign Key (TrailerID) References Trailer(Trailer_ID)

BULK INSERT TruckDriverTrailer
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TDT.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from TruckDriverTrailer

CREATE TABLE TruckDriverTrailerLoad
(
	TruckID INT,
	DriverID INT,
	TrailerID INT,
	LoadID INT,
	CONSTRAINT TruckDriverTrailerLoadID PRIMARY KEY (TruckID, DriverID, TrailerID, LoadID)
);

Alter Table TruckDriverTrailerLoad Add Constraint TDTL_Truck_ID_FK
Foreign Key (TruckID) References Truck(Truck_ID)

Alter Table TruckDriverTrailerLoad Add Constraint TDTL_Driver_ID_FK
Foreign Key (DriverID) References Driver(ID)

Alter Table TruckDriverTrailerLoad Add Constraint TDTL_Trailer_ID_FK
Foreign Key (TrailerID) References Trailer(Trailer_ID)

Alter Table TruckDriverTrailerLoad Add Constraint TDTL_Load_ID_FK
Foreign Key (LoadID) References Load(LoadID)

BULK INSERT TruckDriverTrailerLoad
	FROM 'C:\Amalia Desktop\UH classes\Spring 2020\Detillier-CIS 3365\TDTL.csv'
	WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)

select * from TruckDriverTrailerLoad

/*
drop table [TruckDriverTrailerLoadAccident]
drop table TruckDriverTrailerAccident
drop table Driver_Endorsement
drop table TruckDriverAccident
drop table TruckDriver
drop table TruckDriverTrailer
drop table TruckDriverTrailerLoad*/