--  chapter 6. pg 160
-- return all invoices whose total is greater than the average invoice total

SELECT *
FROM Invoices;

SELECT Avg(InvoiceTotal)
FROM Invoices 

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > (SELECT Avg(InvoiceTotal) FROM Invoices)
ORDER BY InvoiceTotal

-- p.163 a query that uses an inner join 
-- join invoices and vendors, show invoicenumber, invoicedate, invoicetotal for invoice vendors from CA

SELECT InvoiceNumber, InvoiceDate, Invoicetotal
FROM Invoices I
JOIN Vendors V ON V.VendorID = I.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

-- Now the same query using a subquery

SELECT InvoiceNumber, InvoiceDate, Invoicetotal
FROM Invoices I
WHERE VendorID IN (SELECT VendorID FROM Vendors WHERE VendorState = 'CA') 
ORDER BY InvoiceDate;

-- pg.165 query that returns vendors without an invoice

SELECT VendorID, VendorName, VendorState
FROM Vendors
WHERE VendorID NOT IN
(SELECT DISTINCT VendorID FROM Invoices);

-- Same thing but without the subquery

SELECT V.VendorID, VendorName, VendorState
FROM Vendors V
LEFT JOIN Invoices I
ON V.VendorID = I.VendorID
WHERE I.VendorID IS NULL

-- p.167  invoice payment details, see balance due where balance due is less than the AVG balance due

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
FROM Invoices
WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
AND (InvoiceTotal - PaymentTotal - CreditTotal) <
(SELECT AVG(InvoiceTotal - PaymentTotal - CreditTotal)
FROM Invoices
WHERE (InvoiceTotal - PaymentTotal - CreditTotal) >0)
ORDER BY InvoiceTotal DESC

-- p.169  ALL keyword  

SELECT VendorID, InvoiceTotal
FROM Invoices
WHERE VendorID = 34

-- Add all invoices whose totals are > vendor id 34's invoices

SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Invoices I
JOIN Vendors V
ON V.VendorID = I.VendorID
WHERE InvoiceTotal > ALL
(SELECT InvoiceTotal
FROM Invoices
WHERE VendorID = 34)
ORDER BY VendorName

-- pg.170  ANY and SOME keywords. ANY=SOME
-- invoice totals for vendorid 115

SELECT VendorID, InvoiceTotal
FROM Invoices
WHERE VendorID = 34

-- invoices less than any of vendor 115's

SELECT V.VendorID, InvoiceTotal
FROM Vendors V
JOIN Invoices I
ON V.VendorID = I.VendorID
WHERE InvoiceTotal < ANY (SELECT InvoiceTotal
FROM Invoices
WHERE VendorID = 34)

-- pg 172 correlated subqueries
-- show vendor invoices that are above their OWN average of invoices

SELECT VendorID, InvoiceNumber, InvoiceTotal
FROM Invoices I1
WHERE InvoiceTotal > 
(SELECT AVG(InvoiceTotal)
	FROM Invoices I2
	WHERE I2.VendorID = I1.VendorID)
ORDER BY VendorID, InvoiceTotal

-- p.175  WHERE EXISTS / NOT EXISTS
-- Vendors without invoices

SELECT VendorID, VendorName, VendorState
FROM Vendors V
WHERE NOT EXISTS 
(SELECT *
FROM Invoices I
WHERE I.VendorID = V.VendorID)