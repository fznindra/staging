USE STAGING

SELECT
	*
FROM
	ajk.peserta_stage
WHERE
	peserta_ID_SOURCE IN (
		'9999.6666666',
		'9999.7777777',
		'9999.7777778'		
	)