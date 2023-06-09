USE [Consumos]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 4/23/2023 10:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [varchar](13) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[telefono] [varchar](8) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumos]    Script Date: 4/23/2023 10:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumos](
	[idConsumo] [varchar](50) NOT NULL,
	[idPeriodo] [varchar](50) NOT NULL,
	[idCliente] [varchar](13) NOT NULL,
	[idHorario] [varchar](50) NOT NULL,
	[cantidadConsumida] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Consumos] PRIMARY KEY CLUSTERED 
(
	[idConsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 4/23/2023 10:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[idHorario] [varchar](50) NOT NULL,
	[idPeriodo] [varchar](50) NOT NULL,
	[horaInicio] [time](0) NOT NULL,
	[horaFinalizacion] [time](0) NOT NULL,
 CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 4/23/2023 10:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodos](
	[idPeriodo] [varchar](50) NOT NULL,
	[precio_kw] [money] NOT NULL,
 CONSTRAINT [PK_Periodos] PRIMARY KEY CLUSTERED 
(
	[idPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Cliente]
GO
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Horarios] FOREIGN KEY([idHorario])
REFERENCES [dbo].[Horarios] ([idHorario])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Horarios]
GO
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Periodos] FOREIGN KEY([idPeriodo])
REFERENCES [dbo].[Periodos] ([idPeriodo])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Periodos]
GO
