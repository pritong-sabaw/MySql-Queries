-- MySqlBackup.NET 2.3.5
-- Dump Time: 2021-11-02 21:48:58
-- --------------------------------------
-- Server version 8.0.24 MySQL Community Server - GPL


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of tbl_category
-- 

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_category
-- 

/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category`(`Id`,`Name`) VALUES
(1,'Feeds'),
(2,'Goods');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;

-- 
-- Definition of tbl_customer
-- 

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Price_Id` int DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `FullAddress` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_customer
-- 

/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer`(`Id`,`Price_Id`,`FullName`,`FullAddress`,`ContactNumber`) VALUES
(3,4,'FISHMOKO','General Santos City','2342342'),
(10,6,'test1','segs','69420'),
(11,7,'Derick Fajardo','General Santos','0912345678');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;

-- 
-- Definition of tbl_expensetype
-- 

DROP TABLE IF EXISTS `tbl_expensetype`;
CREATE TABLE IF NOT EXISTS `tbl_expensetype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_expensetype
-- 

/*!40000 ALTER TABLE `tbl_expensetype` DISABLE KEYS */;
INSERT INTO `tbl_expensetype`(`Id`,`Name`,`Description`) VALUES
(1,'Electric Bill','Electricity Consumed'),
(2,'Utilities','Tools, Machine, etc..');
/*!40000 ALTER TABLE `tbl_expensetype` ENABLE KEYS */;

-- 
-- Definition of tbl_expense
-- 

DROP TABLE IF EXISTS `tbl_expense`;
CREATE TABLE IF NOT EXISTS `tbl_expense` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ExpenseType_Id` int DEFAULT NULL,
  `Amount` decimal(18,2) DEFAULT NULL,
  `EntryDate` date DEFAULT NULL,
  `Remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `tbl_expense_ibfk_1` (`ExpenseType_Id`),
  CONSTRAINT `tbl_expense_ibfk_1` FOREIGN KEY (`ExpenseType_Id`) REFERENCES `tbl_expensetype` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_expense
-- 

/*!40000 ALTER TABLE `tbl_expense` DISABLE KEYS */;
INSERT INTO `tbl_expense`(`Id`,`ExpenseType_Id`,`Amount`,`EntryDate`,`Remarks`) VALUES
(1,1,4000.00,'2021-10-20 00:00:00','Over due');
/*!40000 ALTER TABLE `tbl_expense` ENABLE KEYS */;

-- 
-- Definition of tbl_item
-- 

DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Category_Id` int DEFAULT NULL,
  `Type_Id` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `tbl_item_ibfk_1` (`Category_Id`),
  CONSTRAINT `tbl_item_ibfk_1` FOREIGN KEY (`Category_Id`) REFERENCES `tbl_category` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_item
-- 

/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
INSERT INTO `tbl_item`(`Id`,`Category_Id`,`Type_Id`,`Name`) VALUES
(1,1,2,'Arowana'),
(4,2,0,'Rice'),
(10,1,1,'Oversea');
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;

-- 
-- Definition of tbl_pond
-- 

DROP TABLE IF EXISTS `tbl_pond`;
CREATE TABLE IF NOT EXISTS `tbl_pond` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) DEFAULT NULL,
  `Area` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_pond
-- 

/*!40000 ALTER TABLE `tbl_pond` DISABLE KEYS */;
INSERT INTO `tbl_pond`(`Id`,`Code`,`Area`) VALUES
(1,'P1',5300),
(2,'P2',5400),
(3,'P3',5270),
(4,'P4',4440),
(5,'P5',4485),
(6,'P6',4485),
(7,'P7',7000),
(8,'P8',10000),
(9,'P9',8500),
(10,'P10',6000),
(11,'P11',13000),
(12,'P12',1500);
/*!40000 ALTER TABLE `tbl_pond` ENABLE KEYS */;

-- 
-- Definition of tbl_price
-- 

DROP TABLE IF EXISTS `tbl_price`;
CREATE TABLE IF NOT EXISTS `tbl_price` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) DEFAULT NULL,
  `Value` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_price
-- 

/*!40000 ALTER TABLE `tbl_price` DISABLE KEYS */;
INSERT INTO `tbl_price`(`Id`,`Code`,`Value`) VALUES
(4,'XPR1',420.69),
(6,'XD123',6969.00),
(7,'PRWN01',249.00);
/*!40000 ALTER TABLE `tbl_price` ENABLE KEYS */;

-- 
-- Definition of tbl_production
-- 

DROP TABLE IF EXISTS `tbl_production`;
CREATE TABLE IF NOT EXISTS `tbl_production` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Farm_Name` varchar(50) DEFAULT NULL,
  `Date_Prepared` date DEFAULT NULL,
  `Pond_Id` int DEFAULT NULL,
  `Pond_Preparation_Date` varchar(100) DEFAULT NULL,
  `Date_Stocked` date DEFAULT NULL,
  `DateOf_Harvest` date DEFAULT NULL,
  `Total_Stocked` bigint DEFAULT NULL,
  `Stock_Density` int DEFAULT NULL,
  `DaysOf_Culture` int DEFAULT NULL,
  `Survival_Rate` decimal(18,2) DEFAULT NULL,
  `AveBodyWeight` decimal(18,2) DEFAULT NULL,
  `Biomass` decimal(18,2) DEFAULT NULL,
  `Feeds_Required` decimal(18,2) DEFAULT NULL,
  `Total_Feeds_Consumed` decimal(18,2) DEFAULT NULL,
  `Feeds_Consumed_Ratio` decimal(18,2) DEFAULT NULL,
  `Sales_Amount` decimal(18,2) DEFAULT NULL,
  `FrySource_Id` int DEFAULT NULL,
  `Crop_Number` int DEFAULT NULL,
  `Production_Status` varchar(50) DEFAULT NULL,
  `Sale_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_production
-- 

/*!40000 ALTER TABLE `tbl_production` DISABLE KEYS */;
INSERT INTO `tbl_production`(`Id`,`Farm_Name`,`Date_Prepared`,`Pond_Id`,`Pond_Preparation_Date`,`Date_Stocked`,`DateOf_Harvest`,`Total_Stocked`,`Stock_Density`,`DaysOf_Culture`,`Survival_Rate`,`AveBodyWeight`,`Biomass`,`Feeds_Required`,`Total_Feeds_Consumed`,`Feeds_Consumed_Ratio`,`Sales_Amount`,`FrySource_Id`,`Crop_Number`,`Production_Status`,`Sale_Status`) VALUES
(5,'sdffaf','2021-10-31 00:00:00',10,'2021-10-25','2021-10-25 00:00:00','2021-10-25 00:00:00',2,2,2,2.00,2.00,2.00,2.00,60.00,2.00,0.00,6,2,'Result','Inactive'),
(8,'adofuygfq','0001-01-01 00:00:00',1,'2021-10-25','2021-10-25 00:00:00','2021-10-25 00:00:00',4000,4,4,4.00,4.00,4.00,4.00,0.00,4.00,0.00,6,4,'Plan','Active'),
(9,'ygadyfgauyf','0001-01-01 00:00:00',5,'2021-10-25','2021-10-25 00:00:00','2021-10-25 00:00:00',8977,1,1,1.00,1.00,1.00,1.00,0.00,1.00,0.00,7,1,'Plan','Active'),
(10,'Calumpang Branch','0001-01-01 00:00:00',7,'2021-10-25','2021-10-25 00:00:00','2021-10-25 00:00:00',2300,420,7,120.00,230.00,55.00,12.00,0.00,1.00,0.00,6,1,'Plan','Inactive');
/*!40000 ALTER TABLE `tbl_production` ENABLE KEYS */;

-- 
-- Definition of tbl_role
-- 

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE IF NOT EXISTS `tbl_role` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_role
-- 

/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role`(`Id`,`Title`) VALUES
(1,'Admin'),
(2,'Encoder'),
(3,'Cashier');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;

-- 
-- Definition of tbl_employee
-- 

DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Role_Id` int DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `ImagePath` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Role_Id` (`Role_Id`),
  CONSTRAINT `tbl_employee_ibfk_1` FOREIGN KEY (`Role_Id`) REFERENCES `tbl_role` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_employee
-- 

