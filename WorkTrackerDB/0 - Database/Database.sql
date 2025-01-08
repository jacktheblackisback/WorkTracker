use master
go

-- Terminate all connections to the database
-- alter database WorkTrackerDB
-- set single_user
-- with rollback immediate;
-- go

drop database if exists WorkTrackerDB
go
create database WorkTrackerDB
go
use WorkTrackerDB