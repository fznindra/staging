USE [STAGING]
GO
/****** Object:  StoredProcedure [dbo].[PROC_TRUNCATE_RAW_IND_CWMPOLDET]    Script Date: 2022-09-23 2:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[PROC_TRUNCATE_RAW_IND_CWMPOLDET]')
AND type IN ('TT', 'IT', 'U', 'FN', 'TF', 'V', 'P'))
	BEGIN
		DROP PROCEDURE [dbo].[PROC_TRUNCATE_RAW_IND_CWMPOLDET]
	END
GO
CREATE PROCEDURE [dbo].[PROC_TRUNCATE_RAW_IND_CWMPOLDET]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	TRUNCATE TABLE [ind].[CWMPOLDET]
	DELETE FROM [dbo].[cdc_states] WHERE name = 'ind.CWMPOLDET'

END
