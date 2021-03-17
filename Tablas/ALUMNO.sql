USE [BD_II]
GO

/****** Object:  Table [dbo].[ALUMNO]    Script Date: 17/03/2021 11:19:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ALUMNO](
	[alu_codigo] [char](10) NOT NULL,
	[alu_nombres] [char](40) NOT NULL,
	[alu_apellidos] [char](40) NOT NULL,
	[alu_direccion] [varchar](120) NOT NULL,
	[alu_telefono] [varchar](20) NOT NULL,
	[alu_email] [varchar](50) NOT NULL,
	[alu_fechaNacimiento] [date] NOT NULL,
	[alu_sexo] [char](1) NOT NULL,
	[ciu_codigo] [char](10) NOT NULL,
	[dep_codigo] [char](10) NOT NULL,
	[pai_codigo] [char](10) NOT NULL,
	[alu_dni] [char](20) NOT NULL,
 CONSTRAINT [PK_ALUMNO_1] PRIMARY KEY CLUSTERED 
(
	[alu_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ALUMNO]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_CIUDAD] FOREIGN KEY([ciu_codigo], [dep_codigo], [pai_codigo])
REFERENCES [dbo].[CIUDAD] ([ciu_codigo], [dep_codigo], [pai_codigo])
GO

ALTER TABLE [dbo].[ALUMNO] CHECK CONSTRAINT [FK_ALUMNO_CIUDAD]
GO

