REM ***************** TABLAS ALUMNOS, ASIGNATURAS Y NOTAS: ******************

DROP TABLE ALUMNOS cascade constraints;

CREATE TABLE ALUMNOS
(
  DNI VARCHAR2(10) NOT NULL,
  APENOM VARCHAR2(30),
  DIREC VARCHAR2(30),
  POBLA  VARCHAR2(15),
  TELEF  VARCHAR2(10)  
);

DROP TABLE ASIGNATURAS cascade constraints;

CREATE TABLE ASIGNATURAS
(
  COD NUMBER(2) NOT NULL,
  NOMBRE VARCHAR2(25)
);

DROP TABLE NOTAS cascade constraints;

CREATE TABLE NOTAS
(
  DNI VARCHAR2(10) NOT NULL,
  COD NUMBER(2) NOT NULL,
  NOTA NUMBER(2)
);

INSERT INTO ASIGNATURAS VALUES (1,'Programacion');
INSERT INTO ASIGNATURAS VALUES (2,'Sist. Informaticos');
INSERT INTO ASIGNATURAS VALUES (3,'Analisis');
INSERT INTO ASIGNATURAS VALUES (4,'FOL');
INSERT INTO ASIGNATURAS VALUES (5,'RET');
INSERT INTO ASIGNATURAS VALUES (6,'Entornos Graficos');
INSERT INTO ASIGNATURAS VALUES (7,'Entornos');
INSERT INTO ASIGNATURAS VALUES (8,'Idioma');


INSERT INTO ALUMNOS VALUES
('12344345','Alcalde Garcia, Elena', 'C/Las Matas, 24','Madrid','917766545');

INSERT INTO ALUMNOS VALUES
('4448242','Cerrato Vela, Luis', 'C/Mina 28 - 3A', 'Madrid','916566545');

INSERT INTO ALUMNOS VALUES
('56882942','Diaz Fernandez, Mar�a', 'C/Luis Vives 25', 'Mostoles','915577545');

INSERT INTO NOTAS VALUES('12344345', 1,6);
INSERT INTO NOTAS VALUES('12344345', 2,5);
INSERT INTO NOTAS VALUES('12344345', 3,6);

INSERT INTO NOTAS VALUES('4448242', 4,6);
INSERT INTO NOTAS VALUES('4448242', 5,8);
INSERT INTO NOTAS VALUES('4448242', 6,4);
INSERT INTO NOTAS VALUES('4448242', 7,5);

INSERT INTO NOTAS VALUES('56882942', 4,8);
INSERT INTO NOTAS VALUES('56882942', 5,7);
INSERT INTO NOTAS VALUES('56882942', 6,8);
INSERT INTO NOTAS VALUES('56882942', 7,9);

COMMIT;


REM *************************************************************************
REM ********************** TABLAS CENTROS y PROFESORES **********************

DROP TABLE PROFESORES cascade constraints; 

CREATE TABLE PROFESORES (
 COD_CENTRO   NUMBER(4) NOT NULL,
 DNI          NUMBER(10),
 APELLIDOS VARCHAR2(30),
 ESPECIALIDAD VARCHAR2(16) 
) ;


INSERT INTO PROFESORES VALUES (10,1112345,'Martinez Salas, Fernando',
'INFORM�TICA');
INSERT INTO PROFESORES VALUES (10,4123005,'Bueno Zarco, Elisa', 
'MATEM�TICAS');
INSERT INTO PROFESORES VALUES (10,4122025,'Montes Garcia, M.Pilar', 
'MATEM�TICAS');

INSERT INTO PROFESORES VALUES (15,9800990, 'Ramos Ruiz, Luis',
	'LENGUA');
INSERT INTO PROFESORES VALUES (15,1112345,'Rivera Silvestre, Ana',
	'DIBUJO');
INSERT INTO PROFESORES VALUES (15,8660990, 'De Lucas Fdez, M.Angel',
'LENGUA');

INSERT INTO PROFESORES VALUES (22,7650000, 'Ruiz Lafuente, Manuel',
'MATEM�TICAS');
INSERT INTO PROFESORES VALUES (45,43526789, 'Serrano Laguna, Maria',
'INFORM�TICA');

DROP TABLE CENTROS cascade constraints; 

CREATE TABLE CENTROS (
 COD_CENTRO   NUMBER(4) NOT NULL,
 TIPO_CENTRO  CHAR(1),
 NOMBRE VARCHAR2(30),
 DIRECCION VARCHAR2(26),
 TELEFONO VARCHAR2(10),
 NUM_PLAZAS NUMBER(4)
 ) ;


INSERT INTO CENTROS VALUES (10,'S','IES El Quijote', 
'Avda. Los Molinos 25', '965-887654',538);
INSERT INTO CENTROS VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n',
'985-112322',250);
INSERT INTO CENTROS VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45',
'925-443400',300);
INSERT INTO CENTROS VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5',
'926-202310',220);
INSERT INTO CENTROS VALUES (50,'S', 'IES Anto�ete', 'C/Los Toreros 21',
'989-406090',310);

commit;

REM ***********************************************************************

REM ***************** TABLAS BANCOS, SUCURSALES Y CUENTAS *****************

drop table BANCOS cascade constraints;
drop table SUCURSALES cascade constraints;
drop table CUENTAS cascade constraints;

