USE STAGING

DELETE FROM ajk.peserta_stage WHERE peserta_ID_SOURCE = '9999.6666666'
DELETE FROM ajk.peserta_stage WHERE peserta_ID_SOURCE = '9999.7777777'
DELETE FROM ajk.peserta_stage WHERE peserta_ID_SOURCE = '9999.8888888'

DELETE FROM ajk.peserta WHERE peserta_ID_SOURCE = '9999.6666666'
DELETE FROM ajk.peserta WHERE peserta_ID_SOURCE = '9999.7777777'
DELETE FROM ajk.peserta WHERE peserta_ID_SOURCE = '9999.8888888'