SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
FROM Customers c
  JOIN Orders o 
    ON c.CustomerID = o.CustomerID
  JOIN OrderItems oi 
    ON o.OrderID = oi.OrderID
  JOIN Products p 
    ON oi.ProductID = p.ProductID
ORDER BY LastName, OrderDate, ProductName;