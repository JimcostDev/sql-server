USE [BD_II]
GO

/****** Object:  Table [dbo].[MatriculaAcademica]    Script Date: 17/03/2021 11:23:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MatriculaAcademica](
	[mat_codigo] [char](10) NOT NULL,
	[alu_codigo] [char](10) NOT NULL,
	[per_codigo] [char](10) NOT NULL,
	[grup_codigo] [char](20) NOT NULL,
	[mat_fecha] [date] NOT NULL,
 CONSTRAINT [PK_MatriculaAcademica] PRIMARY KEY CLUSTERED 
(
	[mat_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MatriculaAcademica]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAcademica_ALUMNO] FOREIGN KEY([alu_codigo])
REFERENCES [dbo].[ALUMNO] ([alu_codigo])
GO

ALTER TABLE [dbo].[MatriculaAcademica] CHECK CONSTRAINT [FK_MatriculaAcademica_ALUMNO]
GO

ALTER TABLE [dbo].[MatriculaAcademica]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAcademica_GRUPO] FOREIGN KEY([grup_codigo])
REFERENCES [dbo].[GRUPO] ([grup_codigo])
GO

ALTER TABLE [dbo].[MatriculaAcademica] CHECK CONSTRAINT [FK_MatriculaAcademica_GRUPO]
GO

ALTER TABLE [dbo].[MatriculaAcademica]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAcademica_Periodo] FOREIGN KEY([per_codigo])
REFERENCES [dbo].[Periodo] ([per_codigo])
GO

ALTER TABLE [dbo].[MatriculaAcademica] CHECK CONSTRAINT [FK_MatriculaAcademica_Periodo]
GO