/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee`(`Id`,`Role_Id`,`FirstName`,`LastName`,`ContactNumber`,`UserName`,`Password`,`Status`,`ImagePath`) VALUES
(11,1,'Nurfajar','Sali','09353536418','admin','admin','Active','Nurfajar.jpg'),
(12,2,'George','Miller','42069','encoder','encoder','Active','George.jpg'),
(13,3,'Christine','Reyes','23452354','cashier','cashier','Active','Christine.jpg');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;

-- 
-- Definition of tbl_logs
-- 

DROP TABLE IF EXISTS `tbl_logs`;
CREATE TABLE IF NOT EXISTS `tbl_logs` (
  `Employee_Id` int DEFAULT NULL,
  `Activity` varchar(250) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  KEY `Employee_Id` (`Employee_Id`),
  CONSTRAINT `tbl_logs_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `tbl_employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_logs
-- 

/*!40000 ALTER TABLE `tbl_logs` DISABLE KEYS */;
INSERT INTO `tbl_logs`(`Employee_Id`,`Activity`,`Type`,`Date`) VALUES
(12,'Confirmed Deivery: OrderSlip: [342354123], Customer: [FISHMOKO], Quantity: [1000.00] Total Sale:[420690.00]','Order','2021-10-08 18:07:00'),
(12,'Confirmed Delivery: OrderSlip: [342354123], Customer: [FISHMOKO], Quantity: [1000.00] Total Sale:[420690.00]','Order','2021-10-09 08:03:00'),
(12,'New Order Entry: OrderSlip: [76481893721], Customer: [FISHMOKO], Quantity: [100] Pond:[P1]','Order','2021-10-09 08:56:00'),
(12,'Receiving Entry: Reference No.:[3547478238uyhguy], Item:[Rice], Category:[Goods], Type:[], Quantity:[70.00], Unit:[sck]','Stock','2021-10-11 18:30:00'),
(13,'Successful Login: Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-15 18:33:00'),
(12,'Successful Login: Name: [George Miller], Role: [Encoder]','Logins','2021-10-15 18:35:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-19 16:22:00'),
(12,'Receiving Entry: Reference No.:[654712234], Item:[Rice], Category:[Goods], Type:[], Quantity:[30.00], Unit:[pc]','Stock','2021-10-19 16:22:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-19 16:22:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-20 13:51:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-21 10:24:00'),
(12,'Receiving Entry: Reference No.:[34123451], Item:[Rice], Category:[Goods], Type:[], Quantity:[30.00], Unit:[pc]','Stock','2021-10-21 10:25:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-21 10:25:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-21 10:54:00'),
(12,'Receiving Entry: Reference No.:[64536547678], Item:[Rice], Category:[Goods], Type:[], Quantity:[20.00], Unit:[sck]','Stock','2021-10-21 10:54:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-21 10:54:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-24 13:23:00'),
(12,'Receiving Entry: Reference No.:[3435657654], Item:[Arowana], Category:[Feeds], Type:[SS02], Quantity:[40.00], Unit:[Kg/s]','Stock','2021-10-24 13:23:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-24 13:23:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-25 10:54:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-27 14:39:00'),
(12,'New Order Entry: OrderSlip: [64283112349], Customer: [FISHMOKO], Quantity: [600], Pond:[P1]','Order','2021-10-27 14:40:00'),
(12,'New Order Entry: OrderSlip: [73413987312], Customer: [FISHMOKO], Quantity: [700], Pond:[P1]','Order','2021-10-27 14:40:00'),
(12,'New Order Entry: OrderSlip: [35145234522], Customer: [FISHMOKO], Quantity: [5000], Pond:[P1]','Order','2021-10-27 14:40:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-27 14:41:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 14:46:00'),
(13,'Imported Pending Order: Order Slip:[35145234522]','Order','2021-10-27 14:47:00'),
(13,'Imported Pending Order: Order Slip:[35145234522]','Order','2021-10-27 14:47:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 16:10:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 16:12:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 16:16:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 16:17:00'),
(13,'Imported Pending Order: Order Slip:[64283112349]','Order','2021-10-27 16:17:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-10-27 16:20:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 10:07:00'),
(12,'Receiving Entry: Reference No.:[823421873], Item:[Oversea], Category:[Feeds], Type:[SS01], Quantity:[500.00], Unit:[Kg/s]','Stock','2021-10-31 10:07:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-31 10:07:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 10:08:00'),
(12,'Stock Withdrew: Reference No.:[2364781684], Item: [Arowana], Category: [Feeds], Type:[SS02], Quantity:[100], Unit:[Kg/s]','Stock','2021-10-31 10:09:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-31 10:09:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 10:15:00'),
(12,'Stock Withdrew: Reference No.:[2364781684], Item: [Arowana], Category: [Feeds], Type:[SS02], Quantity:[50], Unit:[Kg/s]','Stock','2021-10-31 10:15:00'),
(12,'Stock Withdrew: Reference No.:[2364781684], Item: [Arowana], Category: [Feeds], Type:[SS02], Quantity:[50], Unit:[Kg/s]','Stock','2021-10-31 10:17:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-31 10:17:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 10:26:00'),
(12,'Stock Withdrew: Reference No.:[2364781684], Item: [Arowana], Category: [Feeds], Type:[SS02], Quantity:[10], Unit:[Kg/s]','Stock','2021-10-31 10:26:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-31 10:27:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 18:22:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 18:24:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 18:25:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 20:16:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-10-31 20:17:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-10-31 20:17:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-01 13:25:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-11-01 13:48:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-11-01 15:15:00'),
(13,'Added Sales Price: Price Code:[PRWN01], Value:[249] ','Initialization','2021-11-01 15:16:00'),
(13,'Assigned Pricing: Customer:[Derick Fajardo], Price Code:[PRWN01]','Initialization','2021-11-01 15:17:00'),
(13,'Assigned Pricing: Customer:[test1], Price Code:[XD123]','Initialization','2021-11-01 15:17:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-01 15:21:00'),
(12,'New Order Entry: OrderSlip: [23177095478], Customer: [Derick Fajardo], Quantity: [23], Pond:[P5]','Order','2021-11-01 15:22:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-01 15:23:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-11-01 15:23:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-01 15:38:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-01 15:38:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 09:25:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 09:26:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 09:28:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-02 09:28:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 09:28:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-02 09:29:00'),
(13,'Successfully Logged In: Full Name: [Christine Reyes], Role: [Cashier]','Logins','2021-11-02 09:29:00'),
(13,'Imported Pending Order: Order Slip:[23177095478]','Order','2021-11-02 09:29:00'),
(13,'Confirmed Sales Order: OrderSlip: [23177095478], Customer: [Derick Fajardo], Quantity: [] Total Sale:[5727]','Sales','2021-11-02 09:30:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 09:31:00'),
(12,'Confirmed Delivery: OrderSlip: [23177095478], Customer: [23.00], Quantity: [0.00], Total Sale:[System.Drawing.Bitmap]','Order','2021-11-02 09:31:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-02 09:31:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 10:03:00'),
(12,'[George Miller] Successfully Logged out from the system.','Logins','2021-11-02 10:04:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 10:19:00'),
(12,'Successfully Logged In: Full Name: [George Miller], Role: [Encoder]','Logins','2021-11-02 20:58:00');
/*!40000 ALTER TABLE `tbl_logs` ENABLE KEYS */;

-- 
-- Definition of tbl_order
-- 

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderSlip` bigint DEFAULT NULL,
  `Customer_Id` int DEFAULT NULL,
  `Pond_Id` int DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `ABW` decimal(18,2) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `Remarks` varchar(250) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DeliveryStatus` varchar(50) DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `Employee_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `Pond_Id` (`Pond_Id`),
  KEY `Employee_Id` (`Employee_Id`),
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `tbl_customer` (`Id`),
  CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`Pond_Id`) REFERENCES `tbl_pond` (`Id`),
  CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`Employee_Id`) REFERENCES `tbl_employee` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_order
-- 

/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order`(`Id`,`OrderSlip`,`Customer_Id`,`Pond_Id`,`Quantity`,`ABW`,`EntryDate`,`Remarks`,`Status`,`DeliveryStatus`,`DeliveryDate`,`Employee_Id`) VALUES
(10,62875693124,3,1,500.00,0.00,NULL,NULL,'Pending',NULL,NULL,NULL),
(11,23177095478,11,5,23.00,0.00,NULL,NULL,'Fulfilled','Finished','2021-11-02 09:30:00',NULL);
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;

-- 
-- Definition of tbl_sales
-- 

DROP TABLE IF EXISTS `tbl_sales`;
CREATE TABLE IF NOT EXISTS `tbl_sales` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EntryDate` date DEFAULT NULL,
  `TotalSale` decimal(18,2) DEFAULT NULL,
  `Order_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Order_Id` (`Order_Id`),
  CONSTRAINT `tbl_sales_ibfk_1` FOREIGN KEY (`Order_Id`) REFERENCES `tbl_order` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_sales
-- 

/*!40000 ALTER TABLE `tbl_sales` DISABLE KEYS */;
INSERT INTO `tbl_sales`(`Id`,`EntryDate`,`TotalSale`,`Order_Id`) VALUES
(5,'2021-11-02 00:00:00',5727.00,11);
/*!40000 ALTER TABLE `tbl_sales` ENABLE KEYS */;

-- 
-- Definition of tbl_source
-- 

DROP TABLE IF EXISTS `tbl_source`;
CREATE TABLE IF NOT EXISTS `tbl_source` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_source
-- 

/*!40000 ALTER TABLE `tbl_source` DISABLE KEYS */;
INSERT INTO `tbl_source`(`Id`,`Name`) VALUES
(6,'Brgy. Bawing Prawn Farm Hatchery'),
(7,'Brgy. Tambler Prawn Farm Hatchery');
/*!40000 ALTER TABLE `tbl_source` ENABLE KEYS */;

-- 
-- Definition of tbl_stock
-- 

DROP TABLE IF EXISTS `tbl_stock`;
CREATE TABLE IF NOT EXISTS `tbl_stock` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReferenceNumber` varchar(100) DEFAULT NULL,
  `Item_Id` int DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `RestockPoint` decimal(18,2) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Unit_Id` int DEFAULT NULL,
  `EntryDate` date DEFAULT NULL,
  `Employee_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Unit_Id` (`Unit_Id`),
  KEY `Employee_Id` (`Employee_Id`),
  KEY `tbl_stock_ibfk_1` (`Item_Id`),
  CONSTRAINT `tbl_stock_ibfk_1` FOREIGN KEY (`Item_Id`) REFERENCES `tbl_item` (`Id`),
  CONSTRAINT `tbl_stock_ibfk_2` FOREIGN KEY (`Unit_Id`) REFERENCES `tbl_unit` (`Id`),
  CONSTRAINT `tbl_stock_ibfk_3` FOREIGN KEY (`Employee_Id`) REFERENCES `tbl_employee` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_stock
-- 

/*!40000 ALTER TABLE `tbl_stock` DISABLE KEYS */;
INSERT INTO `tbl_stock`(`Id`,`ReferenceNumber`,`Item_Id`,`Quantity`,`RestockPoint`,`Status`,`Unit_Id`,`EntryDate`,`Employee_Id`) VALUES
(22,'64536547678',4,50.00,2.00,'Available',6,NULL,NULL),
(23,'2364781684',1,1.00,100.00,'Available',1,'2021-10-13 00:00:00',NULL),
(24,'1234567834',4,20.00,NULL,'Added To Existing',6,'2021-10-15 00:00:00',NULL),
(25,'654712234',4,30.00,NULL,'Added To Existing',4,'2021-10-19 00:00:00',NULL),
(27,'34123451',4,30.00,NULL,'Added To Existing',4,'2021-10-21 00:00:00',NULL),
(29,'64536547678',4,20.00,NULL,'Added To Existing',6,'2021-10-21 00:00:00',NULL),
(30,'3435657654',1,40.00,NULL,'Added To Existing',1,'2021-10-24 00:00:00',NULL),
(33,'823421873',10,500.00,NULL,'Received',1,'2021-10-31 00:00:00',NULL),
(34,'2364781684',1,1000.00,NULL,'Added To Existing',1,'2021-10-28 00:00:00',NULL),
(35,NULL,4,200.00,NULL,'Pending',6,NULL,NULL);
/*!40000 ALTER TABLE `tbl_stock` ENABLE KEYS */;

-- 
-- Definition of tbl_types
-- 

DROP TABLE IF EXISTS `tbl_types`;
CREATE TABLE IF NOT EXISTS `tbl_types` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(15) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_types
-- 

/*!40000 ALTER TABLE `tbl_types` DISABLE KEYS */;
INSERT INTO `tbl_types`(`Id`,`Code`,`Description`) VALUES
(1,'SS01','Fry Feeds'),
(2,'SS02','N/A');
/*!40000 ALTER TABLE `tbl_types` ENABLE KEYS */;

-- 
-- Definition of tbl_unit
-- 

DROP TABLE IF EXISTS `tbl_unit`;
CREATE TABLE IF NOT EXISTS `tbl_unit` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Category_Id` int DEFAULT NULL,
  `Expression` varchar(15) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Category_Id` (`Category_Id`),
  CONSTRAINT `tbl_unit_ibfk_1` FOREIGN KEY (`Category_Id`) REFERENCES `tbl_category` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_unit
-- 

/*!40000 ALTER TABLE `tbl_unit` DISABLE KEYS */;
INSERT INTO `tbl_unit`(`Id`,`Category_Id`,`Expression`,`Description`) VALUES
(1,1,'Kg/s','Kilogram'),
(2,1,'G/s','Gram'),
(3,1,'Mg/s','Milligram'),
(4,2,'Pc/s','Piece'),
(5,2,'Rl/s','Roll'),
(6,2,'Sck/s','Sack'),
(7,2,'Gal/s','Gallon'),
(8,2,'L/s','Liter');
/*!40000 ALTER TABLE `tbl_unit` ENABLE KEYS */;

