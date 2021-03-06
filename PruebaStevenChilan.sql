USE [PruebaSteven]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 01/07/2021 20:34:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](500) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Categorias_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historial_P]    Script Date: 01/07/2021 20:34:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historial_P](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Categoria] [int] NOT NULL,
	[Proveedor] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[Medidas] [numeric](18, 2) NOT NULL,
	[Cantidad] [numeric](18, 4) NOT NULL,
	[PrecioUnitario] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_Historial_P] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 01/07/2021 20:34:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marcas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Marcas_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Categoria] [int] NOT NULL,
	[Proveedor] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[Medidas] [numeric](18, 2) NOT NULL,
	[Cantidad] [numeric](18, 4) NOT NULL,
	[PrecioUnitario] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](500) NOT NULL,
	[Estado] [bit] NOT NULL CONSTRAINT [DF_Proveedores_Estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombres], [Estado]) VALUES (1, N'Bebidas', 1)
INSERT [dbo].[Categorias] ([Id], [Nombres], [Estado]) VALUES (2, N'Varios', 1)
INSERT [dbo].[Categorias] ([Id], [Nombres], [Estado]) VALUES (3, N'Dulces', 1)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[Historial_P] ON 

INSERT [dbo].[Historial_P] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (1, N'Pepsi 3L', 1, 1, 1, CAST(1.00 AS Numeric(18, 2)), CAST(50.0000 AS Numeric(18, 4)), CAST(1.250 AS Numeric(18, 3)))
INSERT [dbo].[Historial_P] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (2, N'Snacks Doritos funda pequeña', 2, 2, 2, CAST(2.00 AS Numeric(18, 2)), CAST(3.0000 AS Numeric(18, 4)), CAST(23.000 AS Numeric(18, 3)))
INSERT [dbo].[Historial_P] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (3, N'chicles trident sandia', 3, 3, 3, CAST(60.00 AS Numeric(18, 2)), CAST(23.0000 AS Numeric(18, 4)), CAST(23.000 AS Numeric(18, 3)))
SET IDENTITY_INSERT [dbo].[Historial_P] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([Id], [Nombre], [Estado]) VALUES (1, N'Pesisco S.A', 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [Estado]) VALUES (2, N'La Fabaril', 1)
INSERT [dbo].[Marcas] ([Id], [Nombre], [Estado]) VALUES (3, N'Trindent', 1)
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (3, N'Gaseosa Pepsi 3lts', 1, 2, 1, CAST(1.00 AS Numeric(18, 2)), CAST(82.0000 AS Numeric(18, 4)), CAST(95.000 AS Numeric(18, 3)))
INSERT [dbo].[Productos] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (6, N'Producto 5', 2, 3, 2, CAST(56.00 AS Numeric(18, 2)), CAST(3.0000 AS Numeric(18, 4)), CAST(20.000 AS Numeric(18, 3)))
INSERT [dbo].[Productos] ([Id], [Descripcion], [Categoria], [Proveedor], [Marca], [Medidas], [Cantidad], [PrecioUnitario]) VALUES (7, N'Tortolines', 2, 3, 2, CAST(32.00 AS Numeric(18, 2)), CAST(150.0000 AS Numeric(18, 4)), CAST(2.570 AS Numeric(18, 3)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id], [Nombres], [Estado]) VALUES (1, N'La fabril S.A', 1)
INSERT [dbo].[Proveedores] ([Id], [Nombres], [Estado]) VALUES (2, N'PEPSICO S.A', 1)
INSERT [dbo].[Proveedores] ([Id], [Nombres], [Estado]) VALUES (3, N'INALECSA S.A', 1)
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
ALTER TABLE [dbo].[Historial_P]  WITH CHECK ADD  CONSTRAINT [FK_Historial_P_Categorias] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Historial_P] CHECK CONSTRAINT [FK_Historial_P_Categorias]
GO
ALTER TABLE [dbo].[Historial_P]  WITH CHECK ADD  CONSTRAINT [FK_Historial_P_Marcas] FOREIGN KEY([Marca])
REFERENCES [dbo].[Marcas] ([Id])
GO
ALTER TABLE [dbo].[Historial_P] CHECK CONSTRAINT [FK_Historial_P_Marcas]
GO
ALTER TABLE [dbo].[Historial_P]  WITH CHECK ADD  CONSTRAINT [FK_Historial_P_Proveedores] FOREIGN KEY([Proveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[Historial_P] CHECK CONSTRAINT [FK_Historial_P_Proveedores]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([Marca])
REFERENCES [dbo].[Marcas] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([Proveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
/****** Object:  StoredProcedure [dbo].[spConsulCategories]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spConsulCategories]
AS
BEGIN
	select	
	c.Id,
	c.Nombres
	from Categorias c	
END

GO
/****** Object:  StoredProcedure [dbo].[spConsulMarcas]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spConsulMarcas]
AS
BEGIN
	select	
	m.Id,
	m.Nombre
	from Marcas as m	
END

GO
/****** Object:  StoredProcedure [dbo].[spConsulProducts]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsulProducts]
AS
BEGIN
	SET NOCOUNT ON;
	select
	p.Id,	
	P.Descripcion,
	C.Nombres as Categoria,
	Pr.Nombres as Proveedor,
	M.Nombre as Marca,
	P.Medidas,
	P.Cantidad,
	P.PrecioUnitario as Precio
	from Productos P
	inner join Proveedores Pr on P.Proveedor = Pr.Id
	inner join Categorias C on P.Categoria = C.Id
	inner join Marcas M on P.Marca = M.Id
END

GO
/****** Object:  StoredProcedure [dbo].[spConsultaProductsById]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaProductsById] (@Id int)
AS
BEGIN
	select
	p.Id,	
	P.Descripcion,
	p.Marca,
	p.Proveedor,
	p.Categoria,
	P.Medidas,
	P.Cantidad,
	P.PrecioUnitario as Precio
	from Productos P where p.Id = @Id

END

GO
/****** Object:  StoredProcedure [dbo].[spConsultaProveedor]    Script Date: 01/07/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spConsultaProveedor]
AS
BEGIN
	select	
	p.Id,
	p.Nombres	
	from Proveedores as p	
END

GO
