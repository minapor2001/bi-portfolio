
 create or alter view  dbo.vw_monthlybranch 
 AS

 Select b.BranchID ,
 DATEFROMPARTS(YEAR(t.TransactionDate),MONTH(t.TransactionDate),1)as MontStart,
 count(t.TransactionID) as txCount, sum(t.Amount)as TotalAmount
 from Branches B
 join Accounts a on a.BranchID=b.BranchID
 join Transactions t on t.AccountID =a.AccountID

 group by b.BranchID, DATEFROMPARTS(YEAR(t.TransactionDate),MONTH(t.TransactionDate),1)

 GO
