-- 1. (1 pto.) Muestra un listado de todas las facturas realizadas en febrero de 2023. 

--La información que se mostrará será el número de la factura junto con su fecha, las diferentes líneas que tenga
-- la factura (NUMERO_LINEA) con la descripción del producto que figura en cada línea y el
-- importe de la línea (CANTIDAD * PVP_UNIDAD).
-- Ordena el resultado por nº de factura y nº de línea de factura.
-- Ten en cuenta los siguientes formatos:

-- • La fecha de la factura se mostrará con 2 dígitos para el día, el nombre del mes abreviado y
-- el año con 4 dígitos, utilizando el guion como carácter separador.
-- • La descripción del producto se mostrará en mayúsculas.
-- • El importe de línea se mostrará con separador de miles y 3 decimales

select lineas_fac.numero_fac,to_char(facturas.fecha_fac, 'dd-Mon-yyyy')"FECHA_FAC",
lineas_fac.numero_linea, upper(productos.descripcion)"DESCRIPCION",
to_char((lineas_fac.cantidad * productos.pvp_unidad),'99.999') "IMPORTE"
from facturas, lineas_fac,productos
order by facturas.numero_fac, lineas_fac.numero_linea;

-- 2. (1 pto.) Muestra un listado de las facturas con sus totales factura. Ordena el resultado
-- descendentemente por fecha de la factura

select facturas.numero_fac
from facturas, lineas_fac
where facturas.numero_fac = lineas_fac.numero_fac
group by facturas.fecha_fac;
		-- El total de cada factura se calcula sumando los importes de todas sus líneas

-- 3. (1 pto.) Muestra un listado de los productos (DESCRIPCIÓN) vendidos.

	-- Resuelve la consulta sin utilizar subconsultas

select productos.descripcion,lineas_fac.cantidad
from productos, lineas_fac
where lineas_fac. cod_producto = productos.cod_producto;

-- 4. (1 pto.) Muestra un listado resumen de las cantidades vendidas de cada producto, mostrando
-- el nombre del producto y la cantidad total vendida del producto.

select productos.descripcion, sum(lineas_fac.cantidad) "CANTIDAD TOTAL VENDIDA"
from productos,lineas_fac
where productos.cod_producto = lineas_fac.cod_producto
group by productos.descripcion;

		--  (0,5 ptos.) Modifica la consulta adecuadamente para que aquellos productos que no
		-- se han vendido también aparezcan con un total de ventas igual a 0

select productos.descripcion, nvl(sum(lineas_fac.cantidad),0) "CANTIDAD TOTAL VENDIDA"
from productos,lineas_fac
where productos.cod_producto = lineas_fac.cod_producto(+)
group by productos.descripcion;

-- 5. (1 pto.) Muestra los productos (DESCRIPCION) cuyas ventas superan el 25% de la media de
-- ventas totales.

select productos.descripcion, productos.lineas_fac.cantidad
from productos, lineas_fac
where productos.cod_producto = lineas_fac.cod_producto and lineas_fac.cantidad > 
(select lineas_fac.cantidad
from lineas_fac
where avg(lineas_fac.cantidad)> 0.25
group by lineas_fac.cantidad);   

-- 6. (1 pto.) Inserta en la tabla TOP_VENTAS las facturas de más de 300 €


insert into TOP_VENTAS(
select facturas.numero_fac,productos.pvp_unidad
from productos,facturas
where productos.pvp_unidad > 300   
);

-- 7. (1 pto.) Reduce en un 10% el precio de los productos de los que se han vendido menos de 10
-- unidades.

update productos
set pvp_unidad = pvp_unidad - 0.10

-- 8. (1 pto.) Elimina los productos de los que no se ha vendido ninguna unidad.

delete from productos
where exists (select productos.descripcion, sum(lineas_fac.cantidad) "CANTIDAD TOTAL VENDIDA"
from productos,lineas_fac
where productos.cod_producto = lineas_fac.cod_producto
and lineas_fac.cantidad is null
group by productos.descripcion);
		--  Utiliza el test EXIST para resolver la consulta