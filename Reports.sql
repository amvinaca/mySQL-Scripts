Report 1

select Load.LoadNumber, Load.LoadDate, Employee.Emp_FName as Dispatcher, Broker.ID as BrokerID, 
Broker.FName as BrokerFirstName, Broker.LName as BrokerLastName, State.State_Name, BrokerStatus.BrokerStatus
from Broker inner join Load 
on Broker.ID=Load.Broker
inner join Employee on 
Employee.Emp_ID=Load.Employee
inner join State on
State.State_ID=Broker.State_ID
inner join BrokerStatus on
BrokerStatus.Status_ID=Broker.Broker_Status_ID
where Broker.Broker_Status_ID=1 and Load.LoadDate >= '2020/03/02' and Load.LoadDate <= '2020/03/08'
order by Load.LoadDate 


Report 2

select TruckOwner.ID as TruckOwnerID, TruckOwner.FName, 
TruckOwner.LName,TruckOwnerStatus.TruckOwnerStatus,TrailerStatus.Trailer_Status,
Trailer_TYPE, count(Trailer.Truck_Owner_ID) as 'Total Trailers'
from TruckOwner inner join Trailer 
on Trailer.Truck_Owner_ID=TruckOwner.ID
inner join TruckOwnerStatus on TruckOwnerStatus.Status_ID=TruckOwner.TruckOwnerStatus
inner join TrailerStatus on TrailerStatus.Trailer_Status_ID=Trailer.Trailer_Status_ID
where TruckOwnerStatus.Status_ID=1
group by TruckOwner.ID, TruckOwner.ID,TruckOwner.FName, TruckOwner.LName,
TrailerStatus.Trailer_Status,TruckOwnerStatus.TruckOwnerStatus,Trailer_TYPE
order by  [Total Trailers] DESC, TrailerStatus.Trailer_Status, TruckOwner.FName


Report 3

select TruckOwner.ID as TruckOwnerID, TruckOwner.FName, TruckOwner.LName,TruckOwnerStatus.TruckOwnerStatus,  
Truck.TruckOwner_ID, Truck.Truck_Make, Truck.Truck_Year, TruckStatus.TruckStatus
from TruckOwner inner join Truck 
on TruckOwner.ID=Truck.TruckOwner_ID
inner join TruckOwnerStatus on TruckOwnerStatus.Status_ID=TruckOwner.TruckOwnerStatus
inner join TruckStatus on TruckStatus.ID=Truck.TruckStatus_ID
where TruckOwner.TruckOwnerStatus=1
order by  TruckStatus, TruckOwner.FName


Report 4

select count (Driver.TruckOwner_ID) as 'Total Drivers',TruckOwner.ID as TruckOwnerID, TruckOwner.FName, TruckOwner.LName,TruckOwner.Phone,TruckOwnerStatus.TruckOwnerStatus  
from TruckOwner inner join Driver 
on TruckOwner.ID=Driver.TruckOwner_ID
inner join TruckOwnerStatus on TruckOwnerStatus.Status_ID=TruckOwner.TruckOwnerStatus
inner join DriverStatus on DriverStatus.Driver_Status_ID=Driver.DriverStatus
where TruckOwner.TruckOwnerStatus=1 and DriverStatus.Driver_Status_ID=1
group by Driver.TruckOwner_ID, TruckOwner.ID, TruckOwner.FName, TruckOwner.LName,TruckOwnerStatus.TruckOwnerStatus,TruckOwner.Phone
order by [Total Drivers] DESC

