SELECT VendorName, DefaultAccountNo, AccountDescription
FROM Vendors V
JOIN GLAccounts GL
ON V.DefaultAccountNo = GL.AccountNo
ORDER BY AccountDescription, VendorName;