-- 
-- Definition of tbl_weeklystatus
-- 

DROP TABLE IF EXISTS `tbl_weeklystatus`;
CREATE TABLE IF NOT EXISTS `tbl_weeklystatus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Production_Id` int DEFAULT NULL,
  `Sampling_Date` date DEFAULT NULL,
  `AveBodyWeight_Present` decimal(18,2) DEFAULT NULL,
  `Weekly_IncreaseDecrease` decimal(18,2) DEFAULT NULL,
  `Growth_Per_Day` decimal(18,2) DEFAULT NULL,
  `Feeds_Used_Day` decimal(18,2) DEFAULT NULL,
  `Feeds_Used_Week` decimal(18,2) DEFAULT NULL,
  `Feeds_Used_Cummulative` decimal(18,2) DEFAULT NULL,
  `PWAO_Unit` varchar(45) DEFAULT NULL,
  `PWAO_Hours` varchar(45) DEFAULT NULL,
  `Feedtypes_Id` int DEFAULT NULL,
  `Item_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=armscii8;

-- 
-- Dumping data for table tbl_weeklystatus
-- 

/*!40000 ALTER TABLE `tbl_weeklystatus` DISABLE KEYS */;
INSERT INTO `tbl_weeklystatus`(`Id`,`Production_Id`,`Sampling_Date`,`AveBodyWeight_Present`,`Weekly_IncreaseDecrease`,`Growth_Per_Day`,`Feeds_Used_Day`,`Feeds_Used_Week`,`Feeds_Used_Cummulative`,`PWAO_Unit`,`PWAO_Hours`,`Feedtypes_Id`,`Item_Id`) VALUES
(1,5,'1753-01-01 00:00:00',2.00,2.00,2.00,2.00,2.00,2.00,NULL,NULL,1,1),
(2,8,'1753-01-01 00:00:00',0.00,1.00,1.00,1.00,1.00,1.00,NULL,NULL,1,1),
(3,9,'1753-01-01 00:00:00',0.00,6.00,6.00,6.00,6.00,6.00,NULL,NULL,1,1);
/*!40000 ALTER TABLE `tbl_weeklystatus` ENABLE KEYS */;

-- 
-- Definition of tbl_withdraw
-- 

DROP TABLE IF EXISTS `tbl_withdraw`;
CREATE TABLE IF NOT EXISTS `tbl_withdraw` (
  `Pond_Id` int DEFAULT NULL,
  `Amount` decimal(18,2) DEFAULT NULL,
  `Unit_Id` int DEFAULT NULL,
  `Entry_Date` date DEFAULT NULL,
  `Item_Id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table tbl_withdraw
-- 

/*!40000 ALTER TABLE `tbl_withdraw` DISABLE KEYS */;
INSERT INTO `tbl_withdraw`(`Pond_Id`,`Amount`,`Unit_Id`,`Entry_Date`,`Item_Id`) VALUES
(10,50.00,1,'2021-10-31 00:00:00',1),
(10,10.00,1,'2021-10-31 00:00:00',1);
/*!40000 ALTER TABLE `tbl_withdraw` ENABLE KEYS */;

-- 
-- Dumping functions
-- 

DROP FUNCTION IF EXISTS `ConvertToExisting`;
DELIMITER |
CREATE FUNCTION `ConvertToExisting`(_item_id int, _entryUnit_Id varchar(10), _quantity decimal(18,2)) RETURNS decimal(18,2)
    DETERMINISTIC
BEGIN
DECLARE _convertedQuantity decimal(18, 2);
DECLARE ExistU varchar(10);
DECLARE NewU varchar(10);
SELECT 
    unit.Expression INTO ExistU
FROM
    rd_salesinventorydb.tbl_stock AS stock
        LEFT JOIN
    rd_salesinventorydb.tbl_unit AS unit ON stock.Unit_Id = unit.Id
WHERE
    stock.Item_Id LIKE _item_id
        AND stock.Status LIKE 'Available';
SELECT 
    Expression INTO NewU
FROM
    rd_salesinventorydb.tbl_unit
WHERE
    Id = _entryUnit_Id;

IF ExistU = 'Kg' AND NewU = 'G' THEN
	SET _convertedQuantity = (_quantity *0.001);
ELSEIF ExistU = 'Kg' AND NewU = 'Mg' THEN
	SET _convertedQuantity = (_quantity *0.000001);
ELSEIF ExistU = 'Mg' AND NewU = 'Kg' THEN
	SET _convertedQuantity = (_quantity*1000000);
ELSEIF ExistU = 'Mg' AND NewU = 'G' THEN
	SET _convertedQuantity = (_quantity*1000);
ELSEIF ExistU = 'G' AND NewU = 'Kg' THEN
	SET _convertedQuantity = (_quantity*1000);
ELSEIF ExistU = 'G' AND NewU = 'Mg' THEN
	SET _convertedQuantity = (_quantity/1000);
ELSE
	SET _convertedQuantity = _quantity;

