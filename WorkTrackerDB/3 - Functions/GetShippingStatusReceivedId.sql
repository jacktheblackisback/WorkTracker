create or alter function dbo.GetShippingStatusReceivedId(
    @Status varchar(9)
)
returns int
as
begin
    declare @PackageStatusId int
    if @Status not in ('Missing', 'Incoming', 'Received') or @Status is null
    begin
        return -1
    end

    select @PackageStatusId =  ps.PackageStatusId
    from PackageStatus ps 
    where ps.PackageStatusProgress = @Status

    return @PackageStatusId
end
go