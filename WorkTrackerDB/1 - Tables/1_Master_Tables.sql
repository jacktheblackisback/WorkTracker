use WorkTrackerDB
go
drop table if exists Months
drop table if exists ContactMethod
drop table if exists PackageStatus
drop table if exists PaymentMethod
drop table if exists Supplier
go

create table dbo.Supplier
(
    SupplierId int identity primary key,
    FirstName varchar(20) not null
        constraint chk_FirstName_must_not_be_Blank check (FirstName <> ''),
    LastName varchar(20) not null,
    NickName varchar(20) not null
        default '',
    AmountOfInvoices int not null default 0  -- Must be updated with a sproc
        constraint chk_AmountOfInvoices_must_not_be_less_than_Zero check (AmountOfInvoices >= 0),
    TotalPurchaseAmount decimal(10, 2) not null default 0 -- Must be updated with sproc
        constraint chk_TotalPurchaseAmount_must_not_be_less_than_Zero check (TotalPurchaseAmount >= 0),
    BonusesReceived int not null default 0,
    IsVerified bit not null default 0,
    constraint u_FirstName_and_LastName_must_be_Unique unique (FirstName, LastName)
)
go

create table dbo.PaymentMethod
(
    PaymentMethodId int identity primary key,
    PaymentMethodName varchar(20) not null
        constraint chk_PaymentMethodName_must_not_be_Blank check (PaymentMethodName <> '')
        constraint u_PaymentMethodName_must_be_Unique unique,
    IsCreditCard bit not null
)
go

create table dbo.PackageStatus
(
    PackageStatusId int not null identity primary key,
    PackageStatusProgress varchar(10) not null
        constraint chk_PackageStatusProgress_must_be_a_valid_Package_status check (PackageStatusProgress in ('Incoming', 'Received', 'Missing'))
        constraint u_PackageStatusProgress_must_be_Unique unique
)
go

create table dbo.ContactMethod(
    ContactMethodId int not null identity primary key,
    ContactMethod varchar(25) not null
        constraint u_ContactMethod_must_be_Unique unique
        constraint chk_ContactMethod_must_not_be_blank check (ContactMethod <> '')
)

create table dbo.Months(
    MonthId int not null identity primary key,
    MonthName varchar(15) not null unique
)