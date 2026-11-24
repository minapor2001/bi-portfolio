create or alter procedure dbo.usp_monthlybranch 
 @StartDate Date ,
 @EndDate Date 
 AS
 select BranchID,MontStart,txCount,TotalAmount
 from dbo.vw_monthlybranch 
 where MontStart > @StartDate and  MontStart <@EndDate
 order by BranchID
 go
 ----------------------
 Exec  dbo.usp_monthlybranch @StartDate='2026-08-01', @EndDate='2026-08-15'