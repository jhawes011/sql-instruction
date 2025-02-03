USE MAster

DROP DATABASE IF EXISTS TESTPRSDB
GO

create database TESTPRSDB

create table [Request](
	ID			INT				NOT NULL Primary Key,
	UserID		INT				NOT NULL ,
	RequestNumber		VARCHAR(20)  NOT NULL,
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

	INSERT INTO [Request] (UserID, RequestNumber, "Description", Justification, DateNeeded, DeliveryMode, 'Status', Total, SubmittedDate, ReasonForRejection)
VALUES (1, ('R' + GETDATE(), INT), 'PowerTool Update', ' 