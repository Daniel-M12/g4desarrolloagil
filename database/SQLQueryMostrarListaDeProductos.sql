use market4
go
/*
select * from Producto
select * from Listadetalle
Select * from Categoria
go
*/
/*query par amostrar los productos en la lista pricipal por categoria */
--mostrar nombre de producto, desc de produc, precio, cantidad por nombre de categoria  

select p.Nom_producto, p.Desc_producto,l.precio,l.cantidad from Producto p inner join Listadetalle l 
on p.Id_producto = l.Id_producto inner join Categoria c on p.Id_categoria = c.Id_categoria
where c.Nom_categoria = 'Abarrotes';

/* query para mostrar producto pra su edicion */
-- mostrar nom_categoria,descripcion, nom_producto, precio, cantidady fecha activa 
select c.Nom_categoria, p.Nom_producto, p.Desc_producto,l.precio,l.cantidad, l.fec_activa 
from Producto p inner join Listadetalle l on p.Id_producto = l.Id_producto
inner join Categoria c on p.Id_categoria = c.Id_categoria 
inner join Proveedor pr on pr.Id_proveedor = l.Id_proveedor
where l.Id_proveedor = 11

/* query para listar los producto por proveedor */
--indicar nombre de producto, stock y fcha activa 
select p.Nom_producto,l.cantidad,l.fec_activa from Producto p inner join Listadetalle l 
on p.Id_producto = l.Id_producto 
where l.Id_proveedor = 11;
