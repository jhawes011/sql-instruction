USE MAster

DROP DATABASE IF EXISTS PRSDB
GO
create database PRSDB

GO 

use prsdb

create table "User"(
	ID			INT			IDENTITY(1,1) PRIMARY KEY,
	Username	VARCHAR(20)	NOT NULL,
	Password	VARCHAR(10) NOT NULL,
	FirstName	VARCHAR(20) NOT NULL,
	LastName	Varchar(20) NOT NULL,
	PhoneNumber	Varchar(12) NOT NULL,
	Email		VARCHAR(75) NOT NULL,
	Reviewer	BIT			NOT NULL,
	Admin		BIT			NOT NULL,
	CONSTRAINT UC_Username UNIQUE (Username));

GO

create table Vendor(
	ID			INT			IDENTITY(1,1) PRIMARY KEY,
	Code		VARCHAR(10)	NOT NULL,
	Name		VARCHAR(255)NOT NULL,
	Address		VARCHAR(255)NOT NULL,
	City		Varchar(255)NOT NULL,
	State		Varchar(2)	NOT NULL,
	Zip			VARCHAR(5)	NOT NULL,
	PhoneNumber	VARCHAR(12)	NOT NULL,
	Email		VARCHAR(100)NOT NULL,
	 CONSTRAINT vcode UNIQUE (Code)); 

	GO

create table [Product](
	ID			INT			 IDENTITY(1,1) PRIMARY KEY,
	VendorID	INT			NOT NULL ,
	PartNumber	VARCHAR(50) NOT NULL,
	Name		VARCHAR(150)NOT NULL,
	Price		Decimal(10,2)NOT NULL,
	Unit		Varchar(255),
	PhotoPath	VARCHAR(255),
	CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber),
	CONSTRAINT FK_ProductVendor FOREIGN KEY (VendorID) REFERENCES Vendor(ID));

GO

create table [Request](
	ID			INT				IDENTITY(1,1) Primary Key,
	UserID		INT				NOT NULL ,
	RequestNumber		VARCHAR(20) NOT NULL,
	"Description"		VARCHAR(100) NOT NULL,
	Justification		Varchar(255) NOT NULL,
	DateNeeded			DATE	NOT NULL,
	DeliveryMode		VARCHAR(25)	NOT NULL,
	"Status"			VARCHAR(20) default 'NEW'	NOT NULL,
	Total				DECIMAL(10,2) default 0.0 NOT NULL,
	SubmittedDate		DATETIME	NOT NULL,
	ReasonForRejection	VARCHAR(100),
	CONSTRAINT FK_RequestUser FOREIGN KEY (UserID) REFERENCES [User](ID)
	);

GO

create table "LineItem"(
	ID			INT		IDENTITY(1,1) PRIMARY KEY,
	RequestID	INT		NOT NULL,
	ProductID	INT		NOT NULL,
	Quantity	INT		NOT NULL,
	CONSTRAINT req_pdt UNIQUE (RequestID, ProductID),
	CONSTRAINT FK_LineItemProduct FOREIGN KEY (ProductID) REFERENCES "Product"(ID),
	CONSTRAINT FK_LineItemRequest FOREIGN KEY (RequestID) REFERENCES Request(ID));

