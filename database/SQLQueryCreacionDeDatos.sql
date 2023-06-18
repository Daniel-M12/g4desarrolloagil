use market4;
go
/*
--Insertar en tabla categoria el id es autoincremental 
insert into Categoria (Nom_categoria) values ('Panaderia y Pasteleria'); 
insert into Categoria ( Nom_categoria) values ('Frutas y Verduras'); 
insert into Categoria ( Nom_categoria) values ('Aguas y Bebidas'); 
insert into Categoria ( Nom_categoria) values ('Abarrotes'); 
  go

  --insertar en tabla productos relacionado con la categoria "abarrotes"

	  -- Obtener el Id_categoria de la tabla Categoria para el Nom_categoria 'Abarrotes'
DECLARE @Id_categoria int;
SELECT @Id_categoria = Id_categoria FROM Categoria WHERE Nom_categoria = 'Abarrotes';

-- Insertar en tabla Producto utilizando el Id_categoria obtenido
--insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Aceite Primor','Clasico 900ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Aceite Primor','Premiun 900ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Arroz Costeño','Extra 750gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Arroz Faraon','Extra Añejo 750gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Arroz Paisana',' Superior 750gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Arroz Paisana',' Superior 750gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Arroz Paisana',' Superior 750gr', @Id_categoria);


   --insertar en tabla productos relacionado con la categoria "Aguas y Bebidas"
   	  -- Obtener el Id_categoria de la tabla Categoria para el Nom_categoria 'Aguas y Bebidas'
DECLARE @Id_categoria int;
SELECT @Id_categoria = Id_categoria FROM Categoria WHERE Nom_categoria = 'Aguas y Bebidas';
-- Insertar en tabla Producto utilizando el Id_categoria obtenido
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Cielo',' Agua Sin Gas 625ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Cielo','Agua Con Gas 625ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Pepsi','Gaseosa 600ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Coca Cola','Gaseosa 500ml', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Inka Cola','Gaseosa 500ml', @Id_categoria);

     
--insertar en tabla productos relacionado con la categoria "Frutas y Verduras"
	  -- Obtener el Id_categoria de la tabla Categoria para el Nom_categoria 'Frutas y Verduras'
	DECLARE @Id_categoria int;
	SELECT @Id_categoria = Id_categoria FROM Categoria WHERE Nom_categoria = 'Frutas y Verduras';
-- Insertar en tabla Producto utilizando el Id_categoria obtenido
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Fresa','paquete 125gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Fresa','Paquete 500gr', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('PLatano','De Seda X kilo', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('PLatano','De Isla X kilo', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('PLatano','Bllaco X unidad', @Id_categoria);

  -- Obtener el Id_categoria de la tabla Categoria para el Nom_categoria 'Panaderia y Pasteleria'
	DECLARE @Id_categoria int;
	SELECT @Id_categoria = Id_categoria FROM Categoria WHERE Nom_categoria = 'Panaderia y Pasteleria';
-- Insertar en tabla Producto utilizando el Id_categoria obtenido
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Pan Frances','Unidad', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Pan Ciabatta','Unidad', @Id_categoria);
  insert into Producto (Nom_producto, Desc_producto, Id_categoria) values ('Pan Brioche','Bolsa de 5', @Id_categoria);
  

	--Insertar en tabla Usuario - el id es autoincremental 
insert into Usuario(Nom_usuario,Ape_usuario,Correo,pass) values ('Jhon','Cena','jhon.cina@hotimail.com','Jc123456'); 
insert into Usuario(Nom_usuario,Ape_usuario,Correo,pass) values ('Pedro','Infante','pedrito.infa@hotimail.com','Pi123456'); 
insert into Usuario(Nom_usuario,Ape_usuario,Correo,pass) values ('Juanito','Izquierdo','juanito.izq@hotimail.com','Ji123456'); 
insert into Usuario(Nom_usuario,Ape_usuario,Correo,pass) values ('Juanito','Derechi','juanito.der@hotimail.com','Jd123456'); 
insert into Usuario(Nom_usuario,Ape_usuario,Correo,pass) values ('Abarrotes','Don PEPE','jrepresentante.pep@hotimail.com','Dp123456'); 

  go

-
  
  --Insertar en tabla Tarjeta - el id es autoincremental 
-- Obtener el Id_usuario de la tabla Usuario para el Correo 'jrepresentante.pep@hotimail.com'
	DECLARE @Id_usuario int;
	SELECT @Id_usuario = Id_usuario FROM Usuario WHERE Correo = 'jrepresentante.pep@hotimail.com';
-- Insertar en tabla Producto utilizando el Id_usuario obtenido
    insert into Tarjeta (num_tarjeta, fecha_tarjeta, CV_tarjeta, Id_usuario) values ('1234567891234567','2027-05-30','123', @Id_usuario);
    insert into Tarjeta (num_tarjeta, fecha_tarjeta, CV_tarjeta, Id_usuario) values ('1234567891234598','2028-08-30','123', @Id_usuario);
	 

	  --Insertar en tabla Empresa 
    insert into Empresa(RUC, Nom_empresa, Dir_empresa,Tel_empresa) values ('98765432145','Bodega Pepito','Av, El parque 780 Surquillo','23546879');
	
	--delete from Empresa
	--select * from Empresa

	 
	   --Insertar en tabla Proveedores
--insertar en tabla Proveedores relacionado con la RUC y Id_usuario
	  -- Obtener el Id_usuario de la tabla Usuario y el RUC de la tabla empresas, utiizr el campo Correo y Nom_empresa
	
	DECLARE @Id_usuario int;
	DECLARE @RUC varchar(11);
	
	SELECT @Id_usuario = Id_usuario FROM Usuario WHERE Correo = 'jrepresentante.pep@hotimail.com';
	SELECT @RUC = RUC FROM Empresa WHERE Nom_empresa = 'Bodega Pepito';
-- Insertar en tabla Producto utilizando el Id_categoria obtenido
   insert into Proveedor (fecha_inicio,RUC,Id_usuario) values ('2023-03-30',@RUC, @Id_usuario);

   --delete from Proveedor
  select *from Proveedor


  
   --Insertar en tabla Listadetalle
--insertar en tabla Listadetalle relacionado con el Id_proveedor y Id_producto
	  --Obtener el Id_usuario de la tabla Usuario para el Nom_categoria 'Frutas y Verduras'
	
	DECLARE @Id_proveedor int;
	DECLARE @Id_producto int;
	
	SELECT @Id_proveedor = Id_proveedor FROM Proveedor WHERE RUC = '98765432145';
	--SELECT @Id_producto = Id_producto FROM Producto WHERE Id_producto = 8;
	--SELECT @Id_producto = Id_producto FROM Producto WHERE Id_producto = 9;
	SELECT @Id_producto = Id_producto FROM Producto WHERE Id_producto = 10;
-- Insertar en tabla Listadetalle utilizando el Id_categoria obtenido
   --insert into Listadetalle (Precio,fec_activa,cantidad,Id_proveedor,Id_producto) values (11.50,'2023-08-20', 7,@Id_proveedor,@Id_producto);
   --insert into Listadetalle (Precio,fec_activa,cantidad,Id_proveedor,Id_producto) values (14.50,'2023-08-20', 7,@Id_proveedor,@Id_producto);
   insert into Listadetalle (Precio,fec_activa,cantidad,Id_proveedor,Id_producto) values (4.50,'2023-08-20', 7,@Id_proveedor,@Id_producto);

  
  */

     --Insertar en tabla Facturacion
--insertar en tabla Fcturacion relacionado con el Id_usuario y Id_producto
	  -- Obtener el Id_usuario de la tabla Usuario y el RUC de la tabla empresas, utiizr el campo Correo y Nom_empresa
	
	DECLARE @Id_usuario int;
	DECLARE @Id_producto int;
	
	SELECT @Id_usuario = Id_usuario FROM Usuario WHERE Correo = 'pedrito.infa@hotimail.com';
	SELECT @Id_producto = Id_producto FROM Listadetalle WHERE Id_listadetalle = 3;
-- Insertar en tabla Producto utilizando el Id_categoria obtenido
   insert into Facturacion(Fecha_fact,Id_producto,Id_usuario,Cantidad,Precio) values ('2023-06-17',@Id_producto, @Id_usuario, 2, 10.5);
     
  --delete from Listadetalle
  select *from Facturacion