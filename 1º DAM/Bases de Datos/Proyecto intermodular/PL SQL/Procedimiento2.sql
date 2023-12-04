--2. Procedimiento que te imprime los meses de las fechas de acceso en español
create or replace procedure translate_dates
is
 cursor dates is select numero_acceso, fecha_acceso from acceso;
 mes char(15); 	--el mes a traducir 
begin
	for d in dates
	loop 
		mes := upper(to_char(d.fecha_acceso, 'Month'));
		dbms_output.put_line('ACCESO. numero_acceso: ' || d.numero_acceso || 'mes acceso(original): ' || mes);
		case mes
		when 'JANUARY' then
			mes := 'ENERO';
		when 'FEBRUARY' then
			mes := 'FEBRERO';
		when 'MARCH' then
			mes := 'MARZO';
		when 'APRIL' then
			mes := 'ABRIL';
		when 'MAY' then
			mes := 'MAYO';
		when 'JUNE' then
			mes := 'JUNIO';
		when 'JULY' then
			mes := 'JULIO';
		when 'AUGUST' then
			mes := 'AGOSTO';
		when 'SEPTEMBER' then
			mes := 'SEPTIEMBRE';
		when 'OCTOBER' then
			mes := 'OCTUBRE';
		when 'NOVEMBER' then
			mes := 'NOVIEMBRE';
		when 'DECEMBER' then
			mes := 'DICIEMBRE';
		else
            mes := 'error';
		end case;
		dbms_output.put_line('ACCESO. id_acceso: ' || d.numero_acceso || ' - fecha_acceso(traducida): ' || mes);
	end loop;
end translate_dates;

