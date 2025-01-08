create or alter procedure dbo.InvoiceUpsert(
    @InvoiceId int = 0,
    @SupplierId int,
    @PaymentMethodId int,
    @PackageStatusId int,
    @InvoiceTotal decimal(10, 2),
    @AmountPaid decimal(10, 2) = 0,
    @TrackingNumber varchar(50) = '',
    @MonthReceived varchar(9) = ''
)
as 
begin 
    declare @OrderNumber int = 0;

    select @InvoiceId = isnull(@InvoiceId, 0), @AmountPaid = isnull(@AmountPaid, 0), @TrackingNumber = isnull(@TrackingNumber, ''), @MonthReceived = nullif(@MonthReceived, '')

    select @OrderNumber = count(*) + 1
    from Invoice i 
    where i.SupplierId = @SupplierId

    if @InvoiceId = 0
    begin
        insert Invoice(SupplierId, PaymentMethodId, PackageStatusId, OrderNumber, InvoiceTotal, AmountPaid, TrackingNumber)
        values(@SupplierId, @PaymentMethodId, @PackageStatusId, @OrderNumber, @InvoiceTotal, @AmountPaid, @TrackingNumber)

        select @InvoiceId = scope_identity();
    end
    else
    begin
        update i
        set 
            i.SupplierId = @SupplierId,
            i.PaymentMethodId = @PaymentMethodId,
            i.PackageStatusId = @PackageStatusId,
            i.InvoiceTotal = @InvoiceTotal,
            i.AmountPaid = @AmountPaid,
            i.TrackingNumber = @TrackingNumber,
            i.MonthReceived = @MonthReceived
        from Invoice i
        where i.InvoiceId = @InvoiceId
    end

    declare @FirstName varchar(25), @LastName varchar(25), @NickName varchar(25), @IsVerified bit

    select 
        @FirstName = s.FirstName, 
        @LastName = s.LastName, 
        @NickName = s.NickName, 
        @IsVerified = s.IsVerified
    from Supplier s
    where s.SupplierId = @SupplierId

    exec SupplierInfoUpdate @SupplierId = @SupplierId, @FirstName = @FirstName, @LastName = @LastName, @NickName = @NickName, @IsVerified = @IsVerified
end
go