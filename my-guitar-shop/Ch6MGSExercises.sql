-- #1
USE MyGuitarShop SELECT * FROM CAtegories

SELECT DISTINCT CategoryName
FROM Categories c JOIN Products p
 ON c.CategoryID = p.CategoryID
ORDER BY CategoryName

SELECT CategoryName AS [Instrument Category]
FROM Categories
WHERE CategoryID IN (SELECT CategoryID FROM Products)
ORDER BY CategoryName

-- #2

SELECT ProductName, ListPrice
FROM Products
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Products)
ORDER BY ListPRice DESC

--  #3

SELECT CategoryName
FROM Categories C
WHERE NOT EXISTS (SELECT *
					FROM Products P
					WHERE C.CategoryID = P.CategoryID)

-- #4

SELECT EmailAddress, MAX(OrderTotal) AS MaxOrder
FROM 
	(SELECT EmailAddress, O.OrderID, SUM((ItemPrice + ShipAmount + TaxAmount - DiscountAmount) * Quantity) AS OrderTotal
	FROM Customers C
	JOIN Orders O ON C.CustomerID = O.CustomerID
	JOIN OrderItems Oi ON O.OrderID = Oi.OrderID
	GROUP BY EmailAddress, O.OrderID) SubQuery
GROUP BY EmailAddress;


SELECT EmailAddress, MAX(OrderTotal) AS MaxOrder
FROM 
	(SELECT EmailAddress, O.OrderID, SUM(((ItemPrice - DiscountAmount) * Quantity) + ShipAmount + TaxAmount) AS OrderTotal
	FROM Customers C
	JOIN Orders O ON C.CustomerID = O.CustomerID
	JOIN OrderItems Oi ON O.OrderID = Oi.OrderID
	GROUP BY EmailAddress, O.OrderID) SubQuery
GROUP BY EmailAddress;