END IF;
RETURN _convertedQuantity;
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `RD_Fullname`;
DELIMITER |
CREATE FUNCTION `RD_Fullname`(firstName varchar(50), lastName varchar(50)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(firstName,' ',lastName);
END |
DELIMITER ;

-- 
-- Dumping procedures
-- 

DROP PROCEDURE IF EXISTS `RD_Category_GetById`;
DELIMITER |
CREATE PROCEDURE `RD_Category_GetById`(in _id int)
BEGIN
	SELECT 
		Id,
        Name
        FROM
			rd_salesinventorydb.tbl_category
		WHERE
			_Id = _id;            
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Category_GetCategoryByStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Category_GetCategoryByStatus`()
BEGIN
	SELECT 
		category.Id AS Id,
		category.Name AS Name
        FROM 
			rd_salesinventorydb.tbl_category AS category 
			LEFT JOIN
				rd_salesinventorydb.tbl_item AS item
					ON 
						item.Category_Id = category.Id
			LEFT JOIN 
				rd_salesinventorydb.tbl_stock AS stock
					ON 
						stock.Item_Id = item.Id
        WHERE 
			stock.Status 
				LIKE 
					'Available'
		AND
			stock.Quantity 
				>=
					stock.RestockPoint
        GROUP BY 
			category.name;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Category_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Category_GetList`()
BEGIN
SET @rownr=0;
	SELECT 
		Id,
		@rownr:=@rownr+1 AS rowId,
        Name
		FROM
			rd_salesinventorydb.tbl_category
		ORDER BY
			Id ASC;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Customer_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Customer_DeleteById`(IN _id int)
BEGIN
	DELETE FROM 
		rd_salesinventorydb.tbl_customer
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Customer_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Customer_GetList`()
BEGIN
SET @rownr=0;
	SELECT 
		customer.Id,
        @rownr:=@rownr+1 AS rowId,
        customer.FullName,
        price.Code,
        customer.ContactNumber,
        customer.FullAddress
	FROM
		rd_salesinventorydb.tbl_customer AS customer
		LEFT JOIN
			rd_salesinventorydb.tbl_price AS price
				ON
					customer.Price_Id = price.Id;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Customer_GetName`;
DELIMITER |
CREATE PROCEDURE `RD_Customer_GetName`()
BEGIN
	SELECT
		Id,
        FullName
			FROM
				rd_salesinventorydb.tbl_customer;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Customer_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Customer_InsertUpdate`(IN _id int,
												_price_Id int,
                                                _fullName varchar(50),
                                                _fullAddress varchar(100),
                                                _contactNumber varchar(20))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_customer WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_customer
			SET
				Price_Id = _price_Id,
                FullName = _fullName,
                FullAddress = _fullAddress,
                ContactNumber = _contactNumber
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_customer(
				Price_Id,
                FullName,
                FullAddress,
                ContactNumber
                )VALUES(
                _price_Id,
                _fullName,
                _fullAddress,
                _contactNumber
                );
       END IF;         
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Customer_UpdateByAssign`;
DELIMITER |
CREATE PROCEDURE `RD_Customer_UpdateByAssign`(IN _fullName varchar(50), _price_Id int)
BEGIN
	UPDATE
		rd_salesinventorydb.tbl_customer
	SET
		Price_Id = _price_Id
	WHERE
		FullName = _fullName;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Dashboard_GetRowCounts`;
DELIMITER |
CREATE PROCEDURE `RD_Dashboard_GetRowCounts`()
BEGIN
	SELECT 
		(SELECT COUNT(*) FROM rd_salesinventorydb.tbl_stock WHERE Quantity > RestockPoint) AS AVAILABLE_STOCK_COUNT,
        (SELECT SUM(TotalSale) FROM rd_salesinventorydb.tbl_sales) AS TOTAL_SALES,
        (SELECT COUNT(*) FROM rd_salesinventorydb.tbl_order WHERE Status = 'Pending') AS PENDING_ORDER_COUNT,
        (SELECT COUNT(*) FROM rd_salesinventorydb.tbl_stock WHERE Quantity <= RestockPoint) AS CRITICAL_STOCK_COUNT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_DeleteById`(IN _id int)
BEGIN
	DELETE FROM
     rd_salesinventorydb.tbl_employee
		WHERE
			Id =_id;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_GetDetailForLogin`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_GetDetailForLogin`(_userName varchar(50))
BEGIN
	SELECT
		employee.Id,
        RD_Fullname(employee.FirstName, employee.LastName),
        employee.Password,
        roles.Title,
        employee.ImagePath,
        employee.UserName
			FROM
				rd_salesinventorydb.tbl_employee AS employee
			LEFT JOIN
				rd_salesinventorydb.tbl_role AS roles
					ON
						employee.Role_Id = roles.Id
			WHERE
				employee.UserName = _userName
			AND
				employee.Status = 'Active';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_GetListByStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_GetListByStatus`(IN _status varchar(50))
BEGIN
SET @rownr=0;
	SELECT 
		employee.Id, 
	    @rownr:=@rownr+1 AS rowId,
		RD_Fullname(employee.FirstName, employee.LastName),
		employee.ContactNumber,
		role.Title,
		employee.UserName, 
		employee.Password, 
		employee.Status,
		employee.ImagePath
		FROM
			rd_salesinventorydb.tbl_employee AS employee 
			LEFT JOIN
				rd_salesinventorydb.tbl_role AS role
					ON
						employee.Role_Id = role.Id
		WHERE
			employee.Status 
				LIKE
					_status;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_GetNames`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_GetNames`()
BEGIN
	SELECT
		employee.Id,
        RD_Fullname(employee.FirstName, employee.LastName) AS Fullnames
        FROM
			rd_salesinventorydb.tbl_employee AS employee
				LEFT JOIN
					rd_salesinventorydb.tbl_role AS roles
						ON
							employee.Role_Id = roles.Id
		WHERE
			roles.Title
				LIKE
					'Encoder'
		OR
			roles.Title
				LIKE
					'Cashier';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_GetStatusList`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_GetStatusList`()
BEGIN
	SET @rownr=0;
		SELECT
			@rownr:=@rownr+1 AS Id,
				Status
					FROM
						rd_salesinventorydb.tbl_employee
					GROUP BY
						Status;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Employee_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Employee_InsertUpdate`(IN 
												_id int,
                                                _firstName varchar(50),
                                                _lastName varchar(50),
                                                _contactNumber varchar(15),
                                                _userName varchar(50),
                                                _password varchar(50),
                                                _role_Id int,
                                                _status varchar(50),
                                                _imagePath varchar(250))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_employee WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_employee
			SET
				FirstName = _firstName,
                LastName = _lastName,
                ContactNumber = _contactNumber,
                UserName = _userName,
                Password = _password,
                Role_Id = _role_Id,
                Status = _status,
                ImagePath = _imagePath
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_employee(
            	FirstName,
                LastName,
                ContactNumber,
                UserName,
                Password,
                Role_Id,
                Status,
                ImagePath
                )VALUES(
                _firstName,
                _lastName,
                _contactNumber,
                _userName,
                _password,
                _role_Id,
                _status,
                _imagePath
                );
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ExpenseType_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_ExpenseType_DeleteById`(IN _id int)
BEGIN
	DELETE FROM 
		rd_salesinventorydb.tbl_expensetype
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ExpenseType_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_ExpenseType_GetList`()
BEGIN
SET @rownr=0;
	SELECT 
		Id,
		@rownr:=@rownr+1 AS rowId,
        Name,
        Description
			FROM 
				rd_salesinventorydb.tbl_expensetype;
        
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ExpenseType_GetName`;
DELIMITER |
CREATE PROCEDURE `RD_ExpenseType_GetName`()
BEGIN
	SELECT
		Id,
        Name
			FROM
				rd_salesinventorydb.tbl_expensetype;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ExpenseType_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_ExpenseType_InsertUpdate`(IN _id int,
												   _name varchar(100),
                                                   _description varchar(250))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_expensetype WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_expensetype
			SET
				Name = _name,
                Description = _description
			WHERE 
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_expensetype(
				Name,
                Description
                )VALUES(
                _name,
                _description
                );
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Expense_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Expense_DeleteById`(IN _id int)
BEGIN
	DELETE 
		FROM 
			rd_salesinventorydb.tbl_expense 
		WHERE Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Expense_GetChartData`;
DELIMITER |
CREATE PROCEDURE `RD_Expense_GetChartData`(in _year int, _month int)
BEGIN
	SELECT 
    SUM(Amount) as Total 
	FROM rd_salesinventorydb.tbl_expense 
    WHERE 
    YEAR(EntryDate) = _year
    AND 
    MONTH(EntryDate) = _month
	GROUP BY 
		YEAR(EntryDate),
		month(EntryDate);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Expense_GetListByDate`;
DELIMITER |
CREATE PROCEDURE `RD_Expense_GetListByDate`(IN _fromDate date, _toDate date)
BEGIN
SET @rownr=0;
	SELECT 
		expense.Id,
        @rownr:=@rownr+1 AS rowId,
		expense.Amount, 
		etype.Name, 
		expense.EntryDate, 
		expense.Remarks 
		FROM 
			rd_salesinventorydb.tbl_expense AS expense 
				LEFT JOIN 
					rd_salesinventorydb.tbl_ExpenseType AS etype
						ON
							expense.ExpenseType_Id = etype.Id
		WHERE 
			expense.EntryDate 
				>=
					DATE(_fromDate) 
		AND 
			expense.EntryDate 
				<= 
					DATE(_toDate);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Expense_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Expense_InsertUpdate`(IN _id int,
											   _amount decimal(18,2),
                                               _expenseType_Id int,
                                               _entryDate date,
                                               _remarks varchar(250))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_Expense WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_expense
			SET
				Amount = _amount,
                ExpenseType_Id = _expenseType_Id,
                EntryDate = _entryDate,
                Remarks = _remarks
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_expense(
				Amount,
                ExpenseType_Id,
                EntryDate,
                Remarks
                )VALUES(
                _amount,
                _expenseType_Id,
                _entryDate,
                _remarks
                );
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Item_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Item_DeleteById`(in _id int)
BEGIN
	DELETE FROM rd_salesinventorydb.tbl_item
	WHERE
		Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Item_GetItemNameByCategory`;
DELIMITER |
CREATE PROCEDURE `RD_Item_GetItemNameByCategory`(IN _category varchar(50))
BEGIN
	SELECT 
		item.Id,
        item.Name
		FROM
			rd_salesinventorydb.tbl_item AS item
		LEFT JOIN
			rd_salesinventorydb.tbl_category AS category
            ON
				item.Category_Id = category.Id
		WHERE 
			category.Name
				=
					_category
		GROUP BY
			item.Name;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Item_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Item_GetList`()
BEGIN
SET @rownr=0;
	SELECT
		item.Id,
		@rownr:=@rownr+1 AS rowId,
		item.Name AS Itemname,
        category.Name AS Category,
        types.Code
	FROM
		rd_salesinventorydb.tbl_item AS item
		LEFT JOIN
			rd_salesinventorydb.tbl_category AS category
				ON
					item.Category_Id = category.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_types AS types
				ON
					item.Type_Id  = types.Id
	ORDER BY
			item.Name;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Item_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Item_InsertUpdate`(in _name varchar(50), _category_Id int, _type_Id int)
BEGIN
	IF EXISTS(SELECT _name, _category_Id, _type_Id FROM rd_salesinventorydb.tbl_item) 
		THEN
			UPDATE 
				rd_salesinventorydb.tbl_item
			SET
				Name = _name,
                Category_Id = _category_Id,
                Type_Id = _type_Id
			WHERE
				Name = _name
			AND
                Categeory_Id = _category_Id
			AND
                Type_Id = _type_Id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_item(
                Name,
                Category_Id,
                Type_Id
                )VALUES(
                _name,
                _category_Id,
                _type_Id
                );
   END IF; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Item_InsertUpdateById`;
DELIMITER |
CREATE PROCEDURE `RD_Item_InsertUpdateById`(in _id int, _name varchar(50), _category_Id int, _type_Id int)
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_item WHERE Id = _id) 
		THEN
			UPDATE 
				rd_salesinventorydb.tbl_item
			SET
				Name = _name,
                Category_Id = _category_Id,
                Type_Id = _type_Id
			WHERE
                 Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_item(
                Name,
                Category_Id,
                Type_Id
                )VALUES(
                _name,
                _category_Id,
                _type_Id
                );
   END IF; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Logs_GetListByDateType`;
DELIMITER |
CREATE PROCEDURE `RD_Logs_GetListByDateType`(IN _fromDate date, _toDate date, _type varchar(50), _employee_Id int)
BEGIN
SET @rownr=0;
	SELECT
		employee.Id,
		@rownr:=@rownr+1 AS rowId,
        RD_Fullname(employee.FirstName, employee.LastName) AS Fullname,
        roles.Title,
        log.Type,
        log.Activity,
        log.Date
			FROM
				rd_salesinventorydb.tbl_logs AS log
					LEFT JOIN
						rd_salesinventorydb.tbl_employee as employee
							ON
								log.Employee_Id = employee.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_role as roles
							ON
								employee.Role_Id = roles.Id
			WHERE
				DATE(log.Date) 
					>=
						DATE(_fromDate) 
			AND 
				DATE(log.Date)
					<= 
						DATE(_toDate)
			AND
				log.Type
					LIKE
						CONCAT('%',_type,'%')
			AND
				employee.Id
					LIKE
						_employee_Id;
						

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Logs_GetTypeList`;
DELIMITER |
CREATE PROCEDURE `RD_Logs_GetTypeList`()
BEGIN
	SET @rownr=0;
		SELECT
			@rownr:=@rownr+1 AS Id,
				Type
					FROM
						rd_salesinventorydb.tbl_logs
					GROUP BY
						Type;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Logs_InsertActivity`;
DELIMITER |
CREATE PROCEDURE `RD_Logs_InsertActivity`(IN _employee_Id int,  _activity varchar(250), _type varchar(50), _date datetime)
BEGIN
	INSERT INTO
		rd_salesinventorydb.tbl_logs(
			Employee_Id,
            Activity,
            Type,
            Date
            )VALUES(
            _employee_Id,
            _activity,
            _type,
            _date
            );
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_CancelDeliveryStatusById`;
DELIMITER |
CREATE PROCEDURE `RD_Order_CancelDeliveryStatusById`(IN _id int)
BEGIN
	UPDATE 
		rd_salesinventorydb.tbl_order
			SET
				DeliveryStatus = 'Cancelled',
				Status = 'Void'
	WHERE
		Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Order_DeleteById`(IN _id int)
BEGIN
	DELETE FROM 
		rd_salesinventorydb.tbl_order
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetByOrderSlip`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetByOrderSlip`(IN _orderSlip bigint)
BEGIN
	SELECT
		orders.Id,
        orders.OrderSlip,
        customer.FullName,
        pond.Code,
        orders.Quantity,
        orders.ABW,
        sale.TotalSale
			FROM
				rd_salesinventorydb.tbl_order AS orders
					LEFT JOIN
						rd_salesinventorydb.tbl_customer AS customer
							ON
								orders.Customer_Id = customer.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_sales AS sale
							ON
								sale.Order_Id = orders.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_pond AS pond
							ON
								orders.Pond_Id = pond.Id
			WHERE
				orders.Status
					LIKE
						'Fulfilled'
			AND
				orders.DeliveryStatus
					LIKE
						'Finished'
			AND
				orders.OrderSlip
					LIKE
						_orderSlip;
		
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetDeliveryStatusList`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetDeliveryStatusList`()
BEGIN
SET @rownr=0;
	SELECT 
		@rownr:=@rownr+1 AS Id,
		DeliveryStatus
			FROM 
				rd_salesinventorydb.tbl_order
                	WHERE DeliveryStatus IS NOT NULL
					GROUP BY DeliveryStatus;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetImportList`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetImportList`()
BEGIN
SET @rownr=0;
	SELECT
		orders.Id,
		@rownr:=@rownr+1 AS rowId,
		orders.OrderSlip,
        customer.FullName,
        price.Value,
        pond.Code,
        orders.Quantity,
        orders.ABW
			FROM 
				rd_salesinventorydb.tbl_order AS orders
					LEFT JOIN
						rd_salesinventorydb.tbl_customer AS customer
							ON
								orders.Customer_Id = customer.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_price AS price
							ON
								customer.Price_Id = price.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_pond AS pond
							ON
								orders.Pond_Id = pond.Id
			WHERE
				orders.Status 
					LIKE
						'Pending';
        
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetListByDeliveryStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetListByDeliveryStatus`(IN _deliveryStatus varchar(50), _search varchar(50))
BEGIN
SET @rownr=0;
	SELECT 
		orders.Id,
        @rownr:=@rownr+1 AS rowId,
		orders.OrderSlip,
		customer.FullName,
		orders.Quantity,
        orders.ABW,
		sales.EntryDate, 
		sales.TotalSale
		FROM 
			rd_salesinventorydb.tbl_order AS orders
			LEFT JOIN
				rd_salesinventorydb.tbl_customer AS customer
					ON
						orders.Customer_Id = customer.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_sales AS sales
					ON
						sales.Order_Id = orders.Id
		WHERE 
        (
			orders.DeliveryStatus 
				LIKE 
					_deliveryStatus 
		AND 
			(orders.Status 
				LIKE 
					'Fulfilled'
		OR
			orders.Status 
				LIKE 
					'Processing')
		AND
        ( customer.FullName
				LIKE 
					CONCAT('%',_search,'%')
			OR
		orders.OrderSlip
			LIKE
				CONCAT('%',_search,'%')
					OR
		orders.ABW
			LIKE
				CONCAT('%',_search,'%')
					OR
		orders.Quantity
			LIKE
				CONCAT('%',_search,'%')
        ));
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetListBySearchAndStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetListBySearchAndStatus`( IN _status varchar(50), _search varchar(100))
BEGIN
SET @rownr=0;
	SELECT
		orders.Id,
		@rownr:=@rownr+1 AS rowId,
        orders.OrderSlip,
        customer.FullName,
        price.Value,
        pond.Code,
        orders.Quantity,
        orders.ABW
			FROM 
				rd_salesinventorydb.tbl_order AS orders
					LEFT JOIN
						rd_salesinventorydb.tbl_customer AS customer
							ON
								orders.Customer_Id = customer.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_price AS price
							ON
								customer.Price_Id = price.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_pond AS pond
							ON
								orders.Pond_Id = pond.Id
			WHERE
				(orders.Status 
								LIKE
								CONCAT('%',_status,'%')
                                AND
					(orders.OrderSlip
								LIKE
							CONCAT('%',_search,'%')
						OR
                        customer.FullName
							LIKE
						CONCAT('%',_search,'%')
                        OR
						pond.Code
							LIKE
						CONCAT('%',_search,'%')
                        OR
                        orders.ABW
							LIKE
						CONCAT('%',_search,'%')));
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetPendingList`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetPendingList`(IN _search varchar(50))
BEGIN
SET @rownr=0;
	SELECT
		orders.Id,
		@rownr:=@rownr+1 AS rowId,
		orders.OrderSlip,
        customer.FullName,
        pond.Code,
        orders.Quantity,
        orders.ABW,
        orders.Status
			FROM 
				rd_salesinventorydb.tbl_order AS orders
					LEFT JOIN
						rd_salesinventorydb.tbl_customer AS customer
							ON
								orders.Customer_Id = customer.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_price AS price
							ON
								customer.Price_Id = price.Id
					LEFT JOIN
						rd_salesinventorydb.tbl_pond AS pond
							ON
								orders.Pond_Id = pond.Id
			WHERE
				(orders.Status 
					LIKE
						'Pending'
			AND
				(orders.OrderSlip
					LIKE
						CONCAT('%',_search,'%')
				OR
                customer.FullName
					LIKE
					CONCAT('%',_search,'%')
				OR
				pond.Code
					LIKE
						CONCAT('%',_search,'%')
				OR
				orders.Quantity
					LIKE
						CONCAT('%',_search,'%')
				));
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_GetStatusList`;
DELIMITER |
CREATE PROCEDURE `RD_Order_GetStatusList`()
BEGIN
SET @rownr=0;
	SELECT
		@rownr:=@rownr+1 AS Id,
        Status
			FROM
				rd_salesinventorydb.tbl_order
			GROUP BY status;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_InsertOrder`;
DELIMITER |
CREATE PROCEDURE `RD_Order_InsertOrder`(IN _orderSlip bigint,
											_pond_Id int,
                                            _customer_Id int,
                                            _quantity decimal(18,2),
                                            _abw decimal(18,2),
                                            _status varchar(50))
BEGIN
	INSERT INTO
		rd_salesinventorydb.tbl_order(
			OrderSlip,
            Pond_Id,
            Customer_Id,
            Quantity,
            ABW,
            Status
            )VALUES(
            _orderSlip,
			_pond_Id,
            _customer_Id,
			_quantity,
			_abw,
            _status
            );
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_UpdateAfterSales`;
DELIMITER |
CREATE PROCEDURE `RD_Order_UpdateAfterSales`(IN _id int,
												 _orderSlip bigint,
												_customer_Id int, 
                                                _pond_Id int, 
                                                _quantity decimal(18, 2), 
                                                _abw decimal(18, 2), 
                                                _deliveryStatus varchar(50), 
                                                _deliveryDate datetime, 
                                                _status varchar(50))
