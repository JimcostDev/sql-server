USE [BD_II]
GO

/****** Object:  Table [dbo].[PROFESOR]    Script Date: 17/03/2021 11:24:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PROFESOR](
	[pro_codigo] [char](10) NOT NULL,
	[pro_nombres] [char](40) NOT NULL,
	[pro_apellidos] [char](40) NOT NULL,
	[pro_direccion] [varchar](120) NOT NULL,
	[pro_telefono] [varchar](20) NOT NULL,
	[pro_email] [varchar](50) NOT NULL,
	[pro_fechaNacimiento] [date] NOT NULL,
	[pro_sexo] [char](1) NOT NULL,
	[ciu_codigo] [char](10) NOT NULL,
	[dep_codigo] [char](10) NOT NULL,
	[pai_codigo] [char](10) NOT NULL,
	[pro_dni] [char](20) NOT NULL,
 CONSTRAINT [PK_PROFESOR_1] PRIMARY KEY CLUSTERED 
(
	[pro_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PROFESOR]  WITH CHECK ADD  CONSTRAINT [FK_PROFESOR_CIUDAD] FOREIGN KEY([ciu_codigo], [dep_codigo], [pai_codigo])
REFERENCES [dbo].[CIUDAD] ([ciu_codigo], [dep_codigo], [pai_codigo])
GO

ALTER TABLE [dbo].[PROFESOR] CHECK CONSTRAINT [FK_PROFESOR_CIUDAD]
GO

