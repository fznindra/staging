---- DEV: Jalankan di PC803\STAGING

USE STAGING
GO

/****** Object:  Table [dbo].[peserta]    Script Date: 2022-09-05 3:52:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[ajk].[peserta_stage]')
AND type IN ('TT', 'IT', 'U', 'FN', 'TF', 'V', 'P'))
	BEGIN
		DROP TABLE [ajk].[peserta_stage]
	END
GO

CREATE TABLE [ajk].[peserta_stage](
	ACTION INT,
	CAPTURED_DATE DATETIME2(7) DEFAULT CURRENT_TIMESTAMP,
	peserta_ID BIGINT IDENTITY PRIMARY KEY,
	peserta_ID_SOURCE [varchar](12) NOT NULL,
	TASK_EXECUTION_INSTANCE_ID INT NOT NULL,

	[no_polis] [varchar](13) NOT NULL,
	[id_perusahaan] [varchar](11) NOT NULL,
	[tgl_pengajuan] [datetime] NOT NULL,
	[no_peserta] [varchar](15) NOT NULL,
	[nama_peserta_1] [varchar](100) NOT NULL,
	[tgl_lahir_1] [datetime] NOT NULL,
	[umur_peserta] [int] NULL,
	[nama_peserta_2] [varchar](50) NULL,
	[tgl_lahir_2] [datetime] NULL,
	[id_perusahaan_reas] [varchar](4) NULL,
	[id_reas_share] [varchar](11) NULL,
	[berat_badan] [smallint] NULL,
	[tinggi_badan] [smallint] NULL,
	[id_jenis_kelamin] [varchar](1) NOT NULL,
	[id_jenis_identitas] [varchar](2) NOT NULL,
	[no_identitas] [varchar](50) NULL,
	[no_hp] [varchar](255) NULL,
	[email] [varchar](50) NULL,
	[medical_ya] [bit] NOT NULL,
	[tgl_mulai] [datetime] NOT NULL,
	[tgl_akhir] [datetime] NOT NULL,
	[id_valuta] [varchar](3) NOT NULL,
	[id_periode_bayar] [varchar](1) NOT NULL,
	[id_produk] [varchar](12) NOT NULL,
	[id_cabang] [varchar](4) NULL,
	[masa] [int] NOT NULL,
	[prosen_bunga] [float] NOT NULL,
	[uang_pertanggungan] [float] NOT NULL,
	[premi] [float] NOT NULL,
	[prosen_extra_premi] [float] NOT NULL,
	[extra_premi] [float] NOT NULL,
	[biaya_admin] [float] NOT NULL,
	[prosen_discount] [float] NULL,
	[discount] [float] NULL,
	[premi_netto] [float] NULL,
	[id_format_sertifikat] [varchar](2) NULL,
	[id_metode_hitung_umur] [varchar](2) NULL,
	[id_tipe_periode] [varchar](2) NULL,
	[kode_medical] [varchar](2) NULL,
	[keterangan_medical] [varchar](200) NULL,
	[keterangan] [varchar](100) NULL,
	[tgl_keluar] [datetime] NULL,
	[alasan_keluar] [varchar](100) NULL,
	[id_status_underwriting] [varchar](2) NULL,
	[jenis_kredit] [varchar](100) NULL,
	[status] [varchar](1) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[create_by] [varchar](4) NOT NULL,
	[change_date] [datetime] NULL,
	[change_by] [varchar](4) NULL,
	[verify_date] [datetime] NULL,
	[verify_by] [varchar](4) NULL,
	[verify_note] [varchar](100) NULL,
	[approve_date] [datetime] NULL,
	[approve_by] [varchar](4) NULL,
	[approve_note] [varchar](50) NULL,
	[cancel_date] [datetime] NULL,
	[cancel_by] [varchar](4) NULL,
	[cancel_note] [varchar](100) NULL,
	[nomordn] [varchar](100) NULL,
	[tgl_join] [datetime] NULL,
	[umur_join] [int] NULL,
	[up_join] [float] NULL,
	[premi_join] [float] NULL,
	[id_peserta_new] [varchar](12) NULL,
	[id_peserta_ori] [varchar](12) NULL,
	[patch_1] [bit] NULL,
	[tgl_maturity] [datetime] NULL,
	[tgl_kejadian_meninggal] [datetime] NULL,
	[id_status_peserta] [varchar](2) NULL,
	[no_kontrak_external] [varchar](15) NULL,
	[virtual_account_external] [varchar](20) NULL,
	[jml_cicilan_per_bulan] [float] NULL,
	[kode_produksi_external] [varchar](10) NULL,
	[id_nasabah_external] [varchar](8) NULL,
	[status_pendaftaran_external] [varchar](50) NULL,
	[jt_tempo_cicilan_awal] [datetime] NULL,
	[jt_tempo_cicilan_akhir] [datetime] NULL,
	[marital_status_external] [varchar](30) NULL,
	[alternate_phone_no_external] [varchar](255) NULL,
	[premium_amount_external] [float] NOT NULL,
	[address_external] [varchar](225) NULL,
	[city_external] [varchar](225) NULL,
	[portal_code_external] [varchar](20) NULL,
	[cancellation_date_external] [datetime] NULL,
	[termination_date_external] [datetime] NULL,
	[sales_room_name_external] [varchar](255) NULL,
	[sales_room_city_external] [varchar](1020) NULL,
	[nama_file] [varchar](200) NULL,
	[kode_produk] [varchar](20) NULL,
	[virtual_account_external_old] [varchar](20) NULL,
	[id_tipe_transaksi] [int] NULL,
	[no_kontrak_external_lama] [varchar](50) NULL
)
GO