BEGIN
	UPDATE
		rd_salesinventorydb.tbl_order 
			SET
				OrderSlip = _orderSlip,
                Customer_Id = _customer_Id,
                Pond_Id = _pond_Id,
                Quantity = _quantity,
                ABW = _abw,
                Status = _status,
                DeliveryStatus = _deliveryStatus,
                DeliveryDate = _deliveryDate
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_UpdateDeleteByStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Order_UpdateDeleteByStatus`(IN _id int, _status varchar(50))
BEGIN
	IF(_status LIKE 'Fulfilled' OR _status LIKE 'Pending' OR _status LIKE 'Processing') THEN
	UPDATE
		rd_salesinventorydb.tbl_order
	SET
		Status = 'Void'
	WHERE
		Id = _id;
	ELSE IF(_status LIKE 'Void')
		THEN
			DELETE FROM
				rd_salesinventorydb.tbl_order
					WHERE Id = _id;
	END IF;
    END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Order_UpdateFromOngoing`;
DELIMITER |
CREATE PROCEDURE `RD_Order_UpdateFromOngoing`(in _id int)
BEGIN
	UPDATE
		rd_salesinventorydb.tbl_order
	SET
		Status = 'Fulfilled',
        DeliveryStatus = 'Finished'
	WHERE
		Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_DeleteById`(IN _id int)
BEGIN
	DELETE 
		FROM
			rd_salesinventorydb.tbl_pond
		WHERE
			Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_GetCode`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_GetCode`()
BEGIN
	SELECT 
		Id, 
        Code
		FROM
			rd_salesinventorydb.tbl_pond
		ORDER BY
			Code;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_GetCodeListByProduction`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_GetCodeListByProduction`()
BEGIN
	SELECT 
		pond.Id, 
        pond.Code 
			FROM 
				rd_salesinventorydb.tbl_production AS prod 
					LEFT JOIN 
						rd_salesinventorydb.tbl_pond AS pond 
							ON 
								prod.Pond_Id = pond.Id
			GROUP BY
				pond.Id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_GetCodeListBySaleStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_GetCodeListBySaleStatus`()
BEGIN
	SELECT 
		pond.Id, 
        pond.Code 
			FROM 
				rd_salesinventorydb.tbl_production AS prod 
					LEFT JOIN 
						rd_salesinventorydb.tbl_pond AS pond 
							ON 
								prod.Pond_Id = pond.Id 
			WHERE 
				prod.Sale_Status 
					LIKE 
						'Active'
			AND
				prod.Total_Stocked
					> 0;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_GetCodeNotOccupied`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_GetCodeNotOccupied`()
BEGIN
	SELECT
    pond.Id,
	pond.Code
    from
    rd_salesinventorydb.tbl_pond AS pond
    LEFT JOIN
    rd_salesinventorydb.tbl_production AS prod
		ON
			prod.Pond_Id = pond.Id
    WHERE
    NOT
    EXISTS(SELECT Pond_Id from rd_salesinventorydb.tbl_production where Pond_Id = pond.Id);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_GetList`()
BEGIN
SET @rownr=0;
	SELECT
		Id,
		@rownr:=@rownr+1 AS rowId,
        Code,
        Area
		FROM 
			rd_salesinventorydb.tbl_pond
            ORDER BY
				Id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Pond_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Pond_InsertUpdate`(IN _id int, _code varchar(50), _area BIGINT)
