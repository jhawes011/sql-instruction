USE PRSDB

INSERT INTO [User] (Username, Password, FirstName, LastName, PhoneNumber, Email, Reviewer, [Admin])
VALUES ('BangBang6', 'StkumUp321', 'Yosemite', 'Sam', '419-546-7195', 'olewestshooter55@acmetunes.com', 0, 0);

INSERT INTO [Vendor] (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
Values ('STP', 'Special Tunes Products', '1260 Giddypop Dr', 'Houston', 'TX', '99868', '424-858-9999', 'stporder@stp.com')

INSERT INTO [Product] (VendorID, PartNumber, Name, Price, Unit)
VALUES (2, 'CCC54', 'Mustache Curling Wax', '99.99', 'Case(25)')


USE PRSDB

INSERT INTO [Request] (UserID, RequestNumber, "Description", Justification, DateNeeded, DeliveryMode, "Status", Total, SubmittedDate)
VALUES (2, 22222, 'Heavy Duty Hunter Supplies', 'Needed to catch RoadRunner', '2025-04-16', 'Acme Mail Order', 'New', '99.97', '2025-02-02')
USE PRSDB
INSERT INTO LineItem ( RequestID, ProductID, Quantity)
VALUES (1, 3, 1)