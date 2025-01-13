use WorkTrackerDB
go
delete Months
delete ContactMethod
delete PackageStatus
delete PaymentMethod
delete Supplier
go

insert dbo.Supplier(FirstName, LastName, NickName, IsVerified)
select 'Rolando', 'Flores', '', 1
union select 'Jason', 'Song', '', 1
union select 'Ed', 'Casadine', '', 1
union select 'Joseph', 'Pepe', '', 1
union select 'Ahmed', '', '', 1
union select 'Elizabeth', 'Banty', '', 1
union select 'Ellena', '', '', 1
union select 'Brady', '', '', 1
union select 'Laura', 'Goldsmith', '', 1
union select 'Brian', 'Bockert', '', 0
union select 'Eunice', 'English', 'Miss. English', 1
union select 'Shyanna', '', '', 1

insert PaymentMethod(PaymentMethodName, IsCreditCard)
values
    ('PayPal', 1),
    ('Zelle', 0),
    ('CashApp', 0),
    ('ACH Transfer', 0),
    ('Wire Transfer', 0),
    ('Venmo', 0),
    ('Square', 1),
    ('Other (CC Payment)', 1)

insert PackageStatus(PackageStatusProgress)
values
    ('Incoming'),
    ('Received'),
    ('Missing')

insert ContactMethod(ContactMethod)
values
    ('Phone Number'),
    ('Email'),
    ('Text'),
    ('Whatsapp')

insert Months(MonthName)
values
    (' '),
    ('January'),
    ('February'),
    ('March'),
    ('April'),
    ('May'),
    ('June'),
    ('July'),
    ('August'),
    ('September'),
    ('October'),
    ('November'),
    ('December')