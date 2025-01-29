SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM Vendors V, Invoices I
WHERE V.VendorID = I.VendorID AND InvoiceTotal - PaymentTotal - CreditTotal > 0
Order BY VendorName;