USE AP;

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[A,B,C,E]%'
ORDER BY VendorContactLName, VendorContactFName;