SELECT gl.AccountNo, AccountDescription
FROM GLAccounts gl
LEFT JOIN InvoiceLineItems Li
ON gl.AccountNo = Li.AccountNo
WHERE Li.AccountNo IS NULL
ORDER BY gl.AccountNo;