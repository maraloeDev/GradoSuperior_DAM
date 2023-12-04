--1. Devuelve el numero de asistentes en un dia concreto pasado como parametro
create or replace function num_asistentes_fecha(fecha date) return integer
is
	v_num_acceso integer := 0;
	v_num_evento integer := 0;
	v_num_total	integer;
begin
	select count(*) into v_num_acceso from acceso where fecha_acceso=fecha;
	select count(*) into v_num_evento from evento where fecha_evento=fecha;
	v_num_total := v_num_acceso + v_num_evento;
	return v_num_total;
end num_asistentes_fecha;

--Bloque de prueba
/*begin 
	dbms_output.put_line('Gente que acude en el día 07-05-2022: ' || num_asistentes_fecha(to_date('07-05-2022','dd-mm-yyyy')));
end;*/