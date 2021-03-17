USE [BD_II]
GO

/****** Object:  Table [dbo].[Notas]    Script Date: 17/03/2021 11:23:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Notas](
	[mat_codigo] [char](10) NOT NULL,
	[cod_materia] [char](10) NOT NULL,
	[pro_codigo] [char](10) NOT NULL,
	[not_nota1] [decimal](5, 2) NULL,
	[not_nota2] [decimal](5, 2) NULL,
	[not_nota3] [decimal](5, 2) NULL,
	[not_final] [decimal](5, 2) NULL,
	[not_codigo] [char](10) NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[not_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Materias] FOREIGN KEY([cod_materia])
REFERENCES [dbo].[Materias] ([mat_codigo])
GO

ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_Materias]
GO

ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_MatriculaAcademica] FOREIGN KEY([mat_codigo])
REFERENCES [dbo].[MatriculaAcademica] ([mat_codigo])
GO

ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_MatriculaAcademica]
GO

ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_PROFESOR] FOREIGN KEY([pro_codigo])
REFERENCES [dbo].[PROFESOR] ([pro_codigo])
GO

ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_PROFESOR]
GO

