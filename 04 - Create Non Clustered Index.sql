---- DEV: Jalankan di ELI-DB11\WAREHOUSE

USE STAGING

DROP INDEX IF EXISTS ind.CWMPOLDET.ix_ind_CWMPOLDET_1
CREATE UNIQUE NONCLUSTERED INDEX ix_ind_CWMPOLDET_1 ON
	[ind].[CWMPOLDET]
	( LSEQID, SPOLNO, [CAPTURED_DATE] ASC ) 
	WITH (PAD_INDEX  = OFF) ON [PRIMARY];
GO