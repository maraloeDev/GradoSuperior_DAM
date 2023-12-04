
*/ CONSULTAS */

-- 1 Muestra las asignaturas que contengan tres letras "o" y tengan alumnos matriculados de "Madrid"
--> 0
select asignaturas.nombre, alumnos.pobla
from asignaturas, alumnos
where alumnos.pobla like 'Madrid';

-- 2 Muestra los nombres de los alumnos de "Madrid" con alguna asignatura suspensa.
--  Resuelve la consulta de 2 formas diferentes

--PRIMERA FORMA
--> 0 FALTA JOIN
select distinct alumnos.apenom, alumnos.pobla, asignaturas.nombre, notas.nota
from alumnos,asignaturas,notas
where alumnos.pobla like 'Madrid'
and notas.nota < 5;
-- SEGUNDA FORMA
--> 0,5
select distinct alumnos.apenom, alumnos.pobla, asignaturas.nombre, notas.nota
from alumnos,asignaturas,notas
where alumnos.dni = notas.dni and notas.cod = asignaturas.cod 
and alumnos.pobla like 'Madrid'
and notas.nota < 5;

-- 3 Muestra los nombres de los alumnos con una nota entre 7 y 8 en la asignatura de "FOL".
--> 0,25 FALTA CONDICIÓN DEL JOIN
select distinct alumnos.apenom, notas.nota, asignaturas.nombre
from alumnos, notas, asignaturas
where notas.nota between 7 and 8
and asignaturas.nombre like 'FOL';

-- 4 Crea una tabla llama APROBADOS, con el DNI, nombre y apellidos (en dos columnas 
--  diferentes), de los alumnos que han obtenido al menos 5 puntos de alguna asignatura.
--> 0,25 SELECT ERRÓNEO Y NO SE CORRESPONDEN COLUMNAS DEL SELECT CON INSERT

create table APROBADOS(

    DNI		number(10),
    NOMBRE	varchar2(100),
    APELLIDOS	varchar2(100)
);

insert into APROBADOS(

    select alumnos.apenom,notas.nota,asignaturas.nombre "PUNTO"
    from alumnos,notas,asignaturas
    where notas.cod = asignaturas.cod
    and notas.nota = 5
);

-- 4 Muestra por cada centro y en cada especialidad el número de profesores. Si el centro
--  no tiene profesores, debe aparecer un 0 como número de profesores. Las columnas a visualizar
-- son: nombre del centro, especialidad y número de profesores.
--> 0,75 LA FUNCIÓN NVL NO HACE FALTA
select distinct centros.nombre "NOMBRE DEL CENTRO", profesores.especialidad, 
nvl(count (profesores.apellidos), 0) "NUMERO DE PROFESORES"
from centros,profesores
where profesores.cod_centro = centros.cod_centro(+)
group by centros.nombre,profesores.especialidad;

-- 5 Muestra la especialidad con menos profesores
--> 0
select count(apellidos), especialidad
from profesores
where apellidos < 1
group by apellidos,especialidad;

-- 6 Actualiza el nº de plazas a la mitad, de los centros con un nº de plazas inferior al
--  promedio de plazas de todos los centros.
--> SINTAXIS DE UPDATE INCORRECTA
update centros

	modify(
   set num_plazas = select avg(num_plazas)
    );

-- 7 Elimina el banco con más sucursales.
--> 0
delete from bancos
where  sucursales.cod_banco = bancos.cod_banco;

-- 8 Muestra el saldo de los bancos de 'GUADALAJARA', visualizando una fila por cada
--  banco con las siguientes columnas: nombre del banco, saldo debe y saldo haber.
--> 0  FALTA JOIN Y ES UNA CONSULTA AGRUPADA
select bancos.nombre_banc "NOMBRE DEL BANCO", cuentas.saldo_debe "SALDO DEBE",cuentas.saldo_haber "SALDO HABER"
from bancos,cuentas
where bancos.nombre_banc like '%GUADALAJARA%';

(Correccion casa)
select bancos.nombre_banc "NOMBRE DEL BANCO", cuentas.saldo_debe "SALDO DEBE",cuentas.saldo_haber "SALDO HABER"
from bancos,cuentas
where bancos.cod_banco =  cuentas.cod_banco and 
bancos.nombre_banc like '%GUADALAJARA%'; (No es lo mismo por que solamente te saca 2 bancos, y no todos)