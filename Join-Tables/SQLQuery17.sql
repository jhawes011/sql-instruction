SELECT VendorName AS Vendor, InvoiceDate AS Date, InvoiceNumber AS Number, InvoiceSequence AS [#], InvoiceLineItemAmount AS LineItem
FROM Vendors V
JOIN Invoices I
ON V.VendorID = I.VendorID
JOIN InvoiceLineItems Li
ON I.InvoiceID = Li.InvoiceID
ORDER BY Vendor, Date, Number, [#];