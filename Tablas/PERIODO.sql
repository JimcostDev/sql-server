USE [BD_II]
GO

/****** Object:  Table [dbo].[Periodo]    Script Date: 17/03/2021 11:24:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Periodo](
	[per_codigo] [char](10) NOT NULL,
	[per_nombre] [char](40) NULL,
	[per_fechaInicial] [datetime] NULL,
	[per_fechaFinal] [date] NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[per_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

