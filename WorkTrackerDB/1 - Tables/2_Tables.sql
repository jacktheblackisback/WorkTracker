use WorkTrackerDB
go
drop table if exists SupplierContactInfo
drop table if exists SupplierPaymentInfo
drop table if exists SupplierNote
drop table if exists InvoiceNote
drop table if exists Invoice
go

create table dbo.Invoice (
    InvoiceId int not null identity primary key,
    SupplierId int not null
        constraint fk_Invoice_Supplier foreign key references Supplier(SupplierId),
    PaymentMethodId int not null 
        constraint fk_Invoice_PaymentMethod foreign key references PaymentMethod(PaymentMethodId),
    PackageStatusId int not null 
        constraint fk_Invoice_PackageStatus foreign key references PackageStatus(PackageStatusId),
    OrderNumber int not null -- Need to use Sproc to insert the OrderNumber
        constraint u_OrderNumber_and_SupplierId_must_be_Unique unique (OrderNumber, SupplierId),
    InvoiceTotal decimal(10, 2) not null
        constraint chk_InvoiceTotal_must_not_be_less_than_zero check (InvoiceTotal >= 0),
    AmountPaid decimal(10, 2) not null default 0
        constraint chk_AmountPaid_must_not_be_less_than_zero check (AmountPaid >= 0),
    TrackingNumber varchar(50) not null
        constraint u_TrackingNumber_must_be_Unique unique,
    MonthReceivedId int null
        constraint fk_Invoice_Months foreign key references Months(MonthId),
    constraint chk_AmountPaid_must_not_be_greater_than_InvoiceTotal check (AmountPaid <= InvoiceTotal)
)
go

    -- MonthReceived varchar(9) null
    --     constraint chk_MonthReceived_must_be_a_valid_month_name check (
    --        MonthReceived in (
    --         'January', 
    --         'February', 
    --         'March', 
    --         'April', 
    --         'May', 
    --         'June', 
    --         'July', 
    --         'August', 
    --         'September', 
    --         'October', 
    --         'November', 
    --         'December'
    --         )
    --    ),

create table dbo.InvoiceNote (
    InvoiceNoteId int not null identity primary key,
    InvoiceId int not null 
        constraint fk_InvoiceNote_Invoice foreign key references Invoice(InvoiceId),
    Note varchar(1500) not null
        constraint chk_InvoiceNote_must_not_be_Blank check (Note <> ''),
    constraint u_InvoiceId_and_Note_must_be_Unique unique(InvoiceId, Note)
)

create table dbo.SupplierNote (
    SupplierNoteId int not null identity primary key,
    SupplierId int not null 
        constraint fk_SupplierId_SupplierNote foreign key references Supplier(SupplierId),
    Note varchar(1500) not null
        constraint chk_SupplierNote_must_not_be_Blank check (Note <> ''),
    constraint u_SupplierId_Note_must_be_Unique unique (SupplierId, Note)
)

create table dbo.SupplierPaymentInfo (
    SupplierPaymentInfo int not null identity primary key,
    SupplierId int not null 
        constraint fk_SupplierPaymentInfo_Supplier foreign key references Supplier(SupplierId),
    PaymentMethodId int not null 
        constraint fk_SupplierPaymentInfo_PaymentMethod foreign key references PaymentMethod(PaymentMethodId),
    PaymentInfo varchar(100) not null
        constraint chk_PaymentInfo_must_not_be_Blank check (PaymentInfo <> ''),
        constraint u_PaymentMethodId_PaymentInfo_must_be_Unique unique (PaymentMethodId, PaymentInfo)
)

create table dbo.SupplierContactInfo (
    SupplierContactInfo int not null identity primary key,
    SupplierId int not null
        constraint fk_SupplierContactInfo_SupplierId foreign key references Supplier(SupplierId),
    ContactMethodId int not null 
        constraint fk_SupplierContactInfo_ContactMethodId foreign key references ContactMethod(ContactMethodId),
    ContactDetails varchar(50) not null,
    constraint u_ContactMethodId_ContactDetails unique (ContactMethodId, ContactDetails)
)