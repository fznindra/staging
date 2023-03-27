USE [STAGING]
GO

/****** Object:  StoredProcedure [dbo].[PROC_IUD_RAW_AJK_PESERTA]    Script Date: 2022-09-10 3:27:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Iman Subarkah
-- Create date: 2022-09-06
-- Description:	SP untuk mendapatkan latest data di table peserta_stage
-- @pi_action = 0 - INITIAL
-- @pi_action = 1 - INSERT/UPDATE/DELETE
-- ACTION = 0 - INITIAL
-- ACTION = 1 - INSERT
-- ACTION = 2 - UPDATE
-- ACTION = 3 - DELETE
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[PROC_IUD_RAW_AJK_PESERTA]')
AND type IN ('TT', 'IT', 'U', 'FN', 'TF', 'V', 'P'))
	BEGIN
		DROP PROCEDURE [dbo].[PROC_IUD_RAW_AJK_PESERTA]
	END
GO
CREATE PROCEDURE [dbo].[PROC_IUD_RAW_AJK_PESERTA]
	-- Add the parameters for the stored procedure here
	@pi_action INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (@pi_action = 0)
	BEGIN
		SELECT
			ps.*
		FROM
			ajk.peserta_stage AS ps WITH(NOLOCK)
		WHERE
			ps.ACTION = @pi_action
	END

	ELSE IF (@pi_action = 1)
	BEGIN
	SELECT
		ps.*
	FROM
		(
			SELECT
				ps.*
			FROM
				ajk.peserta_stage AS ps WITH(NOLOCK)
			WHERE
				ps.ACTION IN (1, 2, 3)
		) AS ps
		INNER JOIN	
		(
			SELECT
				fltr.peserta_ID_SOURCE,
				MAX(fltr.peserta_ID) AS peserta_ID_LATEST 
			FROM 
				ajk.peserta_stage AS fltr WITH(NOLOCK)
			WHERE
				fltr.ACTION IN (1, 2, 3)
			GROUP BY
				fltr.peserta_ID_SOURCE
		) AS fltr
		ON
			ps.peserta_ID_SOURCE = fltr.peserta_ID_SOURCE
			AND ps.peserta_ID = fltr.peserta_ID_LATEST
	END
END
GO


