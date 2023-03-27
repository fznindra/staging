USE [STAGING]
GO

/****** Object:  StoredProcedure [dbo].[PROC_DELETE_RAW_IND_CWMPOLDET]    Script Date: 2023-02-06 08:59:55.350 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		:	Fauzan Indra Alfian
-- Create date	:	2023-02-07
-- Description	:	SP untuk delete table ind.CWMPOLDET dari ind.CWMPOLDET
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[PROC_DELETE_RAW_IND_CWMPOLDET]')
AND type IN ('TT', 'IT', 'U', 'FN', 'TF', 'V', 'P'))
	BEGIN
		DROP PROCEDURE [dbo].[PROC_DELETE_RAW_IND_CWMPOLDET]
	END
GO
CREATE PROCEDURE [dbo].[PROC_DELETE_RAW_IND_CWMPOLDET]
	-- Add the parameters for the stored procedure here
	@pi_LSEQID bigint,
	@pi_ACTION int,
	@pi_TASK_EXECUTION_INSTANCE_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		ind.CWMPOLDET
	SET
		 ACTION	 = @pi_ACTION
		,CAPTURED_DATE	= CURRENT_TIMESTAMP
		,TASK_EXECUTION_INSTANCE_ID	= @pi_TASK_EXECUTION_INSTANCE_ID
		,IS_DELETED = 1
	WHERE
		LSEQID = @pi_LSEQID
END
GO


