SELECT COUNT(*) AS [Number Of Invoices]
FROM Invoices
WHERE InvoiceTotal > 0



SELECT COUNT(*) AS NumberOfInvoices, SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0


SELECT 'After 7/1/2022' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AvgInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount,
	MIN(InvoiceTotal) AS LowestInvoiceAmount,
	MAX(InvoiceTotal) AS HighestInvoiceAmount
FROM Invoices
WHERE InvoiceDate > '2022/07/01'

SELECT Min(VendorName) AS FirstVendor, MAX(VendorName) AS LastVendor, COUNT(VendorName) AS NumberofVendors
From Vendors

-- P139 using DISTINCT in summary queries - Distinct Number of vendors

SELECT COUNT(DISTINCT VendorID) AS NumberofVendors, 
COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AvgInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices;

--  pg.141 AVG Invoice Amount By Vendor

SELECT VendorID, AVG(InvoiceTotal) AS AVGInvoiceAmount
FROM Invoices
GROUP BY VendorID
HAVING AVG(InvoiceTotal) > 2000
ORDER BY AVGInvoiceAmount DESC;

--  pg 143. # of invoices by vendor

SELECT VendorID, COUNT(*) AS InvoiceQTY
FROM Invoices
GROUP BY VendorID

-- pg 143 Vendors by satate and city, inv qty amd inv avg

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQTY, AVG(InvoiceTotal) AS InvoiceAVG
FROM Invoices I
JOIN Vendors V ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity

--  limit the resutls using HAVING clause

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQTY, AVG(InvoiceTotal) AS InvoiceAVG
FROM Invoices I
JOIN Vendors V ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
HAVING COUNT(*) >=2
ORDER BY VendorState, VendorCity;

--  pg 145  search condition in the HAVING clause

SELECT VendorName, COUNT(*) AS InvoiceQTY, AVG(Invoicetotal) AS InvoiceAverage
FROM Vendors V
JOIN Invoices I
ON V.VendorID = I.VendorID
GROUP BY VendorName
HAVING AVG(InvoiceTotal) > 500
ORDER BY InvoiceQTY DESC;

--  pg 145  search condition in the WHERE clause

SELECT VendorName, COUNT(*) AS InvoiceQTY, AVG(Invoicetotal) AS InvoiceAverage
FROM Vendors V
JOIN Invoices I
ON V.VendorID = I.VendorID
WHERE InvoiceTotal > 500
GROUP BY VendorName
ORDER BY InvoiceQTY DESC;

-- pg 149 invoices by vendor grouped to get invoice count and invoice total. with summary row (ROLLUP) 

SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(Invoicetotal) AS InvoiceSum
FROM Invoices
GROUP BY ROLLUP(VendorID);

-- ROLLUP multiple columns: Vendors from IA NJ ROLLUP by vendorstate and vendorcity

SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY ROLLUP (VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

-- pg 151 CUBE

SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices
GROUP BY CUBE(VendorID)

SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY CUBE (VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

-- pg 152 Groupoing Sets

SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY GROUPING SETS(VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

--  composite grouping

SELECT VendorState, VendorCity, VendorZipCode, COUNT(*) AS QTYVendors
FROM Vendors
WHERE VendorState IN ('IA', 'NJ')
GROUP BY GROUPING SETS((VendorState, VendorCity), VendorZipCode)
ORDER BY VendorState DESC, VendorCity DESC;

-- pg 155 using the OVER clause

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, 
SUM(InvoiceTotal) OVER (Partition BY InvoiceDate) AS DateTotal, 
COUNT(InvoiceTotal) OVER (Partition BY InvoiceDate) AS DateCount, 
AVG(InvoiceTotal) OVER (Partition BY InvoiceDate) AS DateAvg
FROM Invoices