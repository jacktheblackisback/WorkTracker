
exec InvoiceUpsert @InvoiceId = 5, @SupplierId = 4, @PaymentMethodId = 1, @PackageStatusId = 2, @InvoiceTotal = 4500.00, @AmountPaid = 4500, @TrackingNumber = '', @MonthReceived = 'September'

select * from Supplier
select * from Invoice