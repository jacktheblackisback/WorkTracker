create or alter procedure dbo.SupplierInfoUpdate(
    @SupplierId int = 0 output,
    @FirstName varchar(20),
    @LastName varchar(20),
    @NickName varchar(20),
    @IsVerified bit
)
as 
begin
    declare @AmountOfInvoices int, @TotalPurchaseAmount decimal(10, 2)

    select @AmountOfInvoices = count(i.InvoiceId), @TotalPurchaseAmount = isnull(sum(i.InvoiceTotal), 0)
    from Invoice i 
    where i.SupplierId = @SupplierId
    and i.PackageStatusId = dbo.GetShippingStatusReceivedId('Received')

    update s 
    set 
        s.FirstName = @FirstName,
        s.LastName = @LastName,
        s.NickName = @NickName,
        s.AmountOfInvoices = @AmountOfInvoices,
        s.TotalPurchaseAmount = @TotalPurchaseAmount,
        s.IsVerified = @IsVerified
    from Supplier s 
    where s.SupplierId = @SupplierId
end 
go