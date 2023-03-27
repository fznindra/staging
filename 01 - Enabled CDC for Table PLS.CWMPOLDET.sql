---- DEV: Jalankan di PC803\DIGITAL
USE EQLIFE
GO

-- Check sa has owner_sid permissions, if not then change db owner.
IF (select SUSER_SNAME(owner_sid) from sys.databases WHERE NAME='EQLIFE') <> 'sa'
BEGIN
   EXEC sp_changedbowner 'sa'
END
GO
 
-- Check SourceDB is not already CDC enabled, if not then enable CDC for the database
if (select is_cdc_enabled from sys.databases WHERE NAME='EQLIFE') = 'false'
BEGIN
   EXEC sys.sp_cdc_enable_db
END
GO
 
-- Check dbo.customers is not already CDC enabled, if not then enable CDC for the table
if (select is_tracked_by_cdc from sys.tables WHERE SCHEMA_NAME(schema_id)='PLS' and  NAME = 'CWMPOLINS') = 'false' --PERUBAHAN NAMA TABLE
BEGIN
EXEC sys.sp_cdc_enable_table
   @source_schema = N'PLS',
   @source_name   = N'CWMPOLDET',
   @role_name     = NULL,
   @supports_net_changes = 1
END
GO