BEGIN
	IF EXISTS( SELECT Id FROM rd_salesinventorydb.tbl_pond WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_pond
			SET
				Code = _code,
                Area = _area
			WHERE
				Id = _id;
	ELSE
		INSERT INTO rd_salesinventorydb.tbl_pond(
				Code,
                Area
                )VALUES(
                _code,
                _area
                );
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Price_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Price_DeleteById`(IN _id int)
BEGIN
	DELETE FROM
		rd_salesinventorydb.tbl_price
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Price_GetCode`;
DELIMITER |
CREATE PROCEDURE `RD_Price_GetCode`()
BEGIN
	SELECT
		Id,
		Code
			FROM
				rd_salesinventorydb.tbl_price;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Price_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Price_GetList`()
BEGIN
SET @rownr=0;
	SELECT
		Id,
		@rownr:=@rownr+1 AS rowId,
		Code,
		Value
		FROM
			rd_salesinventorydb.tbl_price;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Price_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Price_InsertUpdate`(IN _id int, _code varchar(50), _value decimal(18, 2))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_price WHERE Id = _id)
		THEN
			UPDATE 
				rd_salesinventorydb.tbl_price
					SET
						Code = _code,
						Value = _value
					WHERE
						Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_price(
				Code,
                Value
                )VALUES(
                _code,
                _value
                );
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ProductionPlan_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_ProductionPlan_InsertUpdate`(IN _id int, _farmName varchar(50), _pond_Id int, _pondPreparationDate varchar(100), _datePrepared date, _dateStocked date, _dateOfHarvest date, _totalStocked bigint, _stockDensity int, _daysOfCulture int, _survivalRate Decimal(18,2), _averageBodyWeight decimal(18,2), _biomass decimal(18,2), _feedsRequired decimal(18,2), _totalFeedsConsumed decimal(18,2), _feedsConsumedRatio decimal(18,2), _sales_Amount int, _frySource_Id int,  _cropNumber int, _status varchar(50), _saleStatus varchar(50))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_production WHERE Id = _id)
    THEN
		UPDATE rd_salesinventorydb.tbl_production
        SET
			Farm_Name = _farmName,
			Pond_Id = _pond_Id,
			Pond_Preparation_Date = _pondPreparationDate,
			Date_Stocked = _dateStocked,
			DateOf_Harvest = _dateOfHarvest,
			Total_Stocked = _totalStocked,
			Stock_Density = _stockDensity,
			DaysOf_Culture = _daysOfCulture,
			Survival_Rate  = _survivalRate,
			AveBodyWeight = _averageBodyWeight,
			Biomass = _biomass,
			Feeds_Required = _feedsRequired,
			Total_Feeds_Consumed = _totalFeedsConsumed,
			Feeds_Consumed_Ratio = _feedsConsumedRatio,
			Sales_Amount  = _sales_Amount,
			FrySource_Id = _frySource_Id,
			Crop_Number = _cropNumber,
			Production_Status = _status,
            Sale_Status = _saleStatus,
            Date_Prepared = _datePrepared
		WHERE
			Id = _id;
            
	ELSE
		INSERT INTO rd_salesinventorydb.tbl_production(
			Pond_Id,
            Farm_Name,
			Pond_Preparation_Date,
			Date_Stocked,
			DateOf_Harvest,
			Total_Stocked,
			Stock_Density,
			DaysOf_Culture,
			Survival_Rate,
			AveBodyWeight,
			Biomass,
			Feeds_Required,
			Total_Feeds_Consumed,
			Feeds_Consumed_Ratio,
			Sales_Amount,
			FrySource_Id,
			Crop_Number,
			Production_Status,
            Sale_Status,
            Date_Prepared
            )VALUES(
            _pond_Id,
            _farmName,
			_pondPreparationDate,
			_dateStocked,
			_dateOfHarvest,
			_totalStocked,
			_stockDensity,
			_daysOfCulture,
			_survivalRate,
			_averageBodyWeight,
			_biomass,
			_feedsRequired,
			_totalFeedsConsumed,
			_feedsConsumedRatio,
			_sales_Amount,
			_frySource_Id,
			_cropNumber,
			_status,
            _saleStatus,
            _datePrepared
            );      
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_ProductionResult_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_ProductionResult_InsertUpdate`(IN _id int, _farmName varchar(50), _pond_Id int, _datePrepared date, _dateStocked date, _dateOfHarvest date, _totalStocked bigint, _stockDensity int, _daysOfCulture int, _survivalRate Decimal(18,2), _averageBodyWeight decimal(18,2), _biomass decimal(18,2), _totalFeedsConsumed decimal(18,2), _feedsConsumedRatio decimal(18,2), _sales_Amount int, _frySource_Id int,  _cropNumber int, _status varchar(50), _saleStatus varchar(50))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_production WHERE Id = _id)
    THEN
		UPDATE rd_salesinventorydb.tbl_production
        SET
			Farm_Name = _farmName,
			Pond_Id = _pond_Id,
			Date_Stocked = _dateStocked,
			DateOf_Harvest = _dateOfHarvest,
			Total_Stocked = _totalStocked,
			Stock_Density = _stockDensity,
			DaysOf_Culture = _daysOfCulture,
			Survival_Rate  = _survivalRate,
			AveBodyWeight = _averageBodyWeight,
			Biomass = _biomass,
			Total_Feeds_Consumed = _totalFeedsConsumed,
			Feeds_Consumed_Ratio = _feedsConsumedRatio,
			Sales_Amount  = _sales_Amount,
			FrySource_Id = _frySource_Id,
			Crop_Number = _cropNumber,
			Production_Status = _status,
            Sale_Status = _saleStatus,
            Date_Prepared = _datePrepared
		WHERE
			Id = _id;
            
	ELSE
		INSERT INTO rd_salesinventorydb.tbl_production(
			Pond_Id,
            Farm_Name,
			Date_Stocked,
			DateOf_Harvest,
			Total_Stocked,
			Stock_Density,
			DaysOf_Culture,
			Survival_Rate,
			AveBodyWeight,
			Biomass,
			Total_Feeds_Consumed,
			Feeds_Consumed_Ratio,
			Sales_Amount,
			FrySource_Id,
			Crop_Number,
			Production_Status,
            Sale_Status,
            Date_Prepared
            )VALUES(
            _pond_Id,
            _farmName,
			_dateStocked,
			_dateOfHarvest,
			_totalStocked,
			_stockDensity,
			_daysOfCulture,
			_survivalRate,
			_averageBodyWeight,
			_biomass,
			_totalFeedsConsumed,
			_feedsConsumedRatio,
			_sales_Amount,
			_frySource_Id,
			_cropNumber,
			_status,
            _saleStatus,
            _datePrepared
            );      
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Production_DeleteById`(IN _id INT)
BEGIN
	DELETE FROM 
		rd_salesinventorydb.tbl_production
			WHERE
				Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_GetFryStockList`;
DELIMITER |
CREATE PROCEDURE `RD_Production_GetFryStockList`()
BEGIN
	SELECT
		pond.Code,
        prod.Total_Stocked,
        prod.Date_Stocked,
        prod.Sale_Status,
        src.Name
	FROM
		rd_salesinventorydb.tbl_production AS prod
			LEFT JOIN
				rd_salesinventorydb.tbl_pond AS pond
					ON
						prod.Pond_Id = pond.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_source AS src
					ON
						prod.FrySource_Id = src.Id
	WHERE
		prod.Production_Status
			LIKE
				'Plan';
				
        
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_GetPlanImportList`;
DELIMITER |
CREATE PROCEDURE `RD_Production_GetPlanImportList`()
BEGIN
	SET @rownr=0;
	SELECT
		plan.Id,
		@rownr:=@rownr+1 AS rowId,
        plan.Crop_Number,
        pond.Code,
        plan.Date_Stocked,
        plan.Total_Stocked,
        plan.Stock_Density,
		plan.DaysOf_Culture,
        plan.AveBodyWeight,
        plan.Biomass,
        plan.Survival_Rate,
        plan.Feeds_Consumed_Ratio,
        plan.Sale_Status,
        src.Name
        FROM
			rd_salesinventorydb.tbl_production AS plan
				LEFT JOIN
					rd_salesinventorydb.tbl_pond AS pond
						ON
							plan.Pond_Id = pond.Id
				LEFT JOIN
					rd_salesinventorydb.tbl_source AS src
						ON
							plan.FrySource_Id  = src.Id
		WHERE
			Production_Status
				LIKE
					'Plan';

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_GetPlanList`;
DELIMITER |
CREATE PROCEDURE `RD_Production_GetPlanList`()
BEGIN
SET @rownr=0;
	SELECT
		plan.Id,
		@rownr:=@rownr+1 AS rowId,
        plan.Farm_Name,
        plan.Crop_Number,
        pond.Code,
        pond.Area,
        plan.Pond_Preparation_Date,
        plan.Date_Stocked,
        plan.DateOf_Harvest,
        plan.DaysOf_Culture,
        plan.Total_Stocked,
        plan.Stock_Density,
        plan.AveBodyWeight,
        plan.Survival_Rate,
        plan.Biomass,
        plan.Feeds_Required,
        plan.Feeds_Consumed_Ratio,
        src.Name
        
        FROM
			rd_salesinventorydb.tbl_production AS plan
				LEFT JOIN
					rd_salesinventorydb.tbl_pond AS pond
						ON
							plan.Pond_Id = pond.Id
				LEFT JOIN
					rd_salesinventorydb.tbl_source AS src
						ON
							plan.FrySource_Id  = src.Id
		WHERE
			Production_Status
				LIKE
					'Plan';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_GetResultList`;
DELIMITER |
CREATE PROCEDURE `RD_Production_GetResultList`()
BEGIN
SET @rownr=0;
	SELECT
	product.Id,
	@rownr:=@rownr+1 AS rowId,
    product.Crop_Number,
    pond.Code,
    pond.Area,
    product.Date_Stocked,
    product.DateOf_Harvest,
    product.Total_Stocked,
    product.Stock_Density,
    product.DaysOf_Culture,
    product.Survival_Rate,
    weekly.AveBodyWeight_Present,
    product.Biomass,
    product.Total_Feeds_Consumed,
    product.Feeds_Consumed_Ratio,
    product.Sales_Amount,
    src.Name
FROM
	rd_salesinventorydb.tbl_weeklystatus AS weekly
		LEFT JOIN
			rd_salesinventorydb.tbl_production AS product
				ON
					weekly.Production_Id = product.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_pond AS pond
				ON
					product.Pond_Id = pond.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_source AS src
				ON
					product.FrySource_Id = src.Id
WHERE
	product.Production_Status
		LIKE
			'Result';

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_GetTotalStockByPond`;
DELIMITER |
CREATE PROCEDURE `RD_Production_GetTotalStockByPond`(IN _pond_Id int)
BEGIN
	SELECT 
		Total_Stocked 
	FROM 
		rd_salesinventorydb.tbl_production 
	WHERE 
		Pond_Id 
			LIKE 
				_pond_Id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_StatusUpdateIfStockEmpty`;
DELIMITER |
CREATE PROCEDURE `RD_Production_StatusUpdateIfStockEmpty`(IN _pond_Id int)
BEGIN
	Update
		rd_salesinventorydb.tbl_production
	SET
		Sale_Status = 'Inactive'
	WHERE
		Pond_Id 
			LIKE
				_pond_Id;
				
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_UpdateBySold`;
DELIMITER |
CREATE PROCEDURE `RD_Production_UpdateBySold`(IN _totalStocked Bigint, _pond_Id int)
BEGIN
	UPDATE
		rd_salesinventorydb.tbl_production
	SET
		Total_Stocked = Total_Stocked - _totalStocked
	WHERE
		Pond_Id = _pond_Id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Production_UpdateByWeeklyStatus`;
DELIMITER |
CREATE PROCEDURE `RD_Production_UpdateByWeeklyStatus`(IN _id INT, _cropNumber INT, _pond_Id INT, _dateStocked date, _totalStocked decimal(18,2), _stockDensity INT, _daysOfCulture INT, _averageBodyWeight decimal(18,2), _biomass Decimal(18,2), _frySource_Id int, _survivalRate decimal(18,2), _feedsConsumedRatio decimal(18,2), _saleStatus varchar(50))
BEGIN
	UPDATE
		rd_salesinventorydb.tbl_production
	SET
        Crop_Number = _cropNumber,
        Pond_Id = _pond_Id,
        Date_Stocked = _dateStocked,
        Total_Stocked = _totalStocked,
        Stock_Density = _stockDensity,
        DaysOf_Culture = _daysOfCulture,
        AveBodyWeight = _averageBodyWeight,
        Biomass = _biomass,
        Survival_Rate = _survivalRate,
        Feeds_Consumed_Ratio = _feedsConsumedRatio,
        Sale_Status = _saleStatus,
        FrySource_Id = _frySource_Id
	WHERE
		Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Role_GetTitle`;
DELIMITER |
CREATE PROCEDURE `RD_Role_GetTitle`()
BEGIN
	SELECT
		Id,
        Title
			FROM rd_salesinventorydb.tbl_role;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Sales_GetChartData`;
DELIMITER |
CREATE PROCEDURE `RD_Sales_GetChartData`(IN _date date)
BEGIN
	SELECT
    SUM(TotalSale) AS Total
    FROM
    rd_salesinventorydb.tbl_sales
    WHERE
    DAY(EntryDate) = DAY(_date)
	GROUP BY
		DAY(EntryDate);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Sales_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Sales_GetList`()
