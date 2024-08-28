/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */

/* ==================================
 * ======= TABLA PROVEEDORES ========
 * ================================== */

/* Mostrar todos los proveedores */
select * from proveedores;

/* Proveedores ordenados por Empresa */
select * from proveedores order by empresa;

/* Proveedores cuyos Productos sean Bebidas */
select * from proveedores 
where tipo_producto like '%Bebidas%' 
   or tipo_producto like '%bebidas%';

/* Productos que sean Verduras o Frutas */
select * from proveedores 
where tipo_producto like '%Verduras%' 
   or tipo_producto like '%Frutas%';

/* Productos que sean Lacteos */
select * from proveedores 
where tipo_producto like '%Lacteos%';

/* ==================================
 * ======= TABLA PRODUCTOS ========
 * ================================== */

/* Mostrar todos los productos */
select * from productos;

/* Todos los Productos cuyo peso sea 1 kilo o menos */
select * from productos where peso <= 1;

/* Todos los Productos cuyo peso sea mayor a 1 kilo */
select * from productos where peso > 1;

/* Productos Ordenados por Id del Proveedor */
select * from productos order by id_proveedor;

/* Productos cuyo Proveedor sea Nestle */
select * from productos 
join proveedores on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Nestlé';

/* Productos cuyo Proveedor sea Huella Natural */
select * from productos 
join proveedores on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Huella Natural';

/* Productos cuyo Proveedor sea Huella Natural con stock menor de 100 */
select * from productos 
join proveedores on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Huella Natural' 
  and productos.stock <= 100;

/* Productos cuyo Proveedor sea Huella Natural con stock mayor de 100 */
select * from productos 
join proveedores on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Huella Natural' 
  and productos.stock >= 100;

/* Productos cuyo Proveedor no tenga especificacion con stock mayor a 200 */
select * from productos 
join proveedores on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Sin Especificar' 
  and productos.stock >= 200;

/* ==================================
 * ======= TABLA EMPLEADOS ========
 * ================================== */

/* Mostrar todos los empleados */
select * from empleados;

/* Empleados ordenados de forma creciente segun su Antiguedad, solo nombre, apellido y antiguedad */
select nombre, apellido, antiguedad from empleados 
order by antiguedad;

/* Empleados ordenados de forma decreciente segun su Antiguedad, solo nombre, apellido y antiguedad */
select nombre, apellido, antiguedad from empleados 
order by antiguedad desc;

/* Empleados ordenados de forma decreciente segun su Antiguedad, solo nombre, apellido, antiguedad, y salario_anual */
select nombre, apellido, cargo, antiguedad, salario_anual from empleados 
order by antiguedad desc;

/* Empleados Ordenados segun el salario, solo manejo de campos necesarios */
select nombre, apellido, cargo, antiguedad, salario_anual
from empleados 
order by salario_anual;

/* Empleados ordenados por fecha de nacimiento */
select nombre, apellido, edad, fecha_nac, cargo, antiguedad, salario_anual
from empleados 
order by fecha_nac;

/* ==================================
 * ======= TABLA CLIENTES ========
 * ================================== */

/* Mostrar todos los clientes */
select * from clientes;

/* Clientes ordenados por nro de doc */
select * from clientes order by nro_doc;

/* Clientes que manejen hotmail */
select * from clientes 
where email like '%hotmail%' 
order by nombre;

/* ==================================
 * ======= TABLA FACTURAS ========
 * ================================== */

/* Mostrar todas las facturas */
select * from facturas;

/* Facturas ordenadas segun numero */
select * from facturas order by numero;

/* Facturas ordenadas segun numero donde el importe sea menor a $2000 */
select * from facturas 
where importe_total <= 2000 
order by numero;

/* Facturas ordenadas segun numero donde el importe sea mayor a $1000 */
select * from facturas 
where importe_total > 1000 
order by numero;

/* Facturas Ordenadas por fecha y hora */
select * from facturas 
order by fecha, hora;

/* Facturas Ordenadas por fecha y hora ultimas */
select * from facturas 
order by fecha, hora desc;

/* ========================================
 * ======= TABLA FACTURAS_DETALLES ========
 * ======================================== */

/* Mostrar todos los detalles de facturas */
select * from facturas_detalles;

/* Facturas Detalles Ordenadas por tipo */
select * from facturas_detalles 
order by tipo;

/* Facturas Detalles Ordenadas por id de factura */
select * from facturas_detalles 
order by id_factura;

/* Consultas adicionales utilizando JOINs */

/* Mostrar productos junto con sus proveedores */
select productos.*, proveedores.empresa 
from productos 
join proveedores on productos.id_proveedor = proveedores.id;

/* Mostrar facturas junto con detalles de facturas */
select facturas.*, facturas_detalles.tipo
from facturas 
join facturas_detalles on facturas.numero::text = facturas_detalles.id_factura::text;


/* Mostrar proveedores junto con los productos que suministran */
select proveedores.empresa, productos.nombre 
from proveedores 
join productos on proveedores.id = productos.id_proveedor;


/* Mostrar el proveedor con el mayor número de productos */
select proveedores.empresa, count(productos.id) as num_productos 
from proveedores 
left join productos on proveedores.id = productos.id_proveedor
group by proveedores.empresa
order by num_productos desc;
