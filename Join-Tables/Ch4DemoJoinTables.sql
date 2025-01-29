--  Chapter 4 DEMOS
-- p.103 - two table join
-- Vendors and Invoices Table

USE AP
SELECT *
FROM Vendors;

SELECT * 
FROM Invoices
ORDER BY VendorID;

--  which vendors have we invoiced?
--  which vendors have we not done business with?
-- which vendors have spent the most  money with us?

SELECT InvoiceNumber, VendorName
FROM Vendors
JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName ASC;
-- ALL vendors who have been invoiced