BEGIN
	SELECT 
		sales.Id,
		orders.OrderSlip,
		pond.Code,
		customer.FullName,
		sales.TotalSale
		FROM
		rd_salesinventorydb.tbl_sales AS sales
			LEFT JOIN
				rd_salesinventorydb.tbl_order AS orders 
					ON
						sales.Order_id = orders.Id
			LEFT JOIN 
				rd_salesinventorydb.tbl_pond AS pond 
					ON
						orders.Pond_Id = pond.Id 
			LEFT JOIN 
				rd_salesinventorydb.tbl_customer AS customer
					ON 
						orders.Customer_Id = customer.Id
		WHERE 
			orders.Status
				LIKE
					'Fulfilled' 
		AND 
			orders.DeliveryStatus
				LIKE
					'Finished';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Sales_GetSalesListByDate`;
DELIMITER |
CREATE PROCEDURE `RD_Sales_GetSalesListByDate`(IN _pond_Id int, _search varchar(100), _fromDate date, _toDate date)
BEGIN
SET @rownr=0;
	SELECT 
    sales.Id,
    @rownr:=@rownr+1 AS rowId,
    pond.Code,
    orders.OrderSlip,
    customer.FullName,
    sales.TotalSale,
    sales.EntryDate
FROM
    rd_salesinventorydb.tbl_sales AS sales
        LEFT JOIN
    rd_salesinventorydb.tbl_order AS orders ON sales.Order_Id = orders.Id
        LEFT JOIN
    rd_salesinventorydb.tbl_pond AS pond ON orders.Pond_Id = pond.Id
        LEFT JOIN
    rd_salesinventorydb.tbl_customer AS customer ON orders.Customer_Id = customer.Id
WHERE
    sales.EntryDate >= DATE(_fromDate)
        AND sales.EntryDate <= DATE(_toDate)
        AND orders.OrderSlip LIKE CONCAT('%', _search, '%')
        AND orders.Pond_Id LIKE _pond_Id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Sales_GetSalesMasterList`;
DELIMITER |
CREATE PROCEDURE `RD_Sales_GetSalesMasterList`()
BEGIN
SET @rownr=0;
	SELECT
		@rownr:=@rownr+1 AS rowId,
		orders.OrderSlip,
		SUM(sale.TotalSale) AS Total_Sales
			FROM
				rd_salesinventorydb.tbl_sales AS sale
					LEFT JOIN 
						rd_salesinventorydb.tbl_order AS orders
							ON
								sale.Order_Id = orders.Id
			WHERE
				orders.Status
					LIKE
						'Fulfilled'
			AND
				orders.DeliveryStatus
					LIKE
						'Finished'
			GROUP BY
				orders.OrderSlip;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Sales_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Sales_InsertUpdate`(IN _id int, _entryDate date, _totalSale decimal(18, 2), _order_Id int)
BEGIN
	IF EXISTS(SELECT Order_Id FROM rd_salesinventorydb.tbl_sales WHERE Order_Id = _order_id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_sales
			SET
                EntryDate = _entryDate,
                TotalSale = TotalSale + _totalSale,
                Order_Id = _order_Id
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_sales(
                EntryDate,
                TotalSale,
                Order_Id
                )VALUES(
                _entryDate,
                _totalSale,
                _order_Id
                );
                
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Source_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Source_DeleteById`(IN _id int)
BEGIN
	DELETE 
		FROM 
			rd_salesinventorydb.tbl_source
				WHERE Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Source_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Source_GetList`()
BEGIN
SET @rownr=0;
	SELECT
		Id,
		@rownr:=@rownr+1 AS rowId,
        Name
		FROM
			rd_salesinventorydb.tbl_source;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Source_GetListByName`;
DELIMITER |
CREATE PROCEDURE `RD_Source_GetListByName`()
BEGIN
	SELECT
		Id,
        Name
		FROM
			rd_salesinventorydb.tbl_source;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Source_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_Source_InsertUpdate`(IN _id int, _name varchar(50))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_source WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_source
			SET
				Name = _name
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_source(Name)VALUE(_name);	
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_DeleteById`(IN _id int)
BEGIN
	DELETE 
		FROM 
			rd_salesinventorydb.tbl_stock
		WHERE
			Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetAvailableList`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetAvailableList`()
BEGIN
	SELECT
		stock.Id,
        item.Name AS ItemName,
        category.Name AS Category,
        types.Code AS Type,
        stock.Quantity,
        unit.Expression AS Unit
	FROM
		rd_salesinventorydb.tbl_stock as stock
        LEFT JOIN
			rd_salesinventorydb.tbl_item as item
				ON
					stock.Item_Id = item.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_category as category
				ON
					item.Category_Id = category.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_types as types
				ON
					item.Type_Id = types.Id
		LEFT JOIN 
			rd_salesinventorydb.tbl_unit as unit
				ON
					unit.Category_Id = category.Id
	WHERE
		stock.Status 
			LIKE
				'Available'
	AND
		stock.RestockPoint
			>=
				10;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetAvailableListBySearch`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetAvailableListBySearch`(IN _category varchar(50), _search varchar(50))
BEGIN
SET @rownr=0;
	SELECT 
		stock.Id,
		@rownr:=@rownr+1 AS rowId,
		stock.ReferenceNumber,
		item.Name,
		types.Code,
		stock.Quantity,
		stock.RestockPoint,
		unit.Expression
		FROM
			rd_salesinventorydb.tbl_stock AS stock
		LEFT JOIN
				rd_salesinventorydb.tbl_unit AS unit
					ON 
						stock.Unit_Id = unit.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_item AS item
					ON 
						stock.Item_Id = item.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON 
						item.Type_Id = types.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_category AS category
					ON 
						item.Category_Id = category.Id 
		WHERE
				((stock.Quantity >= stock.RestockPoint
		AND
				category.Name LIKE CONCAT('%',_category,'%')
		AND
				stock.Status LIKE 'Available')
		AND
				(item.Name LIKE CONCAT('%',_search,'%')));
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetCriticalList`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetCriticalList`()
BEGIN
SET @rownr=0;
	SELECT 
		stock.Id,
		@rownr:=@rownr+1 AS rowId,
		item.Name AS Item, 
		category.Name AS Category, 
		types.Code AS TypeCode, 
		stock.Quantity
		FROM 
			rd_salesinventorydb.tbl_stock AS stock 
			LEFT JOIN 
				rd_salesinventorydb.tbl_item AS item
					ON
						stock.Item_Id = item.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_category AS category
					ON
						item.Category_Id = category.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON
						item.Type_Id = types.Id
		WHERE
			stock.Quantity 
				<
					stock.RestockPoint
		AND
			stock.Status
				LIKE
					'Available';
        
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetCriticalNotif`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetCriticalNotif`()
BEGIN
	SELECT 
		stock.ReferenceNumber,
		item.Name AS Item, 
		types.Code AS TypeCode, 
		stock.Quantity
		FROM 
			rd_salesinventorydb.tbl_stock AS stock 
			LEFT JOIN 
				rd_salesinventorydb.tbl_item AS item
					ON
						stock.Item_Id = item.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_category AS category
					ON
						item.Category_Id = category.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON
						item.Type_Id = types.Id
		WHERE
			stock.Quantity 
				<
					stock.RestockPoint
		AND
			stock.Status
				LIKE
					'Available';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetListByCategory`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetListByCategory`(IN _category varchar(50))
BEGIN
SET @rownr=0;
	SELECT 
		stock.Id,
		@rownr:=@rownr+1 AS rowId,
		stock.ReferenceNumber,
		item.Name,
		types.Code,
		stock.Quantity,
		stock.RestockPoint,
		unit.Expression
		FROM
			rd_salesinventorydb.tbl_stock AS stock
		LEFT JOIN
				rd_salesinventorydb.tbl_unit AS unit
					ON 
						stock.Unit_Id = unit.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_item AS item
					ON 
						stock.Item_Id = item.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON 
						item.Type_Id = types.Id
		LEFT JOIN
				rd_salesinventorydb.tbl_category AS category
					ON 
						item.Category_Id = category.Id 
		WHERE
				stock.Quantity >= stock.RestockPoint
		AND 
				category.Name LIKE CONCAT('%',_category,'%')
		AND
				stock.Status LIKE 'Available';

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetPendingList`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetPendingList`(IN _employee_Id varchar(50), _search varchar(50))
BEGIN
SET @rownr=0;
	SELECT 
		stock.Id,
        @rownr:=@rownr+1 AS rowId,
		item.Name AS Itemname, 
		category.Name AS Category, 
		types.Code, 
		stock.Quantity, 
		unit.Expression 
		FROM 
			rd_salesinventorydb.tbl_stock AS stock 
			LEFT JOIN 
				rd_salesinventorydb.tbl_item AS item
					ON 
						stock.Item_Id = item.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON
						item.Type_Id = types.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_category AS category
					ON
						item.Category_Id = category.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_unit AS unit
					ON
						stock.Unit_Id  = unit.Id
		WHERE
			((stock.Employee_Id 
				LIKE
					CONCAT('%',_employee_Id,'%')
		OR 
			stock.Status 
				LIKE 
					'Pending')
		AND
					(item.Name 
						LIKE
							CONCAT('%',_search,'%')
                            OR
					category.Name
						LIKE
							CONCAT('%',_search,'%')
                            OR
					types.Code 
						LIKE
							CONCAT('%',_search,'%')
				));
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_GetReceivedList`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_GetReceivedList`()
BEGIN
SET @rownr=0;
	SELECT
		stock.Id,
		@rownr:=@rownr+1 AS rowId,
        stock.ReferenceNumber,
        item.Name AS ItemName,
        category.Name AS Category,
        types.Code,
        stock.Quantity,
        unit.Expression
	FROM
		rd_salesinventorydb.tbl_stock AS stock
        LEFT JOIN
			rd_salesinventorydb.tbl_item AS item
				ON
					stock.Item_Id = item.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_category AS category
				ON
					item.Category_Id = category.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_types AS types
				ON
					item.Type_Id = types.Id
		LEFT JOIN
			rd_salesinventorydb.tbl_unit AS unit
				ON
					stock.Unit_Id = unit.Id
	WHERE
		stock.Status
			LIKE
				'Received';

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_InsertToAvailable`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_InsertToAvailable`(in
												_id int,
                                                _referenceNumber varchar(100),
                                                _item_Id int,
                                                _quantity decimal(18,2),
                                                _restockPoint decimal(18,2),
                                                _status varchar(50),
                                                _unit_Id int
                                                )
BEGIN
IF EXISTS(SELECT Item_Id FROM rd_salesinventorydb.tbl_stock WHERE Item_Id = _item_Id) 
	THEN
		UPDATE rd_salesinventorydb.tbl_stock
			SET
				ReferenceNumber = _referenceNumber,
                Item_Id = _item_Id,
                Quantity = Quantity + ConvertToExisting(_item_Id, _unit_Id, _quantity),
                RestockPoint = _restockPoint,
                Unit_Id = Unit_Id
			WHERE
				Item_Id = _item_Id
			AND
				Status = 'Available';
                
		UPDATE rd_salesinventorydb.tbl_stock
			SET
				Status  = 'Added To Existing'
			WHERE Id = _id;
