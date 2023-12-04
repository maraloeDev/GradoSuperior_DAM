-- a)

--MACARENA: Faltan todas las restricciones menos la PK
create table A(
    a1		NUMBER(3)	PRIMARY KEY,	
    a2		DATE,
    a3		NUMBER(8,2),
    A_a1	NUMBER(3),
    b1		VARCHAR2(5),
    b2		NUMBER(2)
);

--MACARENA: Faltan restricciones. Y la PK es incorrecta porque es de 2 columnas (b1 y b2)
create table B(
    b1	VARCHAR2(5)	PRIMARY KEY,
    b2	NUMBER(2),
    b3	VARCHAR2(100)   CHECK("Valor1" || "Valor2"),
    a1	NUMBER(3)
);

-- b) Modificaciones:

-- • (0,5 ptos.) Modifica la columna b3 de la tabla B para que pueda almacenar cadenas
-- de como máximo 6 caracteres.
	alter table A
MODIFY (
    A3	VARCHAR2(6)
);


-- • (0,5 ptos.) Haz que la columna a2 de la tabla A almacene valores únicos.

ALTER TABLE A
MODIFY(
    A2	UNIQUE
);

-- C) Comprobaciones:
--MACARENA: Filtrar por las tablas creadas.

-- • (0,5 ptos.) Muestra el tablespace en el que se han creado las tablas .
select * from user_tables;

-- • (0,5 ptos.) Muestra las restricciones creadas en las tablas.
select * from user_constraints;

-- d) (1 pto.) Haz que la columna a1 sea autonumérica (con incremento de uno en uno,
-- empezando por el valor 1).

-- e) (1 pto.) Indexa la tabla B por la columna a1, a continuación, muestra los índices de las
-- tablas.
--MACARENA: ... falta 
CREATE INDEX indice 

-- (1 pto.) ¿Bajo qué condiciones crees que es una buena elección crear este índice?
-- La creacion de el anterior indice es una buena practica, debido a que el acceso a la tabla es más sencillo 
--(Se accede a la tabla mas rapidamente)

-- f) (2 ptos.) Crea una vista (con comprobación de operaciones de manipulación de datos)
-- llamada “Prejubilados” que muestre los datos de los empleados que tengan una
-- experiencia en la empresa de 61 años o más.
-- Una vez creada, muestra las vistas disponibles en el esquema.

--MACARENA: CHECK??
   CREATE VIEW PREJUBILADOS
AS
    SELECT hr.employees.HIRE_DATE
    FROM hr.employees
    check(hr.employees.HIRE_DATE>= 61);

--MACARENA: OK
select * from user_views;