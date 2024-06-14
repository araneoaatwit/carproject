CREATE TABLE Car
(CarID     VARCHAR(10)      NOT NULL,
MakeID     VARCHAR(10)      NOT NULL,
ModelID     VARCHAR(10)      NOT NULL,
CONSTRAINT Car_PK PRIMARY KEY(CarID));

CREATE TABLE Make 
(MakeID     VARCHAR(10)      NOT NULL,
Country     VARCHAR(10)      NOT NULL,
Origin     VARCHAR(10)      NOT NULL,
CONSTRAINT Make_PK PRIMARY KEY(MakeID));


CREATE TABLE Model 
(ModelID     VARCHAR(10)      NOT NULL,
SubModelID     VARCHAR(8),
CONSTRAINT Model_PK PRIMARY KEY(ModelID));


CREATE TABLE SubModel 
(SubModelID     VARCHAR(8)      NOT NULL,
ManufactureYear     YEAR(4)      NOT NULL,
Fuel     INT(2)      NOT NULL,
Class     VARCHAR(20)      NOT NULL,
Doors     INT(2)      NOT NULL,
DrivetrainID     VARCHAR(10)      NOT NULL,
FeaturesID     VARCHAR(10)      NOT NULL,
EngineID     VARCHAR(10)      NOT NULL,
CONSTRAINT SubModel_PK PRIMARY KEY(SubModelID));


CREATE TABLE Drivetrain 
(DrivetrainID     VARCHAR(10)      NOT NULL,
WheelBase     VARCHAR(8)	NOT NULL,
Drivetrain     VARCHAR(6)      NOT NULL,
Trackbase    VARCHAR(6)      NOT NULL,
Transmission    VARCHAR(6)      NOT NULL,
Gears    INT(1)      NOT NULL,
CONSTRAINT Drivetrain_PK PRIMARY KEY(DrivetrainID));


CREATE TABLE Engine 
(EngineID     VARCHAR(10)      NOT NULL,
Name    VARCHAR(7)      NOT NULL,
Config    VARCHAR(7)      NOT NULL,
Liters    INT(2)      NOT NULL,
OilType    VARCHAR(7)      NOT NULL,
CrankOrintation    VARCHAR(7)      NOT NULL,
InjectionType    VARCHAR(7)      NOT NULL,
ForcedInduction    VARCHAR(7)      NOT NULL,
CONSTRAINT Engine_PK PRIMARY KEY(EngineID));


CREATE TABLE Features 
(FeaturesID     VARCHAR(6)      NOT NULL,
Carplay     BOOLEAN	NOT NULL,
Autodrive     BOOLEAN 	NOT NULL,
HeatedSeats     BOOLEAN      NOT NULL,
Moonrooof     BOOLEAN      NOT NULL,
CONSTRAINT Features_PK PRIMARY KEY(FeaturesID));

-- Foreign Key Assignment
ALTER TABLE SubModel ADD FOREIGN KEY (FeaturesID) REFERENCES Features(FeaturesID);
ALTER TABLE SubModel ADD FOREIGN KEY (EngineID) REFERENCES Engine(EngineID);
ALTER TABLE SubModel ADD FOREIGN KEY (DrivetrainID) REFERENCES Drivetrain(DrivetrainID);

ALTER TABLE Model  ADD FOREIGN KEY (SubModelID) REFERENCES SubModel(SubModelID);

ALTER TABLE Car  ADD FOREIGN KEY (MakeID) REFERENCES Make(MakeID);
ALTER TABLE Car ADD FOREIGN KEY (ModelID) REFERENCES Model(ModelID);