ELSE
	UPDATE rd_salesinventorydb.tbl_stock
    SET
			RestockPoint = _restockPoint,
            Status =_status
		WHERE
			Id = _id;
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_InsertUpdatePending`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_InsertUpdatePending`(in _id int, _item_Id int, _quantity decimal(18,2), _status varchar(50), _unit_Id int)
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_stock where Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_stock
			SET
                Item_Id = _item_Id,
                Quantity = _quantity,
                Status = _status,
                Unit_Id = _unit_Id
			WHERE
				Id = _id;
	ELSE
		INSERT INTO rd_salesinventorydb.tbl_stock(
			Item_Id, 
            Quantity,
            Unit_Id,
            Status
            )VALUES(
            _item_Id,
            _quantity,
            _unit_Id,
            _status
            );
     END IF;       
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_InsertUpdateToReceiving`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_InsertUpdateToReceiving`(IN _id int,
														_referenceNumber varchar(100),
                                                        _item_Id int,
                                                        _quantity decimal(18,2),
                                                        _status varchar(50),
                                                        _unit_Id int,
                                                        _entryDate date)
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_stock WHERE Id = _id)
		THEN
			UPDATE
				rd_salesinventorydb.tbl_stock
			SET
				ReferenceNumber = _referenceNumber,
                Item_Id = _item_Id,
                Quantity = _quantity,
                Status = _status,
                Unit_Id = _unit_Id,
                EntryDate = _entryDate
			WHERE
				Id = _id;
	ELSE
		INSERT INTO
			rd_salesinventorydb.tbl_stock(
				ReferenceNumber,
                Item_Id,
                Quantity,
                Status,
                Unit_Id,
                EntryDate
                )VALUES(
                 _referenceNumber,
				 _item_Id,
                 _quantity,
                 _status,
                 _unit_Id,
                 _entryDate
                );
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_UpdateByManage`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_UpdateByManage`(in _id int, _unit_Id int, _quantity decimal(18,2), _restockPoint decimal(18,2))
BEGIN
		UPDATE rd_salesinventorydb.tbl_stock 
        SET
			Unit_Id = _unit_Id,
            Quantity = _quantity,
            RestockPoint = _restockPoint
		WHERE 
			Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Stock_UpdateFromWithdraw`;
DELIMITER |
CREATE PROCEDURE `RD_Stock_UpdateFromWithdraw`(IN _id int,
												   _unit_Id int,
                                                   _item_Id int,
                                                   _quantity decimal(18,2))
BEGIN
	UPDATE rd_salesinventorydb.tbl_stock
		SET 
			Quantity = Quantity - ConvertToExisting(_item_Id, _unit_Id, _quantity)
		WHERE
			Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Types_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_Types_DeleteById`(IN _id int)
BEGIN
	DELETE
		FROM
			rd_salesinventorydb.tbl_types
		WHERE
			Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Types_GetCode`;
DELIMITER |
CREATE PROCEDURE `RD_Types_GetCode`()
BEGIN
	SELECT 
    Id,
    Code
		FROM
		rd_salesinventorydb.tbl_types;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Types_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Types_GetList`()
BEGIN
SET @rownr=0;
	SELECT 
		Id AS TypeID,
        @rownr:=@rownr+1 AS rowId,
        Code AS TypeCode,
        Description AS TypeDescription
		FROM
			rd_salesinventorydb.tbl_types;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Types_InsertUpdateById`;
DELIMITER |
CREATE PROCEDURE `RD_Types_InsertUpdateById`(IN _id int, _code varchar(15), _description varchar(50))
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_types WHERE Id = _id)
		THEN
			UPDATE rd_salesinventorydb.tbl_types
				SET
					Code = _code,
                    Description = _description
				WHERE
					Id = _id;
	ELSE
			INSERT INTO
				rd_salesinventorydb.tbl_types(
					Code,
					Description
                    )VALUES(
                    _code,
                    _description
                    );
                    
	END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Unit_GetByCategory`;
DELIMITER |
CREATE PROCEDURE `RD_Unit_GetByCategory`(in _category varchar(50))
BEGIN
	SELECT 
		unit.Id,
        unit.Expression
        FROM
			rd_salesinventorydb.tbl_unit AS unit
				LEFT JOIN
					rd_salesinventorydb.tbl_category AS category
						ON
							unit.Category_Id = category.Id
		WHERE
			category.Name
				=
					_category;            
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Unit_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_Unit_GetList`()
BEGIN
SET @rownr=0;
	SELECT
		Id,
		@rownr:=@rownr+1 AS rowId,
        Expression,
        Description
		FROM 
			rd_salesinventorydb.tbl_unit;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_WeeklyStatus_DeleteById`;
DELIMITER |
CREATE PROCEDURE `RD_WeeklyStatus_DeleteById`(IN _id int)
BEGIN
	DELETE 
		FROM
			rd_salesinventorydb.tbl_weeklystatus
				WHERE
					Id = _id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_WeeklyStatus_GetList`;
DELIMITER |
CREATE PROCEDURE `RD_WeeklyStatus_GetList`()
BEGIN
	SET @rownr=0;
SELECT
	weekly.Id,
    weekly.Production_Id,
	@rownr:=@rownr+1 AS Row_Id,
	product.Crop_Number,
    product.Farm_Name,
    pond.Code AS Pond,
    pond.Area,
    product.Date_Stocked,
    product.DateOf_Harvest,
    product.Total_Stocked,
    product.Stock_Density,
    weekly.Sampling_Date,
    product.DaysOf_Culture,
    product.AveBodyWeight,
    weekly.AveBodyWeight_Present,
    weekly.Weekly_IncreaseDecrease,
    weekly.Growth_Per_Day,
    weekly.Feeds_Used_Day,
    weekly.Feeds_Used_Week,
    weekly.Feeds_Used_Cummulative,
    product.Biomass,
    product.Feeds_Consumed_Ratio,
    product.Survival_Rate,
    weekly.PWAO_Unit,
    weekly.PWAO_Hours,
    feedtype.Code AS FeedsType,
    item.Name,
    src.Name AS Source,
    product.Sale_Status
    
    FROM
		rd_salesinventorydb.tbl_weeklystatus AS weekly
			LEFT JOIN
				rd_salesinventorydb.tbl_production AS product
					ON
						weekly.Production_Id = product.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_pond AS pond
					ON
						product.Pond_Id = pond.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_types AS feedtype
					ON
						weekly.Feedtypes_Id = feedtype.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_item AS item
					ON
						weekly.Item_Id = item.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_source AS src
					ON
						product.FrySource_Id = src.Id
			WHERE
				product.Production_Status 
					LIKE
						'Plan';

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_WeeklyStatus_InsertUpdate`;
DELIMITER |
CREATE PROCEDURE `RD_WeeklyStatus_InsertUpdate`(IN _id INT, _production_Id INT, _samplingDate DATE, _latestAverageBodyWeight DECIMAL(18,2), _weeklyIncreaseDecrease DECIMAL(18,2), _growthPerDay DECIMAL(18,2), _feedsUsed_Day DECIMAL(18,2), _feedsUsed_Week DECIMAL(18,2), _feedsUsed_Cummulative DECIMAL(18,2), _pwaoUnit varchar(50), _pwaoHour varchar(50), _feedType_Id int, _item_Id int)
BEGIN
	IF EXISTS(SELECT Id FROM rd_salesinventorydb.tbl_weeklystatus WHERE Id = _id)
		THEN
			UPDATE rd_salesinventorydb.tbl_weeklystatus
			SET
				Production_Id = _production_Id,
                Sampling_Date = _samplingDate,
                AveBodyWeight_Present = _latestAverageBodyWeight,
                Weekly_IncreaseDecrease = _weeklyIncreaseDecrease,
                Growth_Per_Day = _growthPerDay,
                Feeds_Used_Day = _feedsUsed_Day,
                Feeds_Used_Week = _feedsUsed_Week,
                Feeds_Used_Cummulative = _feedsUsed_Cummulative,
                PWAO_Unit = _pwaoUnit,
                PWAO_Hours = _pwaoHour,
                Feedtypes_Id = _feedType_Id,
                Item_Id = _item_Id
			WHERE
				Id = _id;
	ELSE
		INSERT INTO rd_salesinventorydb.tbl_weeklystatus(
				Production_Id,
                Sampling_Date,
                AveBodyWeight_Present,
                Weekly_IncreaseDecrease,
                Growth_Per_Day,
                Feeds_Used_Day,
                Feeds_Used_Week,
                Feeds_Used_Cummulative,
                PWAO_Unit,
                PWAO_Hours,
                Feedtypes_Id,
                Item_Id
                )VALUES(
                _production_Id,
                _samplingDate,
                _latestAverageBodyWeight,
                _weeklyIncreaseDecrease,
                _growthPerDay,
                _feedsUsed_Day,
                _feedsUsed_Week,
                _feedsUsed_Cummulative,
                _pwaoUnit,
                _pwaoHour,
                _feedType_Id,
                _item_Id
                );
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Withdraw_GetListByDate`;
DELIMITER |
CREATE PROCEDURE `RD_Withdraw_GetListByDate`(IN _fromDate date, _toDate date, _pond_Id int)
BEGIN
SET @rownr=0;
	SELECT
		@rownr:=@rownr+1 AS rowId,
		pond.Code AS Pond,
        item.Name,
        types.Code AS Feed_Type,
        wdraw.Amount AS Total_Feeds,
        unit.Expression,
        wdraw.Entry_Date
	FROM
		rd_salesinventorydb.tbl_withdraw AS wdraw
			LEFT JOIN
				rd_salesinventorydb.tbl_pond AS pond
					ON
						wdraw.Pond_Id = pond.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_item AS item
					ON
						wdraw.Item_Id = item.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_types AS types
					ON
						item.Type_Id = types.Id
			LEFT JOIN
				rd_salesinventorydb.tbl_unit AS unit
					ON
						wdraw.Unit_Id = unit.Id
	WHERE
			wdraw.Entry_Date 
					>=
						DATE(_fromDate) 
			AND 
			wdraw.Entry_Date
					<= 
						DATE(_toDate)
			AND
			pond.Id
					LIKE
						_pond_Id;
			
						
				
        
        
        
		

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `RD_Withdraw_Insert`;
DELIMITER |
CREATE PROCEDURE `RD_Withdraw_Insert`(IN _pond_Id INT, _amount Decimal(18,2), _unit_Id int, _entryDate Date, _item_Id int)
BEGIN
	INSERT INTO
		rd_salesinventorydb.tbl_withdraw(
			Pond_Id,
            Amount,
            Unit_Id,
            Entry_Date,
            Item_Id
            )VALUES(
            _pond_Id,
            _amount,
            _unit_Id,
            _entryDate,
            _item_Id
            );

END |
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2021-11-02 21:49:02
-- Total time: 0:0:0:4:201 (d:h:m:s:ms)
