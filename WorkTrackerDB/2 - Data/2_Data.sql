
DECLARE @SupplierId INT, @PaymentMethodId INT, @PackageStatusId INT, @InvoiceTotal INT;

-- Brady, Invoice #7
SET @SupplierId = (SELECT SupplierId FROM Supplier WHERE FirstName = 'Brady');
SET @PaymentMethodId = (SELECT PaymentMethodId FROM PaymentMethod WHERE PaymentMethodName = 'Paypal');
SET @PackageStatusId = (SELECT PackageStatusId FROM PackageStatus WHERE PackageStatusProgress = 'Received');
SET @InvoiceTotal = 913;
EXEC InvoiceUpsert @SupplierId = @SupplierId, @PaymentMethodId = @PaymentMethodId, @PackageStatusId = @PackageStatusId, @InvoiceTotal = @InvoiceTotal;

-- Shyanna, Invoice #3
SET @SupplierId = (SELECT SupplierId FROM Supplier WHERE FirstName = 'Shyanna');
SET @PaymentMethodId = (SELECT PaymentMethodId FROM PaymentMethod WHERE PaymentMethodName = 'Paypal');
SET @PackageStatusId = (SELECT PackageStatusId FROM PackageStatus WHERE PackageStatusProgress = 'Received');
SET @InvoiceTotal = 471;
EXEC InvoiceUpsert @SupplierId = @SupplierId, @PaymentMethodId = @PaymentMethodId, @PackageStatusId = @PackageStatusId, @InvoiceTotal = @InvoiceTotal;

-- Ellena, Invoice #34.1
SET @SupplierId = (SELECT SupplierId FROM Supplier WHERE FirstName = 'Ellena');
SET @PaymentMethodId = (SELECT PaymentMethodId FROM PaymentMethod WHERE PaymentMethodName = 'ACH Transfer');
SET @PackageStatusId = (SELECT PackageStatusId FROM PackageStatus WHERE PackageStatusProgress = 'Received');
SET @InvoiceTotal = 13677.50;
EXEC InvoiceUpsert @SupplierId = @SupplierId, @PaymentMethodId = @PaymentMethodId, @PackageStatusId = @PackageStatusId, @InvoiceTotal = @InvoiceTotal;

-- Laura, Invoice #39
SET @SupplierId = (SELECT SupplierId FROM Supplier WHERE FirstName = 'Laura');
SET @PaymentMethodId = (SELECT PaymentMethodId FROM PaymentMethod WHERE PaymentMethodName = 'Paypal');
SET @PackageStatusId = (SELECT PackageStatusId FROM PackageStatus WHERE PackageStatusProgress = 'Received');
SET @InvoiceTotal = 936.50;
EXEC InvoiceUpsert @SupplierId = @SupplierId, @PaymentMethodId = @PaymentMethodId, @PackageStatusId = @PackageStatusId, @InvoiceTotal = @InvoiceTotal;


SET @SupplierId = (SELECT SupplierId FROM Supplier WHERE FirstName = 'Laura');
SET @PaymentMethodId = (SELECT PaymentMethodId FROM PaymentMethod WHERE PaymentMethodName = 'Paypal');
SET @PackageStatusId = (SELECT PackageStatusId FROM PackageStatus WHERE PackageStatusProgress = 'Received');
SET @InvoiceTotal = 1600;
EXEC InvoiceUpsert @SupplierId = @SupplierId, @PaymentMethodId = @PaymentMethodId, @PackageStatusId = @PackageStatusId, @InvoiceTotal = @InvoiceTotal;



select s.FirstName, i.ordernumber, ps.PackageStatusProgress, i.InvoiceTotal, i.amountpaid, i.MonthReceivedId
from Invoice i 
join Supplier s 
on i.supplierId = s.SupplierId
join PackageStatus ps 
on i.PackageStatusId = ps.PackageStatusId

select * from invoice