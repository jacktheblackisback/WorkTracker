select * from months order by MonthNum

-- Test that month names are unique

insert Months(MonthName)
values ('March')

-- Test that month names cannot be blank

insert Months(MonthName)
values ('')

-- Test that month names are not null

insert Months(MonthName)
values (null)