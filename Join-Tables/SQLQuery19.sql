SELECT V1.VendorID, V1.VendorName, V1.VendorContactFName + ' ' + V1.VendorContactLName AS Name
FROM Vendors V1
Join Vendors V2
ON (V1.VendorID <> V2.VendorID) 
AND (V1.VendorContactFName = V2.VendorContactFName)
ORDER BY Name;