Create TABLE   BANCOS(
COD_BANCO   NUMBER(4) PRIMARY KEY,
NF_BANCO    VARCHAR2(10),
NOMBRE_BANC VARCHAR2(30),
DOM_FISCAL  VARCHAR(35),
POBLACION   VARCHAR(35)
);


Create TABLE  SUCURSALES(
COD_BANCO   NUMBER(4),
COD_SUCUR   NUMBER (4),
NOMBRE_SUC  VARCHAR2(35),
DIREC_SUC   VARCHAR2(35),
LOC_SUC     VARCHAR2(20),
PROV_SUC    VARCHAR2(20),
PRIMARY KEY (COD_BANCO,COD_SUCUR)
);	

Create TABLE   CUENTAS(
COD_BANCO   NUMBER(4),
COD_SUCUR   NUMBER(4),
NUM_CTA     NUMBER(10) ,
FECHA_ALTA  DATE,
NOMBRE_CTA  VARCHAR2(35),
DIREC_CTA   VARCHAR2(35),
POBLA_CTA   VARCHAR2(20),
SALDO_DEBE  NUMBER(10),
SALDO_HABER NUMBER(10),
PRIMARY KEY (COD_BANCO,COD_SUCUR,NUM_CTA)
);


INSERT INTO BANCOS VALUES(1111,'122322223','BANCO DE ESPA�A','GRAN VIA','MADRID');
INSERT INTO BANCOS VALUES(1112,'222322223','BANCO DE GUADALAJARA','MAYOR','GUADALAJARA');
INSERT INTO BANCOS VALUES(1113,'322322223','BANCO POPULAR','LA PLAZA','TOLEDO');
INSERT INTO BANCOS VALUES(1114,'422322223','CAJA CM','RIO DULCE','ALBACETE');

INSERT INTO sucursales VALUES(1111, 5000,'* SUCURSAL 1*', 'ANCHA 24','TOLEDO','TOLEDO');
INSERT INTO sucursales VALUES(1111, 5001,'* SUCURSAL 2*', 'PILON 33','PASTRANA','GUADALAJARA');
INSERT INTO sucursales VALUES(1112, 6000,'* SUCURSAL 6000*', 'MAYOR 55','ALCALA','ALCALA');
INSERT INTO sucursales VALUES(1113, 4000,'* SUCURSAL 4000*', 'ERAS 77','ARANJUEZ','MADRID');

INSERT INTO CUENTAS VALUES(1111, 5000,123456789,SYSDATE -7, 'JUAN','TOLEDO','TOLEDO', 0,0);
INSERT INTO CUENTAS VALUES(1111, 5000,123456788,SYSDATE -6, 'PEDRO','TOLEDO','TOLEDO', 0,0);
INSERT INTO CUENTAS VALUES(1111, 5001,123456787,SYSDATE -100, 'ANA','GUADALAJARA','GUADALAJARA', 0,0);
INSERT INTO CUENTAS VALUES(1111, 5001,123456786,SYSDATE -6, 'MANUEL','GUADALAJARA','GUADALAJARA', 0,0);
INSERT INTO CUENTAS VALUES(1111, 5001,123456785,SYSDATE -230, 'ANDRES','ALCALA','ALCALA', 0,0);
INSERT INTO CUENTAS VALUES(1112, 6000,33334444, SYSDATE,'ISABEL','MADRID', 'MADRID', 0,0);
INSERT INTO CUENTAS VALUES(1112, 6000,33334440, SYSDATE-140,'MARIA','MADRID','MADRID', 0,0);

Commit;

*/ CONSULTAS
	-- 1 Muestra las asignaturas que contengan tres letras "o" y tengan alumnos matriculados de "Madrid"

select asignaturas.nombre, alumnos.pobla
from asignaturas, alumnos
where alumnos.pobla like 'Madrid';

-- 2 Muestra los nombres de los alumnos de "Madrid" con alguna asignatura suspensa.
--  Resuelve la consulta de 2 formas diferentes

--PRIMERA FORMA
select distinct alumnos.apenom, alumnos.pobla, asignaturas.nombre, notas.nota
from alumnos,asignaturas,notas
where alumnos.pobla like 'Madrid'
and notas.nota < 5;
-- SEGUNDA FORMA
select distinct alumnos.apenom, alumnos.pobla, asignaturas.nombre, notas.nota
from alumnos,asignaturas,notas
where alumnos.dni = notas.dni and notas.cod = asignaturas.cod 
and alumnos.pobla like 'Madrid'
and notas.nota < 5;

-- 3 Muestra los nombres de los alumnos con una nota entre 7 y 8 en la asignatura de "FOL".
select distinct alumnos.apenom, notas.nota, asignaturas.nombre
from alumnos, notas, asignaturas
where notas.nota between 7 and 8
and asignaturas.nombre like 'FOL';

-- 4 Crea una tabla llama APROBADOS, con el DNI, nombre y apellidos (en dos columnas 
--  diferentes), de los alumnos que han obtenido al menos 5 puntos de alguna asignatura.

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
select distinct centros.nombre "NOMBRE DEL CENTRO", profesores.especialidad, 
nvl(count (profesores.apellidos), 0) "NUMERO DE PROFESORES"
from centros,profesores
where profesores.cod_centro = centros.cod_centro(+)
group by centros.nombre,profesores.especialidad;

-- 5 Muestra la especialidad con menos profesores
select count(apellidos), especialidad
from profesores
where apellidos < 1
group by apellidos,especialidad;


*/
REM ******************************** FIN *********************************





