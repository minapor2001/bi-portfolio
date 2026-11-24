 --اعتبار سنجی
 select
 (select count(*) from Transactions) as sourceRows,
 (select sum(txcount) from dbo.vw_monthlybranch )as viewRows;
 

 select (select sum(TotalAmount) from dbo.vw_monthlybranch) as sumAMount,
 (select sum (Amount) from Transactions)