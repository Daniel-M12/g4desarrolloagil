use market4;

create table Usuario (
Id_usuario int Identity (1,1) primary key,
Nom_usuario varchar(60),
Ape_usuario varchar(60),
Correo varchar(60),
pass varchar(20)
);

create table Categoria (
Id_categoria int Identity (1,1) primary key,
Nom_categoria varchar (30)
);

create table Empresa(
RUC varchar(11)  primary key,
Nom_empresa varchar(30),
Dir_empresa varchar(40),
Tel_empresa varchar(9)
);

create table Proveedor(
Id_proveedor int identity (1,1) primary key,
Fecha_inicio date,
RUC varchar(11),
Id_usuario int,
FOREIGN KEY (RUC) REFERENCES Empresa (RUC),
FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);

--alter table Proveedor add CONSTRAINT fk_Empresa FOREIGN KEY  REFERENCES Empresa (RUC);
--alter table Proveedor add CONSTRAINT fk_Usuario FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario);

create table Producto(
Id_producto int identity(1,1) primary key,
Nom_producto varchar(30),
Desc_producto varchar(60),
Id_categoria int,
FOREIGN KEY (Id_categoria) REFERENCES Categoria (Id_categoria)
);

--alter table Producto add CONSTRAINT fk_Categoria FOREIGN KEY (Id_categoria,Categoria) REFERENCES Categoria (Id_categoria);

create table Listadetalle(
Id_listadetalle int identity(1,1) primary key,
Precio float,
fec_activa date,
cantidad int,
Id_proveedor int,
Id_producto int,
FOREIGN KEY (Id_proveedor) REFERENCES Proveedor (Id_proveedor),
FOREIGN KEY (Id_producto) REFERENCES Producto (Id_producto)
);

--alter table Listadetalle add CONSTRAINT fk_Proveedor FOREIGN KEY (Id_proveedorProveedor) REFERENCES Proveedor (Id_proveedor);
--alter table Listadetalle add CONSTRAINT fk_Producto FOREIGN KEY (Id_productoProducto) REFERENCES Producto (Id_producto);

create table Tarjeta(
Id_tarjeta int identity(1,1) primary key,
num_tarjeta varchar(16),
fecha_tarjeta date,
CV_tarjeta char(3),
Id_usuario int,
FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);
--alter table Tarjeta add CONSTRAINT fk_Usuario FOREIGN KEY (Id_usuarioUsuario) REFERENCES Usuario (Id_usuario);


create table Facturacion (
Id_facturacion int identity(1,1),
Fecha_fact date,
Id_producto int,
Id_usuario int,
Precio float,
Cantidad int,
FOREIGN KEY (Id_producto) REFERENCES Producto (Id_producto),
FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);
--alter table Facturacion add CONSTRAINT fk_Producto FOREIGN KEY (Id_productoProducto) REFERENCES Producto (Id_producto);
--alter table Facturacion add CONSTRAINT fk_Usuario FOREIGN KEY (Id_usuarioUsuario) REFERENCES Usuario (Id_usuario);

