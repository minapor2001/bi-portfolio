# Monthly Branch Performance Report

## هدف گزارش
گزارش ماهانه‌ی تعداد تراکنش و مجموع مبلغ برای هر شعبه، با امکان انتخاب بازه‌ی ماه و فیلتر شعبه.

## جدول‌های استفاده‌شده
- `dbo.Transactions`: منبع تراکنش‌ها (`TransactionDate`, `Amount`, `AccountID`)
- `dbo.Accounts`: اتصال تراکنش به شعبه (`AccountID`, `BranchID`)
- `dbo.Branches`: نام شعبه (`BranchID`, `BranchName`)

## اشیاء دیتابیس
- `dbo.vw_monthlybranch`: view ماهانه
- dbo.usp_monthlybranch  :  برای فیلتر کردن بر اساس تاریخی که از ورودی داده میشه به view


## نحوه‌ی اجرا
```sql
EXEC dbo.usp_MonthlyBranchReport
     @StartMonth = '2026-08-01',
     @EndMonth   = '2026-08-01';
```

## نتیجه‌ی اعتبارسنجی
| بررسی | منبع | View | وضعیت |
|---|---|---|---|
| تعداد تراکنش‌ها | ___ | ___ | ✅ / ❌ |
| مجموع مبلغ | ___ | ___ | ✅ / ❌ |
| تراکنش‌های یتیم | ___ | — | ___ |