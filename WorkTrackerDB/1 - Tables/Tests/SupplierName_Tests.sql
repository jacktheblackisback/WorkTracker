select * from SupplierName

-- Test that FirstName cannot be blank

insert dbo.SupplierName(FirstName, LastName, NickName)
select '', '', ''

-- Test that FirstName cannot be null

insert dbo.SupplierName(FirstName, LastName, NickName)
select null, '', ''

-- Test that LastName cannot be null

insert dbo.SupplierName(FirstName, LastName, NickName)
select 'a', null, ''

--Test that NickName cannot be null

insert dbo.SupplierName(FirstName, LastName, NickName)
select 'a', '', null

-- Test that FirstName and LastName together must be unique

insert dbo.SupplierName(FirstName, LastName, NickName)
select 'Ed', 'Casadine', ''