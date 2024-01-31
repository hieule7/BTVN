USE [university]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sv](
	[sv_id] [bigint] NOT NULL,
	[sv_name] [nvarchar](25) NOT NULL,
	[sv_birth] [datetime] NULL,
 CONSTRAINT [PK_sv] PRIMARY KEY CLUSTERED 
(
	[sv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[gv](
	[gv_id] [bigint] NOT NULL,
	[gv_name] [nvarchar](25) NOT NULL,
	[gv_pos] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_gv] PRIMARY KEY CLUSTERED 
(
	[gv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[rkh](
	[sv_id] [bigint] NOT NULL,
	[gv_id] [bigint] NOT NULL,
	[kh_name] [nvarchar](50) NULL,
	[result] [bigint] NULL,
 CONSTRAINT [PK_rkh] PRIMARY KEY(sv_id,gv_id),
 CONSTRAINT [fk_f_rkh] FOREIGN KEY(sv_id) REFERENCES sv(sv_id),
 CONSTRAINT [fk_k_rkh] FOREIGN KEY(gv_id) REFERENCES gv(gv_id),
 )
GO